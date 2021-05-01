include <util.scad>
include <cherrymx.scad>
include <misc.scad>

/******************************************************************************

		Common parameters

/*****************************************************************************/
$fn = 15;
inner_height = 10;
outer_height = inner_height + switch_height;

side_wall_thick = 4;
// board clearance is measured from the switch hole
pcb_clearance = .4;
switch_side_clearance = switch_side_inner + pcb_clearance;
switch_side_outline = switch_side_inner + pcb_clearance + side_wall_thick;
corner_diam_inner = inset_diameter_outer + 2*pcb_clearance - 2*side_wall_thick;
corner_diam_outer = inset_diameter_outer;
plate_offset = 1.4;
plate_clearance = .4;
corner_diam_plate = inset_diameter_outer - plate_offset;
corner_diam_plate_clearance = inset_diameter_outer - plate_offset + plate_clearance;
plate_total_height = bottom_height + plate_clearance;

module corner_outer_2d() {
  circle(d=corner_diam_outer);
}

module corner_inner_2d() {
  circle(d=corner_diam_inner);
}

module corner_plate_2d() {
  circle(d=corner_diam_plate);
}

module corner_plate_clearance_2d() {
  circle(d=corner_diam_plate_clearance);
}

module switch_outer_2d() {
  side = switch_side_outline;
  square(side, center=true);
}

module switch_footprint(clearance=0) {
  side = switch_side_inner+.8;
  square(side + clearance, center=true);
}

module switch_plate_2d() {
  square(switch_side_outline - plate_offset , center=true);
}

module switch_plate_clearance_2d() {
  square(switch_side_outline - plate_offset + plate_clearance , center=true);
}

