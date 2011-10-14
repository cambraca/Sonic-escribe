/*******************************************************
 Persistence of Vision Ray Tracer Scene Description File
 File Name : Body_Part_Viewer.pov
 Version   : POV v 3.1 : Blob_Man v4.0
 Desciption: View the inividual body parts of Blob Man
             Use it to check positioning of Limb Objects
 Date      : 01 March 2000
 Author    : Peter Houston
 Email     : houston.graphics@iname.com
 WWW       : http://welcome.to/HoustonGraphics
             http://members.xoom.com/HoustonGraph
********************************************************/
#include "bmpeople.inc"
#include "bm_hands.inc"
/*******************************************************
Include the Costume Definition File Here
********************************************************/
//#include "filname.cdf"

#ifndef (CDF)
    #declare CDF=false;
#end
/*******************************************************
    Body Part Switch Number
    =======================
    1  = Head
    2  = Torso
    3  = Upperarm Right
    4  = Upperarm Left
    5  = Forearm Right
    6  = Forearm Left
    7  = Hand Right
    8  = Hand Left
    9  = Thigh Right
    10 = Thigh Left
    11 = Calf Right
    12 = Calf Left 
    13 = Foot Right
    14 = Foot Left
********************************************************/
#declare Body_Part_Switch =1;
#declare BM_Gender=1;   // 0=Male 1=Female
#declare HandPoseNo=0;  // Hand Pose as defined in "bm_hands.inc"

#if (CDF=false)  // The following options only apply if no CDF is included (see above)
    #declare BM_Jowls=0; // Jowl Mass Range: 0-3
    #declare BM_Teeth=1; // 0 = No Teeth, 1 = Teeth
    #declare BM_Nose=.5; // Nose Size Range : 0 - 1.25 : Default=0.5
    #declare BM_Jaw=.65; // Jaw Opening
    #declare BM_Mouth=1; // Mouth Size
    #declare BM_MouthShape=1; // + Mouth Corners Up / - Mouth Corners Down
#end

#declare ShowXYZ=on;  // Places a visible marker at <0,0,0>
                      // Please Note that the DeBug variable 
                      // does not work in this file.

#declare XYZ= union {cylinder {<-8,0,0><8,0,0>.25 pigment {rgb x}}
                     cylinder {<0,-8,0><0,8,0>.25 pigment {rgb y}}
                     cylinder {<0,0,-8><0,0,8>.25 pigment {rgb z}}
              }
#declare BM_RA_S2E= <0,0,0>;
#declare BM_RA_E2W= <0,0,0>;
#declare BM_LA_S2E= <0,0,0>;
#declare BM_LA_E2W= <0,0,0>;
#declare BM_RL_H2K= <0,0,0>; 
#declare BM_RL_K2A= <0,0,0>;
#declare BM_LL_H2K= <0,0,0>;
#declare BM_LL_K2A= <0,0,0>;
#declare BM_RH_Rot= <0,0,0>;
#declare BM_LH_Rot= <0,0,0>;
#declare BM_RF_Rot= <0,0,0>;
#declare BM_LF_Rot= <0,0,0>;
#declare BM_Toe_Angle= <0,0,0>;
#declare BM_Head_Rot= <0,0,0>;
#declare BM_Neck_Rot= <0,0,0>; 
#declare BM_Torso_Rot= <0,0,0>;
#declare BM_Toe_Angle=<0,0,0>;

#declare BM_PoseNo=-1;

