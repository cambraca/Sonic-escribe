/********************************************************
 Persistence of Vision Ray Tracer Scene Description File
 File       : Tufgirlz.pov
 BM_Version : 4.2
 Description: Sample Scene using Blob Man Figures
 Date       : April 2000 (amended July 2000)
 Author     : Peter Houston (amended by Ulrich von Bek) 
 Email      : houston.graphics@iname.com
 WWW        : http://welcome.to/HoustonGraphics
*********************************************************/

global_settings {  assumed_gamma 2.2 }

camera {  
    location  <0, 2, -5>
    direction 1.5*z
    right     4/3*x
    look_at   <-.25, 1, 0> 
}
light_source{<0,2,-5> rgb .5 shadowless}

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

#declare Hair=off; // Warning : Turning hair on increase parsing time !

#include "bmpeople.inc"
#include "Tufgirlz.cdf"
#include "Fempose.pos"

#declare BM_EyeLids=<.35,0,.35>;
#declare BM_Jaw=.25;
#declare BM_Mouth=1;
#declare BM_MouthShape=1;


#declare BM_HairStyle=2*Hair;
#declare BM_PoseNo=11;  // reclining
TufGirlz_Costume(0,9,9,9)  // underwear
Blob_Man(Female,1.8)
object {BlobMan 
        transform BMO_Abdomen_L
        rotate z*-85
}

#declare BM_HairStyle=1*Hair;
#declare BM_PoseNo=12;  // crucified
TufGirlz_Costume(0,1,0,0)  // underwear, croptop, jacket & skirt, shoes
Blob_Man(Female,1.8)
object {BlobMan 
        transform BMO_Toe_L
        translate <0,1,0>*BM_Scale
        translate <-.5,0,1>
}

#declare BM_HairStyle=2*Hair;
#declare BM_PoseNo=2;  // meditation
TufGirlz_Costume(4,9,9,9)  // boobtube & shorts
Blob_Man(Female,2)
object {BlobMan 
        transform BMO_Abdomen_U
        rotate y*45
        translate <1,0,-.5>
}                             

#declare BM_HairStyle=1*Hair;
#declare BM_PoseNo=7;  // hand stand
TufGirlz_Costume(0,0,1,0)  // underwear, blouse, miniskirt, shoes 
Blob_Man(Female,1.85)
object {BlobMan 
        transform BMO_Hand_R
        translate <-1,0,0>
}

#declare BM_HairStyle=3*Hair;
#declare BM_PoseNo=6;  // we're not worthy
TufGirlz_Costume(1,1,3,0)  // underwear, croptop, trousers, shoes
Blob_Man(Female,1.85)
object {BlobMan 
        transform BMO_Knee_R
        rotate y*-45 
        translate <0,1,0>*BM_Scale
        translate <-1.5,0,-1>
}                      

#declare BM_HairStyle=1*Hair;
#declare BM_PoseNo=8;  // sun bathing
TufGirlz_Costume(6,9,9,9)  // swimsuit
Blob_Man(Female,2)
object {BlobMan 
        transform BMO_Torso_B
        rotate x*99
        rotate y*30
        translate <1,0,2.5>
} 

// EOF