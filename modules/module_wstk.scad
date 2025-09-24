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

module picobase(db=10,dp=3,hb=5,hp=5)
{   
    translate([0, 0, hb/2])
    cylinder(h = hb, r1 = db/2, r2 = db/2, center = true, $fn=100);
    
}

module picocenter(db=10,dp=3,hb=5,hp=5)
{   
    translate([0, 0, hb/2+hb])
    cylinder(h = hp*10, r1 = dp/2, r2 = dp/2, center = true, $fn=100);
    
}

module picowstk(ox=-20.5,oy=-3,oz=-0.3,e=3,db=7,dp=2.5,hb=5,hp=5)
{
    translate([ox+36, oy+42, oz+e/2])
    difference(){picobase(db,dp,hb,hp);
    picocenter(db,dp,hb,hp);}
    translate([ox+132.5, oy+60, oz+e/2])
    difference(){picobase(db,dp,hb,hp);
    picocenter(db,dp,hb,hp);}
    translate([ox+132.5, oy+6, oz+e/2])
    difference(){
    picobase(db,dp,hb,hp);
    picocenter(db,dp,hb,hp);
    }
    
}

module wstk_support(ox=-20.5,oy=-3,oz=-0.3,e=2)
{
    db=7;
    dp=2.5;
    hb=7;
    hp=5;

union(){   
    picowstk(ox=0,oy=0,oz=-0.3,e=3,db,dp,hb,hp);
    roundedcube(166,82,e,e);
    }
}


/* ---------------- */
  
wstk_support();