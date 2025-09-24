// include instead of use, so we get the pitch
include <gridfinity_constants.scad>
use <module_gridfinity_block.scad>
use <module_gridfinity_lid.scad>


module roundedcube(xdim ,ydim ,zdim,rdim){
    hull(){
        translate([rdim,rdim,0])cylinder(h=zdim,r=rdim);
        translate([xdim-rdim,rdim,0])cylinder(h=zdim,r=rdim);

        translate([rdim,ydim-rdim,0])cylinder(h=zdim,r=rdim);
        translate([xdim-rdim,ydim-rdim,0])cylinder(h=zdim,r=rdim);
        }
}

module cr2032_battery() {
    battery_diameter = 20;
    battery_height = 3.2;
    top_terminal_diameter = 16;
    terminal_height = 0.2;

    // Main body
    cylinder(h = battery_height, d = battery_diameter, $fn=100);
    translate([0, 0, battery_height])
    cylinder(h = terminal_height, d = top_terminal_diameter, $fn=100);
}

module battery_pole(h=10,e=3)
{
union()
 {
 translate([0, 40, -1.5])
    cube([7,5,7],true);
 difference()
    {
    union(){
        translate([-11, 0, -5])
            roundedcube(21,14,8.5,e);
        translate([-0.5,5, 0.2])
            scale([1,1.2,1]){
                cr2032_battery();}
        }
    translate([-15, 4, -5.2])
        cube([30,15,5.5]);
    translate([-20, -5, -5])
        rotate([45,0,00])
        cube([40,20,11]);
    }  
 }
}


module dk_support(ox=-20.5,oy=-3,oz=-0.3,e=2)
{

union(){  
    translate([0, 0, 0])
    roundedcube(42-2,82,e,e); 
    translate([21, 17, 7])
    battery_pole();
    }
}



/*--------------------*/
  
dk_support();

 
  