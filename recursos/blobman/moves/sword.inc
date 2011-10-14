
// Persistence of Vision Ray Tracer Scene Description File
// File: sword.inc
// Vers: 3
// Date: ??/9/97  (revised in 02/98)
// Auth: Francisco Muñoz
// A pseudo gladius (Roman short sword)
// Scale: 1 unit = 10 cm.

#ifndef (SWORD_INC)
#declare SWORD_INC = version
#version 3


#ifndef (Black) #include "colors.inc" #end
#ifndef (Gold_Texture) #include "textures.inc" #end

#ifndef (My_Cord_Texture)
 #declare My_Cord_Texture = texture {
    pigment {
        gradient y
        turbulence 0.01
     /*   color_map {
        [0  color Black]
        [0.01  color Red]
        [0.09  color Red]
        [0.1  color Black]
        [0.11  color Red]
        [0.19  color Red]
        [0.2  color Black]
        [0.21  color Red]
        [0.29  color Red]
        [0.3  color Black]
        [0.31  color Red]
        [0.39  color Red]
        [0.4  color Black]
        [0.41  color Red]
        [0.49  color Red]
        [0.5  color Black]
        [0.51  color Red]
        [0.59  color Red]
        [0.6  color Black]
        [0.61  color Red]
        [0.69  color Red]
        [0.7  color Black]
        [0.71  color Red]
        [0.79  color Red]
        [0.8  color Black]
        [0.81  color Red]
        [0.89  color Red]
        [0.9  color Black]
        [0.91  color Red]
        [0.99  color Red]
        [1  color Black]
        }   */
        color_map {
        [0  color Black]
        [0.01  color ForestGreen]
        [0.09  color Black]
        [0.1  color Black]
        [0.11  color ForestGreen]
        [0.19  color Black]
        [0.2  color Black]
        [0.21  color ForestGreen]
        [0.29  color Black]
        [0.3  color Black]
        [0.31  color ForestGreen]
        [0.39  color Black]
        [0.4  color Black]
        [0.41  color ForestGreen]
        [0.49  color Black]
        [0.5  color Black]
        [0.51  color ForestGreen]
        [0.59  color Black]
        [0.6  color Black]
        [0.61  color ForestGreen]
        [0.69  color Black]
        [0.7  color Black]
        [0.71  color ForestGreen]
        [0.79  color Black]
        [0.8  color Black]
        [0.81  color ForestGreen]
        [0.89  color Black]
        [0.9  color Black]
        [0.91  color ForestGreen]
        [0.99  color Black]
        [1  color Black]
        }
    }
}
#end

#ifndef (Gem_Texture)
#declare Gem_Texture = texture {
    finish {
        ambient 0.1
        diffuse 0.1
        reflection .25
        refraction 1
        ior 1.5
        specular 1
        roughness .001
    }
}
#end

#declare Gem = object {
    sphere {<0,0,0>,.15}
}
#declare Hilt = union {
    intersection {
        sphere {<0,1,0>,1 scale <.2,1,.2> texture {My_Cord_Texture}}
        box {<-.25,.25,-.25>,<.25,1.8,.25>}
        }
    cylinder {<0,0,-.075>,<0,0,.075>,.25
        texture {Gold_Texture}}
    difference {
        cylinder {<0,0,-.1>,<0,0,.1>,.25}
        cylinder {<0,0,-.15>,<0,0,.15>,.15}
        texture {Gold_Texture}
    }
    object {Gem
        texture {Gem_Texture
           pigment { color rgbf <0.3, 0.1, 0.8, 0.8> }
        }
    }
    cylinder {<0,.15,0>,<0,.25,0>,.2
        texture {Gold_Texture}}
    difference{
        union{
            box {<.5,2.5,.2>,<-.5,1.75,-.2>}
            cylinder {<.5,2.5,0>,<.5,1.75,0>,.2}
            cylinder {<-.5,2.5,0>,<-.5,1.75,0>,.2}
        }
        cylinder {<0,0,.25>,<0,0,-.25>,1 scale <1,.3,1>
            translate y*2.55}
        intersection {
            cylinder {<0,0,.25>,<0,0,-.25>,1 inverse
                scale <1,.3,1>
                translate y*2.05}
            plane {y,2}
            }
        texture {Gold_Texture}
    }
    difference {
        cylinder {<0,2,.23>,<0,2,-.23>,.2}
        cylinder {<0,2,.24>,<0,2,-.24>,.17}
        texture {Gold_Texture}
    }
    object {Gem
        scale <.75,1,.75>
        translate <0,2,.2>
        texture {Gem_Texture
           pigment { color rgbf <0.8, 0.2, 0.2, 0.8> }
        }
    }
    object {Gem
        scale <.75,1,.75>
        translate <0,2,-.2>
        texture {Gem_Texture
           pigment { color rgbf <0.8, 0.2, 0.2, 0.8> }
        }
    }
}
#declare Blade = union {
    box { <.125,2,.125>,<-.125,6,-.125>
        rotate y*45
        scale <2,1,1>
        }
    triangle {<-.3535,6,0>,<0,6,.176>,<0,7,0>}
    triangle {<.3535,6,0>,<0,6,.176>,<0,7,0>}
    triangle {<-.3535,6,0>,<0,6,-.176>,<0,7,0>}
    triangle {<.3535,6,0>,<0,6,-.176>,<0,7,0>}
    texture {Silver_Texture}
}

#declare Sword = union {
    object {Hilt}
    object {Blade}
//    translate <0,-0.5,0>   
 //   rotate y*60
 //   rotate x*-80
 //   scale 1.18
}


// uncomment the section below to render a view of the scene
/*
object {Sword rotate <90,95,0> translate <-3,.25,0>}
plane { y, 0 pigment {color Gray90}}
plane { z, 4.5 inverse pigment {color Gray90} rotate -y*35}
plane { x, 4.5 inverse pigment {color Gray90} rotate -y*35}
camera {  location  <0.01, 5, -5>  look_at   <0, 0.9,  0> }
light_source { <3, 15, -3>  color White }
*/
#version SWORD_INC
#end
