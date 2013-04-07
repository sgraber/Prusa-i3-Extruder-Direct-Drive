// from https://github.com/tkramm/galileo/blob/master/components/nema17.scad

module nema17(clearance = 0){
	if(clearance > 0){
		translate([0,0,-24]) cube([42.2,42.2,48],center=true);
		cylinder(r=11.5,h=20,$fn=50,center=true);
		cylinder(r=3,h=60,$fn=50,center=true);

		translate([15.5,15.5,0]) cylinder(r=1.8,h=20,center=true,$fn=20);
		translate([15.5,-15.5,0]) cylinder(r=1.8,h=20,center=true,$fn=20);
		translate([-15.5,15.5,0]) cylinder(r=1.8,h=20,center=true,$fn=20);
		translate([-15.5,-15.5,0]) cylinder(r=1.8,h=20,center=true,$fn=20);
	} else {
	color("Black") 
		difference(){
			translate([0,0,-24]) cube([42.2,42.2,38],center=true);
			rotate([0,0,45]) translate([31,0,-24]) cube([10,20,50],center=true);
			rotate([0,0,135]) translate([31,0,-24]) cube([10,20,50],center=true);
			rotate([0,0,-45]) translate([31,0,-24]) cube([10,20,50],center=true);
			rotate([0,0,-135]) translate([31,0,-24]) cube([10,20,50],center=true);
		}
	color("Silver") 
		difference(){
			union(){
				translate([0,0,-4.5]) cube([42.3,42.3,9],center=true);
				translate([0,0,-43.5]) cube([42.3,42.3,9],center=true);
			}
			rotate([0,0,45]) translate([33,0,-24]) cube([10,20,50],center=true);
			rotate([0,0,135]) translate([33,0,-24]) cube([10,20,50],center=true);
			rotate([0,0,-45]) translate([33,0,-24]) cube([10,20,50],center=true);
			rotate([0,0,-135]) translate([33,0,-24]) cube([10,20,50],center=true);

			translate([15.5,15.5,0]) cylinder(r=1.5,h=8,center=true,$fn=20);
			translate([15.5,-15.5,0]) cylinder(r=1.5,h=8,center=true,$fn=20);
			translate([-15.5,15.5,0]) cylinder(r=1.5,h=8,center=true,$fn=20);
			translate([-15.5,-15.5,0]) cylinder(r=1.5,h=8,center=true,$fn=20);
		}

	color("Silver") cylinder(r=11,h=4,$fn=50,center=true);

	color("Silver") 
		hull(){
			cylinder(r=2.5,h=48,$fn=50,center=true);
			cylinder(r=2,h=49,$fn=50,center=true);	
		}
	}
}