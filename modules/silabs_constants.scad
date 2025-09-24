include <gridfinity_constants.scad>

/* [Size] */
// X dimension. grid units (multiples of 42mm) or mm.
width = [1, 0]; //0.1
// Y dimension. grid units (multiples of 42mm) or mm.
depth = [2, 0]; //0.1
center_fill_grid_x = true;
center_fill_grid_y = true;

/* [Model detail] */
//assign colours to the bin
set_colour = "disable"; //[disabled, enable, preview, lip]
render_position = "center"; //[default,center,zero]

set_environment(
  width = width,
  depth = depth,
  render_position = render_position,
  setColour = set_colour);

Magnet_height = 2.4;
MagnetZOffset = 5;
MagnetTopCover = gf_min_base_height - Magnet_height;
Reduced_Wall_Height = -0.1; //0.1

function Magnet_Size(a,b) = [a, b + gf_min_base_height];

/* [Lid Options] */
Lid_Include_Magnets = false;

fa = 6; 
fs = 0.1; 
fn = 0;  
random_seed = 0; //0.0001
//Some online generators do not like direct setting of fa,fs,fn
$fa = fa; 
$fs = fs; 
$fn = fn;  