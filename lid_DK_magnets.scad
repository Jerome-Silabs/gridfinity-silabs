include <modules/gridfinity_constants.scad>
include <modules/silabs_constants.scad>
use <modules/module_gridfinity_block.scad>
use <modules/module_gridfinity_lid.scad>
use <modules/module_DK.scad>

/* [Size] */
// X/Y dimension. grid units (multiples of 42mm) .
width = [1, 0]; //0.1
depth = [2, 0]; //0.1

/* [Base Plate Options] */
Enable_Magnets = true;
Magnet_height = 2.4;
Magnet_diameter = 6.4;
Magnet_Size = Magnet_Size(Magnet_diameter,Magnet_height);

/* [union of gridfinity lid + wstk mounting support] */
union() {
    translate([1, 1, gf_min_base_height + gf_baseplate_riser_height])
    dk_support();
    gridfinity_lid(
        num_x = calcDimensionWidth(width),
        num_y = calcDimensionWidth(depth),
        magnetSize = Enable_Magnets ? Magnet_Size : [0.1,0.1], 
        magnetTopCover = MagnetTopCover,
        );
  }