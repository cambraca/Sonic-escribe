//#version unofficial MegaPov 0.4;
//#include "colors.inc"

#declare Alt=1;         // ground to toe height
#declare Camera = 1;    // 1=800*600, 2=600*800, 3=just the face
#declare Hairy = 1;     // 0 = no hair

#if (Camera=1)
  camera { location  <0, 1, -4> look_at <-0.7, Alt+0.6, 0> angle 58 }
#end  
#if (Camera=2)
  camera { location  <0, 1, -4> look_at <0, Alt+0.7, 0> angle 57 right 0.75*x }
#end  
#if (Camera=3)
  camera { location  <0, 1, -4> look_at <0, Alt+1.8, 0> angle 7 }
#end  

sky_sphere { pigment {
    gradient y scale 0.6
    color_map { [0.0 color blue 0.6] [1.0 color rgb 1] }
  }
}

light_source {<-20,20,-100> colour rgb 1.5}

// ----------------------------------------
        
plane { y, 0 pigment {color rgb <0.3,0.5,0.3>}}

#include "colors"
#include "woods"

#declare T = texture{T_Wood15 scale 0.1}


//#declare JC_Nails = 0;
//#declare JC_Thorns = 0;

#include "bmpeople.inc"

//#include "bm_pose.inc"

#include "bm_hands.inc"

#declare BM_Pose=array[1][17]
  {
     { <0,0,0> ,<0,0,0> ,<0,0,0> ,<0,0,-110> ,<0,0,-120> ,<0,0,110> ,
     <0,0,120> ,<0,0,-4> ,<0,0,0> ,<0,0,4> ,<0,0,0> ,
     <-50,0,0> ,<-50,0,0> ,<50,0,50> ,<0,90,0> ,<0,-90,0> , <0,0,1> },
  }
#declare BM_PoseNo=0;



#declare BM_EyeLids=<.35,0,.35>;
#declare BM_Jaw=.25;
#declare BM_Mouth=1;
#declare BM_MouthShape=1;

#include "jc.cdf"

#if (Hairy = 0)
  #declare BM_HairStyle=0; // to Test without Hair
#end


Blob_Man(Male,2)

#declare Everything = union {
  object {BlobMan 
          transform BMO_Foot_L 
          rotate <-50,0,0>
          translate Alt*y
  }
  box {<-0.1,0,0.2> <0.1,2.5+Alt,0.4> texture{T rotate x*90} translate -0.04*x}
  box {<-1.1,1.9+Alt,0.2> <1.1,2.1+Alt,0.4>  texture{T rotate y*90} translate -0.04*x}
  box {-0.1,0.1 texture {T translate x*3} rotate x*50 translate <-.04,Alt,0.2>}
}

object {Everything rotate y*25}