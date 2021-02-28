include <util.scad>
include <cherrymx.scad>
include <misc.scad>

/******************************************************************************

		Common parameters

/*****************************************************************************/
inner_height = 10;
outer_height = inner_height + switch_height;

side_wall_thick = 4;
// board clearance is measured from the switch hole
board_clearance = 2;
switch_side_clearance = switch_side_inner + board_clearance;
switch_side_outline = switch_side_inner + board_clearance + side_wall_thick;
corner_diam_inner = inset_diameter_outer + 2*board_clearance - 2*side_wall_thick;
corner_diam_outer = inset_diameter_outer;
echo(side_wall_thick);
echo(inset_diameter_outer);
echo(corner_diam_inner);

module corner_outer_2d() {
  circle(d=corner_diam_outer);
}

module corner_inner_2d() {
  circle(d=corner_diam_inner);
}

module switch_outer_2d() {
  side = switch_side_inner + board_clearance + side_wall_thick;
  square(side, center=true);
}

module switch_inner_2d() {
  side = switch_side_inner + board_clearance;
  square(side, center=true);
}

module switch_outer() {
  side = switch_side_inner + board_clearance + side_wall_thick;
  translate([0, 0, switch_height/2])
    cube([side, side, switch_height], center=true);
}

module switch_inner() {
  side = switch_side_inner + board_clearance;
  translate([0, 0, switch_height/2])
    cube([side, side, switch_height], center=true);
}


/******************************************************************************

		Main Columns patterns

/*****************************************************************************/

module column_rep(n,radius,angle_offset,angle) {
  translate([0,0,radius])
    for (row = [0:n-1] ) {
      rotate(row*angle-(n-1.5)/2*angle+angle_offset, [1,0,0])
        translate([0, 0, -radius])
          children();
  }
}

n_columns=6;
column_y_offsets = [switch_side_outer,4,9,4,4, 4 + switch_side_outer];
n_rows = [4,5,5,5,4,2];
switch_space = 0;
switch_inter_space = switch_side_outer + switch_space;

module main(col_start=0, col_n=n_columns, row_start=0, row_n=5) {

  for (col = [col_start:col_start+n_columns-1] ) {
    x_offs = col * switch_inter_space;

    row_stop = min(n_rows[col], row_start+row_n);
    for (row = [row_start:row_stop-1]) {
      y_offs = column_y_offsets[col] + row*switch_inter_space;
      translate([x_offs, y_offs, 0])
          children();
    }
  }

}

palm_switch_pos = Index2Pos(19) + [1*switch_side_outer, -1.8*switch_side_outer, 0];

function Index2ColRow(index, col=0, sum=0) =
         let (new_sum = sum + n_rows[col])
            (index <  new_sum ) ?
            [col, index - sum] : Index2ColRow(index, col+1, new_sum);

/**
 * Get position of switch at the given index
 */
function Index2Pos(index) =
         let(
                col_row = Index2ColRow(index),
                col = col_row[0],
                row = col_row[1],
                x_offs = col * switch_inter_space,
                y_offs = column_y_offsets[col] + row*switch_inter_space
            )
            [x_offs, y_offs, 0];

/******************************************************************************

		Thumb Cluster patterns

/*****************************************************************************/
module thumb_pattern() {
  radius = 80;
  angle_off = 15;
  angle_sep = 14;
  translate([radius*sin(angle_off), -radius*cos(angle_off) - 1.5,0])
    for (i = [0:2]) {
      rotate([0, 0, angle_off + i*angle_sep])
        translate([0, radius, 0])
          children();
    }
}

/******************************************************************************

		Insets

/*****************************************************************************/
thumb_x_min = -50;
thumb_y_max = Index2Pos(1)[1] - 1*switch_side_outer - 12;

