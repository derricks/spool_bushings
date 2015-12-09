// Creates a cylinder with a hole in the middle for a 608zz bearing
// and various holes around the spokes for reducing plastic usage

spool_center_radius = 40;
spool_center_length = 30;
filler_radius = 5;
bearing_radius = 11;
bearing_height = 8;
filling_center_radius = ((spool_center_radius - bearing_radius)/2) + bearing_radius;
shaft_radius = 4.2;

difference() {
  cylinder(r=spool_center_radius, h=spool_center_length, center=true);

  // shaft bore
  translate([0,0,-1])
     cylinder(r=shaft_radius,h=spool_center_length + 3, center = true);

  // the bearing bore
  translate([0,0,spool_center_length - bearing_height - 1])
    cylinder(r=bearing_radius, h=(spool_center_length - bearing_height) + 3, center = true);


    // now holes at 45-degree angles just to reduce plastic usage
   for (angle = [0:45:360]) 	{
     translate([cos(angle)*filling_center_radius, sin(angle)*filling_center_radius, -1])
       cylinder(r=filler_radius, h = spool_center_length + 3, center = true);
   }
}