// TrinityLabs MK7 Hobbed Pulley

module hobb() {
	rotate_extrude(convexity=10) translate([7,0,0]) circle(r=2, $fn=10);
}

module mk7() {
	difference() {
		cylinder(r=12.67/2, h=11, center=true, $fn=30);
		cylinder(r=5.05/2, h=12, center=true, $fn=30);
		translate([0,0,2]) hobb();
		translate([4,0,-2.75]) rotate([0,90,0]) 
			cylinder(r=1, h=6, center=true, $fn=30);
		translate([7,0,-2.75]) rotate([0,90,0]) 
			cylinder(r1=1, r2=5, h=3, center=true, $fn=30);
	}
}

mk7();