module switch_outer() {
  side = switch_side_inner + pcb_clearance + side_wall_thick;
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

function n_switches_(col=0) = (col == n_columns) ? 0: n_rows[col] + n_switches_(col+1);
n_switches = n_switches_();

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

function main_positions(i=0, n=n_switches) =
  (i == n)? [palm_switch_pos] : concat([Index2Pos(i)], main_positions(i+1, n));

/******************************************************************************

		Thumb Cluster patterns

/*****************************************************************************/
thumb_angle_offset = 15;
thumb_angle_sep = 15.4;

function thumb_angle(i) = thumb_angle_offset + i*thumb_angle_sep;

function thumb_angles(i=0,n=3) =
  (i == n)? [] : concat([thumb_angle(i)], thumb_angles(i+1, n));

function thumb_position(i) =
  let (radius = 80,
       m1 = moveM([radius*sin(thumb_angle_offset) - 1.35, -radius*cos(thumb_angle_offset) - 1.5 -.6,0]),
       r = rotZM(thumb_angle(i)),
       m2 = moveM([0, radius, 0]),
       transform = m1*r*m2)
  vec3(transform * [0, 0, 0, 1]);

function thumb_positions(i=0, n=3) =
  (i == n)? [] : concat([thumb_position(i)], thumb_positions(i+1, n));


module thumb_pattern(n=3) {
  for (i = [0:n-1]) {
    pos = thumb_position(i);
    echo(i, pos);
    translate(pos)
      rotate(thumb_angle(i))
      children();
  }
}

          

/******************************************************************************

		Insets and corners

/*****************************************************************************/
thumb_x_min = -47.5;
thumb_y_max = Index2Pos(1)[1] - 1*switch_side_outer - 12;

insets_y_min_offset = -2*switch_side_outer - 1.5;
insets_y_min = Index2Pos(19)[1] + insets_y_min_offset;
main_x_min = Index2Pos(0)[0] + -switch_side_inner/2 - inset_diameter_outer/2 - pcb_clearance;
main_x_max = palm_switch_pos[0] + switch_side_inner/2 + inset_diameter_outer/2 + pcb_clearance;
insets_pos = [
  [thumb_x_min, thumb_y_max, 0],
  [main_x_min, thumb_y_max + 9,0],
  [main_x_min, Index2Pos(3)[1] + 5,0],
  Index2Pos(18) + [switch_side_outer/2+14,-1,0],
  [main_x_max, Index2Pos(23)[1], 0],
  [main_x_max, palm_switch_pos[1], 0],
  [main_x_min, Index2Pos(19)[1] + insets_y_min_offset, 0],
];

corners_pos = concat( insets_pos,
                      [[main_x_min, thumb_y_max,0]]
                       );

module insets() {
  for (pos = insets_pos) {
    translate(pos + z(plate_total_height))
      children();
  }
}

module screws() {
  for (pos = insets_pos) {
    translate(pos)
      children();
  }
}


/******************************************************************************

		Thumb Cluster Assembly

/*****************************************************************************/
module thumbs_extend() {
  translate(corners_pos[0])
    children();
  translate(corners_pos[7])
    children();
  translate(corners_pos[6])
    children();
  translate(corners_pos[0] + [0,-20,0])
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

module thumb_body_inner() {
  trim = 1;  
  translate([0,0,-trim])
    linear_extrude(height=inner_height + trim)
      hull() {
        thumb_pattern()
          switch_footprint(pcb_clearance);
        thumbs_extend()
          corner_inner_2d();
      }
}

module thumb_body_outer() {
  linear_extrude(height=inner_height + switch_height)
    hull() {
      thumb_pattern()
        switch_outer_2d();
      thumbs_extend()
        corner_outer_2d();
    }
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
  for (pos = [corners_pos[1], corners_pos[2], corners_pos[3], corners_pos[4], corners_pos[5], corners_pos[6], corners_pos[7]] ) {
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
    linear_extrude(inner_height)
      main_switches_outline()
        switch_footprint(pcb_clearance);
    translate([0, 0, -switch_height]) {
      main_insets_outline()
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

module full_pattern() {
  main_pattern()
    children();
  thumb_pattern()
    children();
}

/******************************************************************************

		Plate

/*****************************************************************************/

x_panel_min = -52;
y_panel_max = Index2Pos(1)[1] - 1*switch_side_outer - 12;

gons = [
          [switch_corner_outer(Index2Pos(3), "nw")[0], y_panel_max] + [-2, 0, 0],
          vec2(switch_corner_outer(Index2Pos(3), "nw") + [-2, -2, 0]),
          vec2(switch_corner_outer(Index2Pos(8), "nw")),
          vec2(switch_corner_outer(Index2Pos(13), "nw")),
          vec2(switch_corner_outer(Index2Pos(13), "ne")),
          vec2(switch_corner_outer(Index2Pos(18), "ne") + [2,0,0]),
          vec2(switch_corner_outer(Index2Pos(22), "ne") + [2,0,0]),
          vec2(switch_corner_outer(Index2Pos(24), "ne") + [2,0,0]),
          vec2(switch_corner_outer(palm_switch_pos, "se") + [2,0,0]),
          [thumb_position(2)[0], switch_corner_outer(palm_switch_pos, "se")[1]],
          [x_panel_min, switch_corner_outer(palm_switch_pos, "ne")[1] -3],
          [x_panel_min, y_panel_max]
        ];

insets_pos2 = [gons[0] + [0, 8, 0], gons[1], gons[5] + [5.5, -6, 0], gons[7], gons[8], gons[9], gons[11]];

module insets2() {
  for (pos = insets_pos2) {
    translate(pos + z(plate_total_height))
      children();
  }
}

module plate_poly() {
  polygon(points = gons);
}
//vec2(x(thumb_position(2)) + y(palm_switch_pos))
module plate_poly3d() {
    linear_extrude(.0001)
      plate_poly();
}

module plate_poly_hull() {
  minkowski() {
    plate_poly3d();
      children();
  }
}

bottom_height = 2;
bottom_clearance = .4;
chamfer_h = 2;
chamfer_r2 = 2;
module bottom_clearance() {
  translate([0, 0, -1])
    plate_poly_hull()
      cylinder(d=inset_diameter_outer - 0.8*2, h=bottom_height + plate_clearance + 1);
}

module bottom() {
  difference() {
    union () {
      plate_poly_hull()
        cylinder(d=inset_diameter_outer - 0.8*2 - plate_clearance, h=bottom_height);
      #insets2()
        screw_hole();

      trrs_hole_bottom();
      usbminib_hole_bottom();
    }

    connector_assembly(pcb_clearance);
    insets2()
      screw_hole();
  }
}

module body_positive() {
    union() {
      translate([0, 0, outer_height - chamfer_h])
        plate_poly_hull()
          cylinder(r1=inset_diameter_outer/2, r2=chamfer_r2, h=chamfer_h);

      plate_poly_hull()
        cylinder(d=inset_diameter_outer, h=outer_height - chamfer_h);
    }
}

module body_neg() {
  translate([0, 0, -.1])
    linear_extrude(inner_height + .1)
      plate_poly();

  pcb_with_clearance();
  bottom_clearance();

  trrs_hole();
  usbminib_hole();
  trrs_hole_bottom(pcb_clearance);
  usbminib_hole_bottom(pcb_clearance);

  translate([0, 0, inner_height]) {
    #thumb_pattern()
      switch_neg(1.1);
    #main_pattern()
      switch_neg(1.1);
  }
}


!union() {
  difference() {
    union() {
      difference() {
        body_positive();
        body_neg();
      }
      translate([0, 0, bottom_height + bottom_clearance])
        insets2()
          screw_inset_pos();
    }
    translate([0, 0, bottom_height + bottom_clearance])
      insets2()
        screw_inset_neg();
  }

  %connector_assembly();
  %bottom();
}

module plate_outline(height) {
  corner = 0;
  switch = 1;
  difference() {
    linear_extrude(height) {
      union() {
        hull() {
          thumb_pattern()
            children(switch);
          thumbs_extend()
            children(corner);
        }
        hull() {
          main_pattern()
            children(switch);

            main_insets_bottom()
            children(corner);
          }
        }
    }
  }
}

module plate() {
  difference() {
    plate_outline(bottom_height) {
      corner_plate_2d();
      switch_plate_2d();
    }
    screws()
    screw_hole();
  }
}

module plate_clearance() {
  plate_outline(plate_total_height) {
    corner_plate_clearance_2d();
    switch_plate_clearance_2d();
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

		Pcb

/*****************************************************************************/
pcb_thick = 1.57;
pcb_height_clearance = .2;
pcb_pos = z(outer_height - switch_pcb_to_plate_top-pcb_thick);
usbminib_pos = corners_pos[7] + [-get(usbminib_data, "width_pcb") - side_wall_thick - 4
                                  , -get(usbminib_data, "length") + corner_diam_outer/2 - 0,
                                 pcb_pos[2]-get(usbminib_data, "height")];

trrs_pos =  [usbminib_pos[0] - 13, corners_pos[7][1] + corner_diam_outer/2  -get(trrs_data, "length")-get(trrs_data, "ring_length"),
             pcb_pos[2]-get(trrs_data, "height")];

controller_clearance_length = 50;
controller_clearance_width = 20;
module controller_shape_2d(clearance) {
  square([controller_clearance_length+clearance, controller_clearance_width+clearance]);
}

module controller_2d(clearance) {
  translate(Index2Pos(4) + [-switch_side_inner/2,
                            -switch_side_inner/2 - controller_clearance_width - 5,0])
    controller_shape_2d(clearance);
}

corner_pcb_pos = [Index2Pos(0)[0] - switch_side_inner/2, trrs_pos[1],0];

module pcb_2d(clearance=0) {
  hull() {
    translate(corner_pcb_pos)
        trrs_pcb_2d(clearance);
    thumb_pattern()
        switch_footprint(clearance);
    translate(usbminib_pos)
        usbminib_pcb_2d();
    
    translate(trrs_pos - x((get(trrs_data, "width_footprint") - get(trrs_data, "width_pcb"))/2) ) 
        trrs_pcb_2d(clearance);

    controller_2d(clearance);
  }
  hull() {
    main_pattern()
        switch_footprint(clearance);
        controller_2d(clearance);
    translate(corner_pcb_pos)
        usbminib_pcb_2d(clearance);
  }
}


module pcb() {
  translate(pcb_pos) {
    linear_extrude(height=pcb_thick) {
      pcb_2d();
    }
  }
}

module pcb_with_clearance() {
  linear_extrude(height=pcb_pos[2] + pcb_thick + pcb_height_clearance) {
    pcb_2d(pcb_clearance);
  }
}

module usbminib_hole() {
  translate(usbminib_pos + [-plate_clearance/2, 0, -plate_clearance/2]) {
    usbminib(pcb_clearance);
  }
}

module usbminib_hole_bottom(clearance = 0) {
  wusb = get(usbminib_data, "width_pcb") + pcb_clearance;
  lusb = get(usbminib_data, "length_pcb") + pcb_clearance;
  husb = get(usbminib_data, "height") + pcb_clearance;
  wneg = get(usbminib_data, "width_narrow") + clearance;
  lneg = get(usbminib_data, "length_narrow") + pcb_clearance;
  hneg = trrs_pos[2] + husb/2;
  #translate([usbminib_pos[0] + -plate_clearance/2, usbminib_pos[1] + -plate_clearance/2 + .4, 0]) {
    translate([wusb/2 - wneg/2, lusb - lneg, 0])
      cube([wneg, lneg, hneg]);
  }
}

module trrs_hole() {
  translate(trrs_pos + [-plate_clearance/2, -plate_clearance/2, -plate_clearance/2]) {
    trrs(pcb_clearance);
  }
}

module trrs_hole_bottom(clearance=0) {
  htrrs = get(trrs_data, "height");
  wtrrs = get(trrs_data, "width_pcb") + clearance;
  ltrrs = get(trrs_data, "length_pcb");
  wneg = get(trrs_data, "diameter") + clearance;
  lneg = get(trrs_data, "ring_length");
  hneg = trrs_pos[2] + htrrs/2;
  translate([trrs_pos[0] + -clearance/2, trrs_pos[1] + plate_clearance/2, 0]) {
    translate([wtrrs/2 - wneg/2, ltrrs, 0])
      cube([wneg, lneg, hneg]);
  }
}

/******************************************************************************

		Full Assembly

/*****************************************************************************/

module top_positive() {
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
}

module plate_assembly() {
  difference() {
    union() {
      plate();
        trrs_hole_bottom();
        usbminib_hole_bottom();
    }
    trrs_hole();
    usbminib_hole();
  }
}

module top_assembly() {
  difference() {
    top_positive();
  
    main_holes();
    thumb_holes();
  
    insets(){
        screw_inset_neg();
    }
  
  plate_clearance();
  pcb_with_clearance();
  
  trrs_hole();
  usbminib_hole();
  trrs_hole_bottom(pcb_clearance);
  usbminib_hole_bottom(pcb_clearance);
  }
}

trrs_footprint_pos = trrs_pos +
            x(get(trrs_data, "width_pcb")/2) +
  y(get(trrs_data, "length"));
usbminib_footprint_pos = usbminib_pos +
            x(get(usbminib_data, "width_pcb")/2) +
  y(get(usbminib_data, "length_pcb"));

module connector_assembly(clearance=0) {
  translate(trrs_pos) {
      trrs(clearance);
  }

  translate(usbminib_pos){
      usbminib(clearance);
  }
}


mirror([1,0,0])
union() {
  %top_assembly();
  %connector_assembly();
  %plate_assembly();
  %pcb();
    
  pcb_2d();
}


/*
%projection()
 full_pattern()
   keycap();
*/



// Used  to import positions in kicad
echo("trrs", trrs_footprint_pos);
echo("usbminib", usbminib_footprint_pos);
echo("switches", main_positions());
echo("thumb_angles", thumb_angles());
echo("thumb_positions", thumb_positions());
