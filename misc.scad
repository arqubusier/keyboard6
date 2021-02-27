include <util.scad>

/******************************************************************************

		screw

/*****************************************************************************/
bottom_height = 2;
screw_diameter = 3;
screw_head_diameter = 5.45 + 1;
module screw_hole() {
	cylinder(d2=screw_diameter, d1=screw_head_diameter, h=bottom_height);
}

/******************************************************************************

		screw inset holder

/*****************************************************************************/
inset_height = 5.10+0.5;
inset_height_outer = 5.10+1.5;
inset_diameter = 5.5;
inset_diameter_outer = inset_diameter+2.5;

corner_radius = inset_diameter_outer/2;
corner_radius_inner = 1;
corner_diameter_inner = corner_radius_inner*2;


module screw_inset() {
	difference () {
		screw_inset_pos();
		screw_inset_neg();
	}
}

module screw_inset_pos() {
	cylinder(d=inset_diameter_outer, inset_height_outer);
}

module screw_inset_neg() {
	cylinder(d=inset_diameter, inset_height);
	cylinder(d=inset_diameter-1, inset_height_outer);
	cylinder(d1=inset_diameter+1, d2=inset_diameter, 1);
}

/******************************************************************************

		connectors

/*****************************************************************************/
usbminib_data = [
  ["height", 3.9 + .3],
  ["width", 7.7 + 2*1.1],
  ["length", 5.5 + 2.95 + 1.5/2],
  ["length_narrow", 2.95 - 1.5/2],
  ["width_narrow", 7.7],
  ["diameter", 5.6],
  ["ring_length", 2],
];
module usbminib_(data) {
  w = get(data, "width");
  wn = get(data, "width_narrow");
  l = get(data, "length");
  ln_ = get(data, "length_narrow");
  h = get(data, "height");
  cube([w, l - ln_, h]);
  translate([w/2-wn/2, l - ln_, 0])
    cube([wn, ln_, h]);
}
module usbminib() usbminib_(usbminib_data);

trrs_data = [
    ["height", 5],
    ["width", 8],
    ["length", 12.1],
    ["diameter", 5.6],
    ["ring_length", 2],
  ];
module trrs_(data) {
  w = get(data, "width");
  l = get(data, "length");
  h = get(data, "height");
  cube([w, l, h]);
  translate([w/2, l, h/2])
    rotate([-90, 0, 0])
        cylinder(d=get(data, "diameter"), h=get(data, "ring_length"));
}
module trrs() trrs_(trrs_data);

usbcable_data = [
    ["height", 8],
    ["width", 12],
    ["length", 20],
                 ];
module usbcable() {
  cube([get(usbcable_data, "width"), get(usbcable_data, "length"), get(usbcable_data, "height")]);
}
