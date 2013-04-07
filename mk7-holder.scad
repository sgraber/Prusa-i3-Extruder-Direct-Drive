include <metric.scad>;
include <functions.scad>;
use <jhead.scad>;  		// http://www.thingiverse.com/thing:45379
use <mk7.scad>;
use <nema17.scad>;

nema17_length=30;
nema17_width=43;

plate_thickness = 3;
plate_width = 43;
plate_length = 70;

mount_position = 48;
mount_width = 3;
mount_height = 15;

filament_rad = 2; 			// 2=3mm, 1.25=1.75mm

rotate([0,-90,0]) union() {

// motor and jhead plate
difference() {
	union() {
		cube(size=[plate_width, plate_length, plate_thickness], center=true);
		//translate([0-7,23-2,3]) cylinder(r1=8, r2=4, h=6, center=true);
		translate([-6,21,7]) cylinder(r=4, h=12, center=true);
		translate([-15,21,7]) cube(size=[18,8,12], center=true);
	}
	translate([0-7,23-2,0]) cylinder(r=filament_rad, h=125, center=true);
	translate([0-7,23-2,11]) cylinder(r1=1, r2=3, h=6, center=true);
	%translate([0-7,23-2,0]) 
		cylinder(r=filament_rad, h=125, center=true); // visualize
	translate([0,16,23]) rotate([90,0,0])
		nema17(places=[0,0,1,1], size=15.5, h=10, holes=true, shadow=false, $fn=24);
}

// motor mount
difference() {
	translate([0, -plate_length/2+mount_position, plate_thickness*2+1]) 
		cube(size=[plate_width, mount_width, mount_height+1.5], center=true);
	translate([0,16,23]) rotate([90,0,0]) 
		nema17(places=[0,0,1,1], size=15.5, h=10, holes=true, shadow=false, $fn=24);
	translate([0,16,23]) rotate([90,0,0]) cylinder(r=15, h=10, center=true);
}

// back bottom triangular brace
difference() {
	hull() {
		translate([-plate_width/2-plate_thickness/2,mount_position/2,-20/2]) 
			cube(size=[plate_thickness, 22, 20], center=true);
		translate([-plate_width/2-plate_thickness/2,-plate_length/2+plate_thickness/2,0]) 
			rotate([0,90,0]) 
			cylinder(r=1, h=plate_thickness, center=true);
	}
	translate([-20,4,-12]) mountholes();
}

// back-top rectangular brace
difference() {
	translate([-plate_width/2-plate_thickness/2,0,mount_height/2+1.5]) 
		cube(size=[plate_thickness,plate_length,mount_height+6], center=true);
	translate([-20,4,-12]) mountholes();
}

// motor brace
hull() {
	translate([plate_width/2-1,mount_position/2-plate_length/2,0]) 
		rotate([90,0,0]) 
		cylinder(r=1, h=plate_thickness, center=true);
	translate([-plate_width/2+1,mount_position/2-plate_length/2,0]) 
		rotate([90,0,0]) 
		cylinder(r=1, h=plate_thickness, center=true);
	translate([-plate_width/2+1,mount_position/2-plate_length/2,-8.5]) 
		rotate([90,0,0]) 
		cylinder(r=1, h=plate_thickness, center=true);
}

// front brace
difference() {
hull() {
	translate([plate_width/2-.5,plate_length/2-plate_thickness/2,-6])
		cube(size=[1,plate_thickness,11], center=true);
	translate([-plate_width/2,plate_length/2-plate_thickness/2,-plate_thickness/2]) 
		rotate([90,0,0]) 
		cylinder(r=1, h=plate_thickness, center=true);
	translate([-plate_width/2,plate_length/2-plate_thickness/2,-19]) 
		rotate([90,0,0]) 
		cylinder(r=1, h=plate_thickness, center=true);
}
	translate([7-7+1,23,-9]) rotate([90,90,0]) cylinder(r=2, h=30, center=true);
}

// jhead mount
difference() {
	translate([0-7,plate_length/2-12-2,-10.5]) rotate(180) groovemount();
	translate([7-7+1,23,-9]) rotate([90,90,0]) cylinder(r=2, h=30, center=true);
}
%translate([0-7,-plate_length/2+mount_position+10-2,-1.5-1]) rotate([180,0,0]) hotend_jhead();

}


// mount holes
module mountholes() {
	rotate([0,90,0]) {
		cylinder(r=2, h=20, center=true);
		translate([0,24,0]) cylinder(r=2, h=20, center=true);
		translate([-29,12,0]) cylinder(r=2, h=20, center=true);
	}
}

module groovemount(){
	difference(){
		union() {
			translate([0,0,4.5]) cube(size=[plate_width-8,22,11], center=true);
			translate([-1,9.5,-2]) rotate([0,90,0]) 
				cube(size=[2,3,33], center=true);
			translate([-1,-9.5,-2]) rotate([0,90,0]) 
				cube(size=[2,3,33], center=true);
		}

		translate([-10,0,5]) cube(size=[25,12.5,15], center=true);
		translate([-10,0,5+4.4-1.5]) cube(size=[25,16.5,10], center=true);

		translate([0,0,-5]) cylinder(h=20, r=12.5/2);
		translate([0,0,4.4-1.5]) cylinder(h=20, r=16.5/2);
		translate([10,-6.5,-1.5]) rotate([0,90,0]) cylinder(r=4, h=20);
		translate([10,-6.5,-1.5]) sphere(r=4);
	}
}

rotate([-90,0,0]) translate([-23,0,11]) %nema17motor();
rotate([90,0,0]) translate([-23,0,-22.75]) %mk7();