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
  ["width_pcb", 8.9 + 2],
  ["length", 5.5 + 2.95 + 1.5/2],
  ["length_pcb", 9],
  ["length_narrow", 2.95 - 1.5/2],
  ["width_narrow", 7.7],
  ["diameter", 5.6],
  ["ring_length", 2],
  ["pad_length", 2.5],
  ["flange_length", 1.5],
];
module usbminib_(data) {
  w = get(data, "width_pcb");
  wn = get(data, "width_narrow");
  l = get(data, "length");
  ln_ = get(data, "length_narrow");
  h = get(data, "height");
  cube([w, l - ln_, h]);
  translate([w/2-wn/2, l - ln_, 0])
    cube([wn, ln_, h]);
}
module usbminib() usbminib_(usbminib_data);
module usbminib_pcb_2d(clearance) {
  square([get(usbminib_data, "width_pcb") + clearance, get(usbminib_data, "length_pcb") + clearance]);
}

trrs_data = [
    ["height", 5],
    ["width", 8],
    ["width_pcb", 9],
    ["length", 12.1],
    ["length_pcb", 11.3 + 1.2/2],
    ["diameter", 5.6],
    ["ring_length", 2],
  ];
module trrs_(data) {
  w = get(data, "width_pcb");
  l = get(data, "length");
  h = get(data, "height");
  cube([w, l, h]);
  translate([w/2, l, h/2])
    rotate([-90, 0, 0])
        cylinder(d=get(data, "diameter"), h=get(data, "ring_length"));
}
module trrs() trrs_(trrs_data);
module trrs_pcb_2d(clearance) {
  square([get(trrs_data, "width_pcb") + clearance, get(trrs_data, "length_pcb") + clearance]);
}

usbcable_data = [
    ["height", 8],
    ["width", 12],
    ["length", 20],
                 ];
module usbcable() {
  cube([get(usbcable_data, "width"), get(usbcable_data, "length"), get(usbcable_data, "height")]);
}
