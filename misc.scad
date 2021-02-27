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
corner_radius_inner = 0;


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

		connector holders

/*****************************************************************************/


module connector_holder (data) {
    difference() {
        cube([get(data,"holder_width"),
              get(data,"holder_depth"),
              get(data,"holder_height")]);
        translate([get(data,"holder_width")/2-get(data,"width_connections")/2,0,0])
            cube([get(data,"width_connections"),
                  get(data,"depth_connections"),
                  get(data,"holder_height")]);
    }
    translate([get(data,"holder_width")/2-get(data,"connector_width")/2,
                get(data,"holder_depth"), 0]) 
        cube([get(data,"connector_width"), corner_radius - usb_holder_inset(data),
              get(data,"holder_height") + get(data,"pcb_height")]);
}

usb_a_data = [
    ["connector_height", 7.6],
    ["connector_width", 13.6],
    ["connector_depth", 16],
    ["holder_width", 26],
    ["holder_depth", 20.16],
    ["holder_height", 2],
    ["holder_side_offset", 0],
    ["hole_side_offset", 1.1],
    ["hole_front_offset", 0.8],
    ["hole_radius", 1.75],
    ["depth_connections", 15],
    ["width_connections", 17],
    ["connector_overhang", 2.7],
    ["pcb_height", 1.7],
];

usb_bmicro_data = [
    ["holder_height", 2],
    ["depth_connections", 4],
    ["width_connections", 14],
    ["connector_overhang", 1.3],
    ["pcb_height", 1.7],
    ["connector_height", 3.0],
    ["connector_width", 8.0],
    ["connector_depth", 16],
    ["holder_width", 21],
    ["holder_depth", 11.4],
    ["holder_side_offset", 35],
    ["hole_side_offset", 1.1],
    ["hole_front_offset", 0.9],
    ["hole_radius", 1.75],
];

usb_bmini_data = [
    ["holder_height", 2],
    ["depth_connections", 4],
    ["width_connections", 14],
    ["connector_overhang", 1.3],
    ["pcb_height", 1.7],
    ["connector_height", 4.1],
    ["connector_width", 7.7],
    ["connector_depth", 16],
    ["holder_depth", 19.2],
    ["holder_width", 26],
    ["holder_side_offset", 0],
    ["hole_side_offset", 1.1],
    ["hole_front_offset", 0.7],
    ["hole_radius", 1.75],
];

function usb_holder_inset(data) = corner_radius - get(data,"connector_overhang") - 1.0;

reference_offset = [0,0];
function usb_holder_offset(data) = reference_offset +
                [-get(data, "holder_side_offset")-get(data, "holder_width"),
                usb_holder_inset(data) -get(data, "holder_depth"), 0];
function usb_screws_pos(data) = [
                usb_holder_offset(data) +
                    [get(data, "hole_radius") + get(data, "hole_side_offset"),
                     get(data, "holder_depth")
                        - get(data, "hole_radius")
                        - get(data, "hole_front_offset"), 0],
                usb_holder_offset(data) +
                   [get(data,"holder_width") -
                       (get(data,"hole_radius") + get(data,"hole_side_offset")),
                       get(data, "holder_depth")
                           - get(data, "hole_radius")
                           - get(data, "hole_front_offset"), 0]];

module usb_holder_screws(data) {
    for (p = usb_screws_pos(data)){
        translate(p)
            children();
    }
}

module usb_holder(data) {
    difference() {
        translate(usb_holder_offset(data))
            connector_holder(data);
        #usb_holder_screws(data)
            screw_hole();
    }
}

module usb_hole(data) {
    tolerance0 = 0.4;
    tolerance1 = 1.5;
    trim0 = 5;
    translate(usb_holder_offset(data)) {
        translate([get(data,"holder_width")/2 - (get(data,"connector_width") + tolerance0)/2,
                    get(data,"holder_depth") - get(data,"connector_depth") + get(data,"connector_overhang")])
            cube([get(data,"connector_width") + tolerance0, get(data,"connector_depth") + trim0,
                    get(data,"holder_height")+get(data,"connector_height")+get(data,"pcb_height")]);
        translate([0,0,0])
            cube([get(data,"holder_width")+tolerance0,
                    get(data,"holder_depth")+tolerance1,
                    get(data,"holder_height")]);
    }

    tolerance2 = 0.3;
    m3_nut_max_w = 6.3;
    m3_nut_h = 2.4;

    for (p = usb_screws_pos(data)) {
        translate(p)
            cylinder(d=m3_nut_max_w+tolerance2,
                     h=get(data,"holder_height") + m3_nut_h + tolerance2);
    }
}