#switch (Body_Part_Switch)
    #case (1)
        plane {z,100  pigment {checker rgb .15,rgb .25} scale 2*2 translate y*2}
        #declare Title="Head"
        #if (ShowXYZ=on)
            #declare BM_Head_Object=union {object {BM_Head_Object} object {XYZ}}
        #end
        #declare BodyPart = 
            object {
                bmhead()
                translate y*-5
                scale 2
            }
    #break
    #case (2)
        plane {z,100  pigment {checker rgb .15,rgb .25} scale 2*1.5}
        #declare Title="Torso"
        #declare BM_R_Upperarm_Mass=0;
        #declare BM_R_Forearm_Mass=0;
        #declare BM_L_Upperarm_Mass=0;
        #declare BM_L_Forearm_Mass=0;
        #declare BM_R_Thigh_Mass=0;
        #declare BM_R_Calf_Mass=0;
        #declare BM_L_Thigh_Mass=0;
        #declare BM_L_Calf_Mass=0;
    
        #declare BM_Upperarm_R_Object=object{BM_nul}
        #declare BM_Upperarm_L_Object=object{BM_nul}
        #declare BM_Forearm_R_Object=object{BM_nul}
        #declare BM_Forearm_L_Object=object{BM_nul}
        #declare BM_Thigh_R_Object=object{BM_nul}
        #declare BM_Thigh_L_Object=object{BM_nul}
        #declare BM_Calf_R_Object=object{BM_nul}
        #declare BM_Calf_L_Object=object{BM_nul}
        #if (ShowXYZ=on)
            #declare BM_Torso_Object=union {object {BM_Torso_Object} object {XYZ}}
        #end
   
        #declare BodyPart=
            union {
                bmtorso() 
                scale 1.5
            }
    #break
    #case (3)
        plane {z,100  pigment {checker rgb .15,rgb .25} scale 2*1.5}
        #declare Title="Right Upperarm"
        #declare BM_R_Forearm_Mass=0;
        #declare BM_L_Upperarm_Mass=0;
        #declare BM_L_Forearm_Mass=0;
        #declare BM_R_Thigh_Mass=0;
        #declare BM_R_Calf_Mass=0;
        #declare BM_L_Thigh_Mass=0;
        #declare BM_L_Calf_Mass=0;
        #declare BM_Torso_Mass=0;
        #declare BM_Abdomen_Mass=0;
        #declare BM_Neck_Mass=0;
    
        #declare BM_Neck_Object=object{BM_nul}
        #declare BM_Torso_Object=object{BM_nul}
        #declare BM_Abdomen_Object=object{BM_nul}
        #declare BM_Upperarm_L_Object=object{BM_nul}
        #declare BM_Forearm_R_Object=object{BM_nul}
        #declare BM_Forearm_L_Object=object{BM_nul}
        #declare BM_Thigh_R_Object=object{BM_nul}
        #declare BM_Thigh_L_Object=object{BM_nul}
        #declare BM_Calf_R_Object=object{BM_nul}
        #declare BM_Calf_L_Object=object{BM_nul}
        #declare BM_Neck_Object=object{BM_nul}
        #if (ShowXYZ=on)
            #declare BM_Upperarm_R_Object=union {object {BM_Upperarm_R_Object} object {XYZ}}
        #end
    
        #declare BodyPart=
            union {
                bmtorso() 
                translate <9,-5,0>
                scale 1.5
            }
    #break
    #case (4)
        plane {z,100  pigment {checker rgb .15,rgb .25} scale 2*1.5}
        #declare Title="Left Upperarm"
        #declare BM_R_Upperarm_Mass=0;
        #declare BM_R_Forearm_Mass=0;
        #declare BM_L_Forearm_Mass=0;
        #declare BM_R_Thigh_Mass=0;
        #declare BM_R_Calf_Mass=0;
        #declare BM_L_Thigh_Mass=0;
        #declare BM_L_Calf_Mass=0;
        #declare BM_Torso_Mass=0;
        #declare BM_Abdomen_Mass=0;
        #declare BM_Neck_Mass=0;
    
        #declare BM_Neck_Object=object{BM_nul}
        #declare BM_Torso_Object=object{BM_nul}
        #declare BM_Abdomen_Object=object{BM_nul}
        #declare BM_Upperarm_R_Object=object{BM_nul}
        #declare BM_Forearm_R_Object=object{BM_nul}
        #declare BM_Forearm_L_Object=object{BM_nul}
        #declare BM_Thigh_R_Object=object{BM_nul}
        #declare BM_Thigh_L_Object=object{BM_nul}
        #declare BM_Calf_R_Object=object{BM_nul}
        #declare BM_Calf_L_Object=object{BM_nul}
        #declare BM_Neck_Object=object{BM_nul}
        #if (ShowXYZ=on)
            #declare BM_Upperarm_L_Object=union {object {BM_Upperarm_L_Object} object {XYZ}}
        #end
    
        #declare BodyPart=
            union {
                bmtorso() 
                translate <-9,-5,0>
                scale 1.5
            }
    #break
    #case (5)
        plane {z,100  pigment {checker rgb .15,rgb .25} scale 2*1.5}
        #declare Title="Right Forearm"
        #declare BM_R_Upperarm_Mass=0;
        #declare BM_L_Upperarm_Mass=0;
        #declare BM_L_Forearm_Mass=0;
        #declare BM_R_Thigh_Mass=0;
        #declare BM_R_Calf_Mass=0;
        #declare BM_L_Thigh_Mass=0;
        #declare BM_L_Calf_Mass=0;
        #declare BM_Torso_Mass=0;
        #declare BM_Abdomen_Mass=0;    
        #declare BM_Neck_Mass=0;
        
        #declare BM_Neck_Object=object{BM_nul}
        #declare BM_Torso_Object=object{BM_nul}
        #declare BM_Abdomen_Object=object{BM_nul}
        #declare BM_Upperarm_R_Object=object{BM_nul}
        #declare BM_Upperarm_L_Object=object{BM_nul}
        #declare BM_Forearm_L_Object=object{BM_nul}
        #declare BM_Thigh_R_Object=object{BM_nul}
        #declare BM_Thigh_L_Object=object{BM_nul}
        #declare BM_Calf_R_Object=object{BM_nul}
        #declare BM_Calf_L_Object=object{BM_nul}
        #declare BM_Neck_Object=object{BM_nul}
        #if (ShowXYZ=on)
            #declare BM_Forearm_R_Object=union {object {BM_Forearm_R_Object} object {XYZ}}
        #end    
        #declare BodyPart=
            union {
                bmtorso()
                translate <9,6,0>
                scale 1.5
            }
    #break
    #case (6)
        plane {z,100  pigment {checker rgb .15,rgb .25} scale 2*1.5}
        #declare Title="Left Forearm"
        #declare BM_R_Upperarm_Mass=0;
        #declare BM_R_Forearm_Mass=0;
        #declare BM_L_Upperarm_Mass=0;
        #declare BM_R_Thigh_Mass=0;
        #declare BM_R_Calf_Mass=0;
        #declare BM_L_Thigh_Mass=0;
        #declare BM_L_Calf_Mass=0;
        #declare BM_Torso_Mass=0;
        #declare BM_Neck_Mass=0;
    
        #declare BM_Neck_Object=object{BM_nul}
        #declare BM_Torso_Object=object{BM_nul}
        #declare BM_Abdomen_Object=object{BM_nul}
        #declare BM_Upperarm_R_Object=object{BM_nul}
        #declare BM_Upperarm_L_Object=object{BM_nul}
        #declare BM_Forearm_R_Object=object{BM_nul}
        #declare BM_Thigh_R_Object=object{BM_nul}
        #declare BM_Thigh_L_Object=object{BM_nul}
        #declare BM_Calf_R_Object=object{BM_nul}
        #declare BM_Calf_L_Object=object{BM_nul}
        #declare BM_Neck_Object=object{BM_nul}
        #if (ShowXYZ=on)
            #declare BM_Forearm_L_Object=union {object {BM_Forearm_L_Object} object {XYZ}}
        #end    
    
        #declare BodyPart=
            union {
                bmtorso() 
                translate <-9,12,0>
                scale 1.5
            }
    #break
    #case (7)
        plane {z,100  pigment {checker rgb .15,rgb .25} scale 2*3.5 translate y*3.5}
        #declare Title="Right Hand"
        #if (HandPoseNo>=0)
            #declare BM_RFP_Pos=BM_Hands[HandPoseNo][0];
            #declare BM_RFR_Pos=BM_Hands[HandPoseNo][1];
            #declare BM_RFM_Pos=BM_Hands[HandPoseNo][2];
            #declare BM_RFI_Pos=BM_Hands[HandPoseNo][3];
            #declare BM_RFT_Pos=BM_Hands[HandPoseNo][4];        
        #end
        #if (ShowXYZ=on)
            #declare BM_Hand_R_Object=union {object {BM_Hand_R_Object} object {XYZ scale .5}}
        #end    

        #declare BodyPart=
            object {
                bmhand(-1)
                translate <9,30,0>
                scale 3.5
            }
    #break
    #case (8)
        plane {z,100  pigment {checker rgb .15,rgb .25} scale 2*3.5 translate y*3.5}
        #declare Title="Left - Hand"
        #if (HandPoseNo>=0)
            #declare BM_LFP_Pos=BM_Hands[HandPoseNo][0];
            #declare BM_LFR_Pos=BM_Hands[HandPoseNo][1];
            #declare BM_LFM_Pos=BM_Hands[HandPoseNo][2];
            #declare BM_LFI_Pos=BM_Hands[HandPoseNo][3];
            #declare BM_LFT_Pos=BM_Hands[HandPoseNo][4];        
        #end
        #if (ShowXYZ=on)
            #declare BM_Hand_L_Object=union {object {BM_Hand_L_Object} object {XYZ scale .5}}
        #end    

        #declare BodyPart=
            union {
                bmhand(1)
                translate <-9,30,0>
                scale 3.5
            }
    #break
    #case (9)
        plane {z,100  pigment {checker rgb .15,rgb .25} scale 2*1.5 translate y*1.5}
        #declare Title="Right Thigh"
        #declare BM_R_Upperarm_Mass=0;
        #declare BM_R_Forearm_Mass=0;
        #declare BM_L_Upperarm_Mass=0;
        #declare BM_L_Forearm_Mass=0;
        #declare BM_R_Calf_Mass=0;
        #declare BM_L_Thigh_Mass=0;
        #declare BM_L_Calf_Mass=0;
        #declare BM_Torso_Mass=0;  
        #declare BM_Abdomen_Mass=0;        
        #declare BM_Neck_Mass=0;
    
        #declare BM_Neck_Object=object{BM_nul}
        #declare BM_Torso_Object=object{BM_nul}
        #declare BM_Abdomen_Object=object{BM_nul}
        #declare BM_Upperarm_R_Object=object{BM_nul}
        #declare BM_Upperarm_L_Object=object{BM_nul}
        #declare BM_Forearm_R_Object=object{BM_nul}
        #declare BM_Forearm_L_Object=object{BM_nul}
        #declare BM_Thigh_L_Object=object{BM_nul}
        #declare BM_Calf_R_Object=object{BM_nul}
        #declare BM_Calf_L_Object=object{BM_nul}
        #declare BM_Neck_Object=object{BM_nul}
        #if (ShowXYZ=on)
            #declare BM_Thigh_R_Object=union {object {BM_Thigh_R_Object} object {XYZ}}
        #end    

        #declare BodyPart=
            union {
                bmtorso() 
                translate <4,18,0>
                scale 1.5
            }
    #break
    #case (10)
        plane {z,100  pigment {checker rgb .15,rgb .25} scale 2*1.5 translate y*1.5}
        #declare Title="Left Thigh"
        #declare BM_R_Upperarm_Mass=0;
        #declare BM_R_Forearm_Mass=0;
        #declare BM_L_Upperarm_Mass=0;
        #declare BM_L_Forearm_Mass=0;
        #declare BM_R_Thigh_Mass=2;
        #declare BM_R_Calf_Mass=0;
        #declare BM_L_Calf_Mass=0;
        #declare BM_Torso_Mass=0;
        #declare BM_Neck_Mass=0;
    
        #declare BM_Neck_Object=object{BM_nul}
        #declare BM_Torso_Object=object{BM_nul}
        #declare BM_Abdomen_Object=object{BM_nul}
        #declare BM_Upperarm_R_Object=object{BM_nul}
        #declare BM_Upperarm_L_Object=object{BM_nul}
        #declare BM_Forearm_R_Object=object{BM_nul}
        #declare BM_Forearm_L_Object=object{BM_nul}
        #declare BM_Thigh_R_Object=object{BM_nul}
        #declare BM_Calf_R_Object=object{BM_nul}
        #declare BM_Calf_L_Object=object{BM_nul}
        #declare BM_Neck_Object=object{BM_nul}
        #if (ShowXYZ=on)
            #declare BM_Thigh_L_Object=union {object {BM_Thigh_L_Object} object {XYZ}}
        #end    
    
        #declare BodyPart=
            union {
                bmtorso() 
                translate <-4,18,0>
                scale 1.5
            }
    #break
    #case (11)
        plane {z,100  pigment {checker rgb .15,rgb .25} scale 2*1.5 translate y*1.5}
        #declare Title="Right Calf"
        #declare BM_R_Upperarm_Mass=0;
        #declare BM_R_Forearm_Mass=0;
        #declare BM_L_Upperarm_Mass=0;
        #declare BM_L_Forearm_Mass=0;
        #declare BM_R_Thigh_Mass=0;
        #declare BM_L_Thigh_Mass=0;
        #declare BM_L_Calf_Mass=0;
        #declare BM_Torso_Mass=0;  
        #declare BM_Abdomen_Mass=0;        
        #declare BM_Neck_Mass=0;
    
        #declare BM_Neck_Object=object{BM_nul}
        #declare BM_Torso_Object=object{BM_nul}
        #declare BM_Abdomen_Object=object{BM_nul}
        #declare BM_Upperarm_R_Object=object{BM_nul}
        #declare BM_Upperarm_L_Object=object{BM_nul}
        #declare BM_Forearm_R_Object=object{BM_nul}
        #declare BM_Forearm_L_Object=object{BM_nul}
        #declare BM_Thigh_R_Object=object{BM_nul}
        #declare BM_Thigh_L_Object=object{BM_nul}
        #declare BM_Calf_L_Object=object{BM_nul}
        #declare BM_Neck_Object=object{BM_nul}
        #if (ShowXYZ=on)
            #declare BM_Calf_R_Object=union {object {BM_Calf_R_Object} object {XYZ}}
        #end    
    
        #declare BodyPart=
            union {
                bmtorso() 
                translate <4,32,0>
                scale 1.5
            }
    #break
    #case (12)
        plane {z,100  pigment {checker rgb .15,rgb .25} scale 2*1.5 translate y*1.5}
        #declare Title="Left Calf"
        #declare BM_R_Upperarm_Mass=0;
        #declare BM_R_Forearm_Mass=0;
        #declare BM_L_Upperarm_Mass=0;
        #declare BM_L_Forearm_Mass=0;
        #declare BM_R_Thigh_Mass=0;
        #declare BM_R_Calf_Mass=0;
        #declare BM_L_Thigh_Mass=0;
        #declare BM_Torso_Mass=0;  
        #declare BM_Abdomen_Mass=0;        
        #declare BM_Neck_Mass=0;
    
        #declare BM_Neck_Object=object{BM_nul}
        #declare BM_Torso_Object=object{BM_nul}
        #declare BM_Abdomen_Object=object{BM_nul}
        #declare BM_Upperarm_R_Object=object{BM_nul}
        #declare BM_Upperarm_L_Object=object{BM_nul}
        #declare BM_Forearm_R_Object=object{BM_nul}
        #declare BM_Forearm_L_Object=object{BM_nul}
        #declare BM_Thigh_R_Object=object{BM_nul}
        #declare BM_Thigh_L_Object=object{BM_nul}
        #declare BM_Calf_R_Object=object{BM_nul}
        #declare BM_Neck_Object=object{BM_nul}
        #if (ShowXYZ=on)
            #declare BM_Calf_L_Object=union {object {BM_Calf_L_Object} object {XYZ}}
        #end    

    
        #declare BodyPart=
            union {
                bmtorso() 
                translate <-4,32,0>
                scale 1.5
            }
    #break
    #case (13)
        plane {z,100  pigment {checker rgb .15,rgb .25} scale 2*2}
        #declare Title="Right Foot"
        #declare BM_L_Foot=0;
        #declare BM_Foot_L_Object=object{BM_nul}
        #if (ShowXYZ=on)
            #declare BM_Foot_R_Object=union {object {BM_Foot_R_Object} object {XYZ scale .75}}
        #end    
    
        #declare BodyPart=
            union {
                bmfeet()
                translate <4,50,0>
                scale 2
            }
    #break
    #case (14)
        plane {z,100  pigment {checker rgb .15,rgb .25} scale 2*2}
        #declare Title="Left Foot"
        #declare BM_R_Foot=0;
        #declare BM_Foot_R_Object=object{BM_nul}
        #if (ShowXYZ=on)
            #declare BM_Foot_L_Object=union {object {BM_Foot_L_Object} object {XYZ scale .75}}
        #end    

    
        #declare BodyPart=
            union {
                bmfeet()
                translate <-4,50,0>
                scale 2
            }
    #break
