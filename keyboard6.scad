include <util.scad>
include <cherrymx.scad>
include <misc.scad>

module cyl_outer () {
  cylinder(d=inset_diameter_outer, h=switch_height);
}

module cyl_inner () {
  cylinder(d=2, h=switch_height);
}

module corner_outer_2d() {
  circle(d=inset_diameter_outer);
}

module corner_inner_2d() {
  circle(d=2);
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
column_y_offsets = [switch_side_outer,4,9,4,4, 1.4*switch_side_outer];
n_rows = [4,5,5,5,4,1];
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

function Index2ColRow(index, col=0, sum=0) =
         let (new_sum = sum + n_rows[col])
            (index <  new_sum ) ?
            [col, index - sum] : Index2ColRow(index, col+1, new_sum);

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
module ClusterRow(cluster_row_data) {
  for (col = [0:get(cluster_row_data, "cols_n") - 1]) {
    translate([get(cluster_row_data, "offset_x"),
               get(cluster_row_data, "offset_y"),
               get(cluster_row_data, "offset_z") ]) {
      x = col*(-get(cluster_row_data, "stagger_x"));
      y = -get(cluster_row_data, "cluster_radius") + col*(-get(cluster_row_data, "stagger_y"));
      translate([x, y, 0]) {
        angle = col * get(cluster_row_data, "col_angle") + get(cluster_row_data, "col_angle_offset");
        rotate([0,0,angle])
            translate([0, get(cluster_row_data, "cluster_radius"), 0])
                rotate([get(cluster_row_data, "x_angle"),0,0])
        children();
      }
    }
  }
}



/******************************************************************************

		Common parameters

/*****************************************************************************/
x_offset = 25;

row2_data = [
  ["offset_y", 1],
  ["offset_x", x_offset-.5],
  ["offset_z", 0],
  ["stagger_x", 5],
  ["stagger_y", 5],
  ["cols_n", 1],
  ["col_angle", 0],
  ["col_angle_offset", 15],
  ["x_angle", 0],
  ["cluster_radius", 100],
];

row1_data = [
  ["offset_y", 7.5+switch_side_outer],
  ["offset_x", x_offset + 8.5],
  ["offset_z", 0],
  ["stagger_x", switch_side_outer - 2.5],
  ["stagger_y", switch_side_outer - 9.5],
  ["cols_n", 2],
  ["col_angle", 0],
  ["col_angle_offset", 30.5],
  ["x_angle", 0],
  ["cluster_radius", get(row2_data, "cluster_radius") + .51*switch_side_outer],
];

row1_bottom_data = [
  ["offset_y", get(row1_data, "offset_y")],
  ["offset_x", get(row1_data, "offset_x")],
  ["offset_z", 0],
  ["stagger_x", get(row1_data, "stagger_x")],
  ["stagger_y", get(row1_data, "stagger_y")],
  ["cols_n", get(row1_data, "cols_n")],
  ["col_angle", get(row1_data, "col_angle")],
  ["col_angle_offset", get(row1_data, "col_angle_offset")],
  ["x_angle", 0],
  ["cluster_radius", get(row1_data, "cluster_radius")],
];


row3_data = [
  ["offset_y", 1.5],
  ["offset_x", x_offset-.5],
  ["stagger_offset_x", switch_side_outer],
  ["offset_z", 0],
  ["stagger_x", switch_side_outer - 2.5],
  ["stagger_y", switch_side_outer - 9.5],
  ["cols_n", 2],
  ["col_angle", 0],
  ["col_angle_offset", 30.5],
  ["x_angle", 0],
  ["cluster_radius", get(row2_data, "cluster_radius") - .51*switch_side_outer],
];

row3_bottom_data = [
  ["offset_y", get(row3_data, "offset_y")],
  ["offset_x", get(row3_data, "offset_x")],
  ["offset_z", 0],
  ["stagger_x", get(row3_data, "stagger_x")],
  ["stagger_y", get(row3_data, "stagger_y")],
  ["cols_n", get(row3_data, "cols_n")],
  ["col_angle", get(row1_data, "col_angle")],
  ["col_angle_offset", get(row3_data, "col_angle_offset")],
  ["x_angle", 0],
  ["cluster_radius", get(row3_data, "cluster_radius")],
];

outer_height = 10;

side_wall_thick = (switch_side_outer-switch_side_inner)/2;


/******************************************************************************

		Insets

/*****************************************************************************/
thumb_x_max = -6;
thumb_x_min = -58;
thumb_y_max = Index2Pos(1)[1] - 1*switch_side_outer + 0;

insets_y_min_offset = -2*switch_side_outer - 1.5;
insets_y_min = Index2Pos(19)[1] + insets_y_min_offset;
insets_pos = [
  [thumb_x_min,-18,0],
  [thumb_x_min, thumb_y_max, 0],
  Index2Pos(0) + [-switch_side_inner/2 - 4.5,7.5,0],
  Index2Pos(3) + [-switch_side_inner/2 - 4.5,5,0],
  Index2Pos(18) + [switch_side_outer/2+7,-4,0],
  Index2Pos(23) + [switch_side_inner/2-1.5,-switch_side_inner,0],
  Index2Pos(19) + [-switch_side_inner/2 + 12, insets_y_min_offset, 0],
  Index2Pos(19) + [-6*switch_side_inner - 0, insets_y_min_offset, 0],
];

module insets() {
  for (pos = insets_pos) {
    translate(pos)
      children();
  }
}


/******************************************************************************

		Main Assembly

/*****************************************************************************/
module main_pattern() {
  rotate([0,0,0]) {
    ClusterRow(row2_data)
      children();

      main()
        children();

      translate(Index2Pos(19) + [1*switch_side_outer, -1.8*switch_side_outer, 0])
        children();
   }
}

module main_body() {
  translate([0,0,outer_height])
    main_pattern()
    children();