insets_y_min_offset = -2*switch_side_outer - 1.5;
insets_y_min = Index2Pos(19)[1] + insets_y_min_offset;
main_x_min = Index2Pos(0)[0] + -switch_side_inner/2 - inset_diameter_outer/2 - board_clearance;
main_x_max = palm_switch_pos[0] + switch_side_inner/2 + inset_diameter_outer/2 + board_clearance;
insets_pos = [
  [thumb_x_min, thumb_y_max, 0],
  [main_x_min, thumb_y_max,0],
  [main_x_min, Index2Pos(3)[1] + 5,0],
  Index2Pos(18) + [switch_side_outer/2+14,-1,0],
  [main_x_max, Index2Pos(23)[1], 0],
  [main_x_max, palm_switch_pos[1], 0],
  [main_x_min, Index2Pos(19)[1] + insets_y_min_offset, 0],
];

module insets() {
  for (pos = insets_pos) {
    translate(pos)
      children();
  }
}


/******************************************************************************

		Thumb Cluster Assembly

/*****************************************************************************/
module usb_a_pos() {
  pos = [
    thumb_x_min,
    Index2Pos(0)[1] - 5,
    0
  ];
  translate(pos)
    rotate([0,0,90])
    children();
}

module usb_bmini_pos() {
  pos = [
    Index2Pos(3)[0] - 12,
    thumb_y_max,
    0
    ];
  translate(pos)
    children();
}


module thumbs_extend() {
  translate(insets_pos[0])
    children();
  translate(insets_pos[1])
    children();
  translate(insets_pos[6])
    children();
  translate(insets_pos[0] + [0,-20,0])
    children();
}

module thumbs_body_top() {
  translate([0,0,inner_height]) {
    thumb_pattern()
      children();
  }
}

module thumb_holes() {
  thumbs_body_top() {
    switch_neg(5);
  }

}

module thumbs_plate_inner() {
  hull() {
    thumb_pattern()
      switch_inner_2d();
    thumbs_extend()
      corner_inner_2d();
  }
}

module thumbs_plate() {
  hull() {
    thumb_pattern()
      switch_outer_2d();
    thumbs_extend()
      corner_outer_2d();
  }
}

module thumb_body_inner() {
  trim = 1;  
  translate([0,0,-trim])
    linear_extrude(height=inner_height + trim)
      thumbs_plate_inner();
}

module thumb_body_outer() {
  linear_extrude(height=inner_height + switch_height)
    thumbs_plate();
}

/******************************************************************************

		Main Assembly

/*****************************************************************************/
module main_pattern() {
  rotate([0,0,0]) {
      main()
        children();

      translate(palm_switch_pos)
        children();
   }
}

module main_switches_outline() {
  translate([0,0,inner_height])
    main_pattern()
    children();

  main_pattern()
  children();
}
module main_insets_bottom() {
  for (pos = [insets_pos[1], insets_pos[2], insets_pos[3], insets_pos[4], insets_pos[5], insets_pos[6]] ) {
    translate(pos) {
      children();
    }
  }
}

module main_insets_outline() {
  main_insets_bottom()
    children();
  translate([0,0,inner_height - inset_height_outer + switch_height])
    main_insets_bottom()
      children();
}

module main_outer() {
  hull() {
    main_switches_outline()
      switch_outer();
    main_insets_outline()
      screw_inset_pos();
  }

}

module main_inner() {
  hull() {
    translate([0, 0, -switch_height]) {
      main_switches_outline()
        switch_inner();
      #main_insets_outline()
      cylinder(d=corner_diam_inner, h=inset_height_outer);
    }
  }
}

module main_holes() {
  translate ([0, 0, inner_height]) {
    main_pattern()
      switch_neg(5);
  }
}


/******************************************************************************

		Plate

/*****************************************************************************/

module plate() {
  translate([0, 0, -bottom_height]) {
    difference() {
      linear_extrude(height=bottom_height) {
        union() {
          thumbs_plate();
 
          hull() {
            main_pattern()
              SwitchPos2D();
 
              main_insets_bottom()
                corner_outer_2d();
          }
        }
      }
      insets()
        screw_hole();
    }
  }
}

/******************************************************************************

		Dovetail

/*****************************************************************************/
dove_tail_min_side = 5;
dove_tail_max_side = 10;
dove_tail_depth = 5;
dove_tail_sw = [dove_tail_min_side/2, 0];
dove_tail_ne = [dove_tail_max_side/2, dove_tail_depth];
dove_tail_nw = [-dove_tail_max_side/2, dove_tail_depth];
dove_tail_se = [-dove_tail_min_side/2, 0];
dove_tail_height = inner_height+switch_height;

