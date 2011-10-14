/*******************************************************
 Persistence of Vision Ray Tracer Scene Description File
 File Name : silversurfer.pov
 Version   : 3.1
 Desciption: Tribute to the comics I read as a youth.
 Date      : 23 April 1999 
 Author    : Peter Houston
 Email     : houston.graphics@iname.com
 WWW       : http://members.xoom.com/HoustonGraph/
********************************************************/

#version 3.1;

#include "metals.inc"

global_settings {
        assumed_gamma 2.2
}

// ----------------------------------------

camera {
        location  <-.5, -1, -5>
        direction 1.5*z
        right     4/3*x
        look_at   <0, .5,  0.0>
        //rotate z*-15
}


sky_sphere {
            pigment {
                     gradient z
                     color_map { 
                                 [0.0 color rgb <0.7,0.7,1.0>] 
                                 [1.0 color blue 0.5] 
                     }
            } 
            
}
                           

  background {rgb .5}
light_source {
        <-30, 100, -200>
        rgb <.95,.98,.99>  
}

// ----------------------------------------

#declare BM_Skin_Tex=texture {T_Chrome_1E}
#declare BM_Lip_Tex=BM_Skin_Tex
#declare BM_Tooth_Tex=BM_Skin_Tex
#declare BM_EyeShadow=BM_Skin_Tex
#include "bmpeople.inc"
#include "bm_pose.inc" 

#declare BM_PoseNo=9
#declare BM_EyeSet=<1,0,1>;
#declare BM_Eyes=0;
#declare BM_Jaw=0; 
#declare BM_Mouth=1;
#declare BM_MouthShape=1;
#declare BM_Jowls=-.25;
#declare BM_Ears=1;
#declare BM_Teeth=0;

#declare DeBug=off;

Blob_Man(1,2)
    union {
           
            object{ BlobMan 
                    transform BMO_Foot_L 
                    rotate z*-4.5
                    rotate y*-20
                    translate <.9,.06,0>
            }
            
            sphere { <0,0,0>.6 
                     scale <3.5,.1,.5> 
                     texture {T_Chrome_1E}
            } 
       rotate y*30              
       rotate z*15
    }
    

  


//EOF