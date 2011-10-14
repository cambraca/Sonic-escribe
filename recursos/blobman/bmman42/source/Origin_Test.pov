global_settings { assumed_gamma 2.2 }

camera { 
   location <0, 1, -3.5>
   direction 1.5*z
   right 4/3*x
   look_at <0, 1, 0.0> 
}

sky_sphere {
   pigment {
   gradient y
       color_map { 
           [0.0 color rgb <0.7,0.7,1.0>] 
           [1.0 color blue 0.5] 
       }
   }
}

light_source {
   0*x 
   color rgb <1,.9,.95>*1.5 
   translate <-80, 40, -80>
}


cylinder {<0,0,0><0,-2,0> 20
       pigment {rgb 1} 
}

/***********************************************************
 The following code loads the Blob Man Include and Pose files 
 and creates the one Male and one Female Figure
************************************************************/
#include "bmpeople.inc"

// Declare Basic Pose
#declare BM_Head_Rot     = <0,0,0> ;
#declare BM_Neck_Rot     = <0,0,0> ;
#declare BM_Torso_Rot    = <0,0,0> ;
#declare BM_RA_S2E       = <0,0,-90> ;
#declare BM_RA_E2W       = <0,0,-90> ;
#declare BM_LA_S2E       = <90,0,0> ;
#declare BM_LA_E2W       = <90,0,0> ;
#declare BM_RL_H2K       = <8,0,-8> ;
#declare BM_RL_K2A       = <-8,0,0> ;
#declare BM_LL_H2K       = <45,0,8> ;
#declare BM_LL_K2A       = <0,0,0> ;
#declare BM_RF_Rot       = <0,0,0> ;
#declare BM_LF_Rot       = <0,0,0> ;
#declare BM_Toe_Angle    = <30,0,30> ;
#declare BM_RH_Rot       = <0,0,0> ;
#declare BM_LH_Rot       = <0,90,0> ;
    
cylinder {x*.5,x*-.5,.025 pigment {rgb x}}
cylinder {y*.5,y*-.5,.025 pigment {rgb y}}
cylinder {z*.5,z*-.5,.025 pigment {rgb z}}

Blob_Man(Male,2)
   object {BlobMan 
   transform // Enter Transformation Here
}
