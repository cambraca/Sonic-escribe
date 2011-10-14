/********************************************************
 Persistence of Vision Ray Tracer Scene Description File
 File       : croft.pov
 Version    : 3.1
 Description: Sample Scene using Blob Man
 Date       : April 2000 
 Author     : Peter Houston 
 Email      : houston.graphics@iname.com
 WWW        : http://welcome.to/HoustonGraphics
*********************************************************/

global_settings {  assumed_gamma 2.2 }

camera {  
    location  <0, 1.5, -3>
    direction 1.5*z
    right     4/3*x
    look_at   <-.25, 0, 0> 
}


sky_sphere {
    pigment {
        gradient y
        color_map { [0.0 color rgb <0.7,0.7,1.0>] [1.0 color blue 0.5] }
    }
}

light_source {
    <-80, 80, -80>
    color rgb <1,.9,.95>*1.5
    spotlight               
    point_at <0, 0, 0>      
    radius .1               
    tightness 75            
    falloff 3               
}

plane {y,0
  pigment {checker pigment {rgb 0}, pigment {rgb 1} rotate y*16}
}

#include "bmpeople.inc"
#include "bm_pose.inc"
#include "croft.cdf"

//#declare BM_HairStyle=0; // Uncomment to Test without Hiar

#declare BM_PoseNo=11;
#declare BM_EyeLids=<.35,0,.35>
#declare BM_Jaw=.25;
#declare BM_Mouth=1;
#declare BM_MouthShape=1;

Blob_Man(Female,2)
object {BlobMan 
        transform BMO_Abdomen_L
        rotate z*-85
}


// EOF