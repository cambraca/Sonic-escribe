/*******************************************************
    POV-Ray - BlobMan People Costume Definition File
 File Name  : jc.cdf
 BM_Version : 4.2
 Description: Jesus Christ
 Date       : 29/04/2000
 Author     : Mike Williams
 Email      : mike@econym.demon.co.uk
 WWW        : http://www.econym.demon.co.uk/            

 Notes :

 Parameters
 
    These parameters can be set before calling the cdf
 
      JC_Nails : set this to 0 to remove the nails that pierce the
                 hands and feet.
      JC_Thorns: set this to 0 to remove the crown of thorns

    By default, the nails and thorns are present
    
 Pose
 
    The nails that pierce the hands only make sense when the
    arms are in a "crucifix" pose. I.e. something like
    
      #declare BM_RA_S2E   = <0,0,-110>; // Right Upperarm
      #declare BM_RA_E2W   = <0,0,-120>; // Right Forearm
      #declare BM_RH_Rot   = <0,90,0>;   // Right Hand

      #declare BM_LA_S2E   = <0,0,110>;  // Left Upperarm
      #declare BM_LA_E2W   = <0,0,120>;  // Left Forearm
      #declare BM_LH_Rot   = <0,-90,0>;  // Left Hand

 Beard positioning
 
    The position of the beard relies on BM_Jaw, so ensure that
    this is declared before calling the cdf, otherwise you're
    liable to get a mouthful of hair.


 Hair

    This CDF includes a hair setting.  To test render
    scenes without hair enter the following code
    after the CDF is included
    
        #decalre BM_HairStyle=0;
    
    Then just remove it when you want the hair.

********************************************************
  Parameter defaults
********************************************************/

#ifndef (JC_Nails)
    #declare JC_Nails = 1;
#end
#ifndef (JC_Thorns)
    #declare JC_Thorns = 1;
#end
#ifndef (BM_Jaw)
    #declare BM_Jaw=.5;
#end
 
/********************************************************/
#declare CDF=true; //Used by Body_Part_Viewer.pov Can be removed. 

/********************************************************/
#include "bm_hair.inc"

/********************************************************
  Image Maps & Textures
********************************************************/

#declare BM_Skin_Tex  = texture {
  pigment {rgb <0.8,0.6,0.4>}
}                         

/********************************************************
  Body Part Options
********************************************************/
                                 
#declare BM_Hair_Col=<0.35, 0.20, 0.1>;

#declare BM_HairStyle=2;

#declare BM_EyeCol=<.25,.25,0>;                                 

/********************************************************
  Body Part Objects
********************************************************/

#declare Spike = union {
     cylinder {<-2,-1.5,0><2,-1.5,0>0.4}
     sphere {0,1 scale <0.3,0.6,0.6> translate <-2,-1.5,0>}
     pigment {rgb <0.2,0.1,0.1>}
}

#declare Spike2 = union {
     cylinder {<0,-4,-3><0,0,-3>0.4}
     sphere {0,1 scale <0.6,0.3,0.6> translate <0,0,-3>}
     pigment {rgb <0.2,0.1,0.1>}
}

#declare D = 0.4;
#declare Loincloth = union {
    //cylinder {-y,y,1 scale <7.8,1.5,5.4-D> translate -28*y}
    cylinder {-y,y,1 scale <7.4,2.0,5.2-D> translate -28*y}
    cylinder {-y,y,1 scale <7.0,2.5,5.0-D> translate -28*y}
    
    cylinder {-x,x,1 scale <1.2,3.0,5.2-D> translate -30*y}
    cylinder {-x,x,1 scale <2.0,2.5,5.2-D> translate -30*y}
    cylinder {-x,x,1 scale <3.0,2.0,5.2-D> translate -30*y}
    translate -D*z
    pigment {rgb 0.9}
}

#local rr=seed(77);
#macro BHair() 
  blob {
  threshold 0.5
  #declare bh = 0;
  #while (bh < 1)
    sphere {<bh*rand(rr),bh,bh*rand(rr)>,0.3,1}
    #declare bh = bh + 0.1;
  #end
  }
#end

#declare Beard = union {
    #declare xx=-2.75;
    #while (xx<3)
      #declare zz=-3+xx*xx/3;
      object {BHair()
              scale <1,(-8+xx*xx/4+5-abs(xx)/2),1>
              translate <xx,-5+abs(xx)/2,zz>
      #ifndef (BM_Hair_Tex)
        pigment{rgb BM_Hair_Col+<rand(rr)/10,rand(rr)/10,rand(rr)/10>}
      #else
        texture {BM_Hair_Tex}
      #end
      }
      #declare xx=xx+0.5;
    #end
    rotate x*(5+(BM_Jaw)*-12)
}

#declare Thorns = union {
   torus {5,0.2}
   #declare A=0;
   #while (A<360)
     cone {0,0.7,x*1.5,0
       scale <1,0.2,1>
       rotate z*(rand(rr)*60-30)
       translate x*5
       rotate A*y
     }
     #declare A=A+30;
   #end
   pigment {rgb 0.4}
}       




#declare BM_Head_Object= union {
  object{BM_Head_Object}
  object{Beard}
  #if (JC_Thorns)
    object{Thorns rotate y*360*rand(rr) rotate z*10 translate y*2}
    object{Thorns rotate y*360*rand(rr) rotate x*10 translate y*2}
    object{Thorns rotate y*360*rand(rr) rotate -z*10 translate y*2}
  #end
}


#declare BM_Torso_Object=union {
  object{BM_Torso_Object}
  object{Loincloth}
}
  
#if (JC_Nails)
  #declare BM_Hand_R_Object=union {
    object {BM_Hand_R_Object}
    object {Spike scale <-1,1,1>}
  }  
  #declare BM_Hand_L_Object=union {
    object {BM_Hand_L_Object}
    object {Spike}
  }  
  #declare BM_Foot_R_Object=union {
    object {BM_Foot_R_Object}
    object {Spike2}
  }  
  #declare BM_Foot_L_Object=union {
    object {BM_Foot_L_Object}
    object {Spike2}
  }  
#end

// End of Costume Definition File