  main_pattern()
  children();
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
  translate([thumb_x_max,thumb_y_max,0])
    children();
  translate([thumb_x_max,insets_pos[7][1],0])
    children();
}

module thumbs_body_extend() {
  translate([0,0,outer_height-inset_height_outer+switch_height])
    thumbs_extend()
      children();
  thumbs_extend()
      children();
}

module thumbs_body_top() {
  translate([0,0,outer_height]) {
    ClusterRow(row3_data)
      children();
  }
}

module thumb_trim() {
  thumbs_body_top() {
    switch_neg(5);
  }

}

module thumbs_plate_inner() {
  hull() {
    //thumbs
    ClusterRow(row3_bottom_data)
      SwitchNeg2D();
    thumbs_extend()
      corner_inner_2d();
  }
}

module thumbs_plate() {
  hull() {
    //thumbs
    ClusterRow(row3_bottom_data)
      SwitchPos2D();
    thumbs_extend()
      corner_outer_2d();
  }
}

module thumb_body_inner() {
  trim = 1;  
  translate([0,0,-trim])
    linear_extrude(height=outer_height + trim)
      thumbs_plate_inner();
}

module thumb_body_outer() {
  linear_extrude(height=outer_height + switch_height)
    thumbs_plate();
}
/******************************************************************************

		Main Assembly

/*****************************************************************************/
module main_insets_bottom() {
  for (pos = [insets_pos[2], insets_pos[3], insets_pos[4], insets_pos[5], insets_pos[6], insets_pos[7]] ) {
    translate(pos) {
      children();
    }
  }
}
module main_insets() {
  main_insets_bottom()
    children();
  translate([0,0,outer_height - inset_height_outer + switch_height ])
    main_insets_bottom()
      children();
}

module main_outer() {
  hull() {
    main_body()
      switch_pos();
      main_insets()
        screw_inset_pos();
  }

}

module main_trim() {
  translate ([0, 0, outer_height]) {
    main_pattern()
      switch_neg(5);
  }
}

module main_inner() {
  translate([0,0,-switch_height])
  hull() {
    main_body()
      switch_neg_cube();
    translate([0,0,switch_height])
      main_insets()
        cyl_inner();
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

mirror([1,0,0])
  plate();

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
dove_tail_height = outer_height+switch_height;

module dove_tail_2d() {
  polygon([
    dove_tail_nw, dove_tail_ne, dove_tail_sw, dove_tail_se 
  ]);
}

dove_tail_pos = [(insets_pos[6][0]+insets_pos[7][0])/2,insets_y_min - inset_diameter_outer/2+.1,0];
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
  ne =  insets_pos[6] + [switch_side_outer, -inset_diameter_outer - .2, 0];
  nw =  insets_pos[7] + [-5, -inset_diameter_outer - .2, 0];
  w =  nw + [0, -30, 0];
  sw = nw + [25, -depth, 0];
  se = ne + [0, -depth, 0];

  difference() {
    //linear_extrude(outer_height + switch_height + bottom_height)
    hull() {
      linear_extrude(1) {
        hull()
          for (pos = [ne, nw, w, sw, se]) {
            translate(pos)
              circle(d=corner_diam);
          }
      }
      translate([0, 0, outer_height + switch_height + bottom_height - corner_diam]) {
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

mirror([1,0,0])
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

  main_trim();
  thumb_trim();

  insets()
      screw_inset_neg();
}

mirror([1,0,0])
    translate([0,0,-bottom_height])
        hand_rest();