module dove_tail_2d() {
  polygon([
    dove_tail_nw, dove_tail_ne, dove_tail_sw, dove_tail_se 
  ]);
}

dove_tail_pos = [(insets_pos[5][0]+insets_pos[6][0])/2,insets_y_min - inset_diameter_outer/2+.1,0];
module dove_tail() {
  translate(dove_tail_pos) {
    linear_extrude(height=dove_tail_height) {
      rotate([0,0,180]){
        children();
      }
    }
  }
}

module dove_tail_chamfer1(w) {
  translate(dove_tail_pos + [0, 0, dove_tail_height/2]) {
    translate(dove_tail_se) {
      rotate([0,0,45])
      cube([w, w, dove_tail_height], center=true);
    }

    translate(dove_tail_sw) {
      rotate([0,0,45])
      cube([w, w, dove_tail_height], center=true);
    }
  }
}

module dove_tail_chamfer2(w) {
  translate(dove_tail_pos + [0, 0, dove_tail_height/2]) {
    rotate([0,0,180]) {
      translate(dove_tail_ne) {
        rotate([0,0,45])
        cube([w, w, dove_tail_height], center=true);
      }
 
      translate(dove_tail_nw) {
        rotate([0,0,45])
        cube([w, w, dove_tail_height], center=true);
      }
    }
  }
}


/******************************************************************************

		hand rest

/*****************************************************************************/
module hand_rest() {
  corner_diam = 7;

  depth = 70;
  ne =  insets_pos[5] + [switch_side_outer, -inset_diameter_outer - .2, 0];
  nw =  insets_pos[6] + [-5, -inset_diameter_outer - .2, 0];
  w =  nw + [0, -30, 0];
  sw = nw + [25, -depth, 0];
  se = ne + [0, -depth, 0];

  difference() {
    //linear_extrude(inner_height + switch_height + bottom_height)
    hull() {
      linear_extrude(1) {
        hull()
          for (pos = [ne, nw, w, sw, se]) {
            translate(pos)
              circle(d=corner_diam);
          }
      }
      translate([0, 0, inner_height + switch_height + bottom_height - corner_diam]) {
        translate(nw) {
          cylinder(d=corner_diam, h=corner_diam);
        }
        translate(ne) {
          cylinder(d=corner_diam, h=corner_diam);
        }
        translate(w) {
          cylinder(d=corner_diam, h=corner_diam);
        }
        translate(se + [0,0,corner_diam/2]) {
          sphere(d=corner_diam);
        }
        translate(sw + [0,0,corner_diam/2]) {
          sphere(d=corner_diam);
        }
      }
    }
    

    translate([0,0,bottom_height]) {
      dove_tail()
        scale([1.05,1.05,1])
          dove_tail_2d();
      dove_tail_chamfer1(3);
    }
  }
}

/******************************************************************************

		Full Assembly

/*****************************************************************************/
module trrs_pos() {
  translate(insets_pos[0] + [6,corner_diam_inner/2  -get(trrs_data, "length"), 0])
    children();
}

module usbminib_pos() {
  trrs_pos()
    translate([14, get(trrs_data, "length") - get(usbminib_data, "length") + get(usbminib_data, "length_narrow"), 0])
    children();
}

//mirror([1,0,0])
difference() {
  union() {
    difference() {
      union(){
        thumb_body_outer();
        main_outer();
      }
      thumb_body_inner();
      main_inner();
    }

    insets()
      screw_inset_pos();

    difference() {
      dove_tail()
        dove_tail_2d();
      dove_tail_chamfer2(1);
    }
  }

  main_holes();
  thumb_holes();

  insets()
      screw_inset_neg();

  #trrs_pos()
    trrs();
  #usbminib_pos()
    usbminib();
    translate([get(usbminib_data, "width")/2 - get(usbcable_data, "width")/2, get(usbminib_data, "length"), 0])
  #usbminib_pos()
    usbcable();

  //plate();

  //translate([0,0,-bottom_height])
  // hand_rest();
}