#end

/****************************************************************
 Lights, Camera and Setting
*****************************************************************/
camera{location <0,-40,-100> orthographic look_at <0,-40,0> }
light_source{<-200,200,-200> rgb <1,.9,.5> }
light_source{< 400,400,-200> rgb <.2,.4,.8> shadowless }
light_source{<-200,200,-200> rgb .7         shadowless }
light_source{< 100, 50,-150> rgb .5         shadowless }
light_source{< 100,-50,-150> rgb .3         shadowless }
light_source{<-100,-50,-150> rgb .1         shadowless }
background {rgb 0}

/****************************************************************
 The Models
****************************************************************/
text { 
    ttf           
    "crystal.ttf",
    concat (Title," - 1 Square = 2 Units"),
    .1,
    0
    translate <-9,1,-5>
    pigment {rgb 1}
    finish {ambient 1}
    scale 7.5
    no_shadow
}

object {BodyPart              translate x*-15 no_shadow}
object {BodyPart rotate y*180 translate x* 45 no_shadow}
object {BodyPart rotate y* 90 translate x*-45 no_shadow}
object {BodyPart rotate y*-90 translate x* 15 no_shadow}
object {BodyPart rotate x*-90 translate y*-75 translate x*-15 no_shadow}
object {BodyPart rotate y*180 rotate x*90     translate y*-75 translate x* 45 no_shadow}

// EOF