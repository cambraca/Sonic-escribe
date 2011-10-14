/***************************************************************
                 ___ _     _    __  __
                | _ ) |___| |__|  \/  |__ _ _ _
                | _ \ / _ \ '_ \ |\/| / _` | ' \ 
                |___/_\___/_.__/_|  |_\__,_|_||_|
                    / __| |_ _  _ __| (_)___
                    \__ \  _| || / _` | / _ \
                    |___/\__|\_,_\__,_|_\___/
                   For use with "bmpeople.inc"

Refer to "bmmanual.txt" for full usage details

****************************************************************

 B L O B   M A N   S A M P L E   P O S E S

Set Pose_Studio to 'no' to see pre-defined poses set PoseNo 
for the pose you wish to try.

 PoseNo                             PoseNo
   0 = Standing Relaxed               6 = "We're Not Worthy"
   1 = Standing Hands on Hips         7 = Hand Stand        
   2 = Meditation                     8 = Sun Bathing       
   3 = Sitting at Table/Piano etc     9 = Surfer            
   4 = Gunfighter                    10 = Reclined (Male) 
   5 = Praying on Knees              11 = Reclined (Female)   

If you wish to experiment with Blob Man Studio (below) set 
Pose_Studio to 'yes'.
****************************************************************/
// ==== Standard POV-Ray Includes ====
#include "colors.inc"	// Standard Color definitions
#include "textures.inc"	// Standard Texture definitions
//#include "bm_pose.inc"
#include "Fempose.pos"
#include "bmpeople.inc"

#declare Pose_Studio=no;
#declare BM_PoseNo=0;  // If Pose_Studio is set to "no" set this to 
                       // a Pose Number from the list above.
/****************************************************************
 General Settings used for Pose Studio and Pre-Defined Poses
*****************************************************************/
#declare BM_Gender    = 1;             // Male=0, Female=1
#declare BM_EyeCol    = <.22,.69,.87>; // Iris Colour of eye (<r,g,b>) - ie. <.22,.69,.87> = Blue
#declare BM_Hair_Col  = <.6,.5,.4>;    // Hair Colour <r,g,b>
#declare BM_Nose      = 0.5;           // Nose Size. Range: 0 - 1.25  Default : 0.5

#declare Costume      = "Tufgirlz.cdf"
#declare Background    = <.5,.5,.5>;   // <r,g,b> for Studio Background colour.

#declare BM_DeBug      = off;          // Puts Visible Locators at ends of Limbs
                                       // useful for object positioning.

/****************************************************************

 B L O B   M A N   S T U D I O

Change the settings below to create your own poses.

****************************************************************/

//#include "bmpeople.inc"

#if (Pose_Studio=yes)
/****************************************************************
 Head Settings
*****************************************************************/

#declare BM_Head_Rot   = <15,-20,0>; // x = Head position Front to Back 
                                  // y = Head rotation Left to Right
                                  // z = Head position Right Side to Left Side

/****************************************************************
 Torso Settings
   Arm Rotation Vectors <X,Y,Z> 
   <0,0,0> is pointing straight down
   X= Back(-) to Front(+)
   Y= Twist Left(-), Right (+)
   Z= Side to Side Lift Right(-), Left(+)
*****************************************************************/

#declare BM_Neck_Rot = <0,0,-5>;   // Rotation vector for the neck (Note: "y" is not used)
#declare BM_Torso_Rot= <-20,20,-5>;   // Rotation vector for the Upper Torso 

#declare BM_RA_S2E   = <120,60,-35>;  // Right Upperarm
#declare BM_RA_E2W   = <170,0,20>;  // Right Forearm
#declare BM_RH_Rot   = <0,-20,0>;  // Right Hand

#declare BM_LA_S2E   = <35,10,10>;  // Left Upperarm
#declare BM_LA_E2W   = <80,40,20>;  // Left Forearm
#declare BM_LH_Rot   = <0,0,0>;  // Left Hand

#declare BM_RL_H2K   = <-20,0,-15>;  // Right Thigh
#declare BM_RL_K2A   = <-30,0,0>;  // Right Lower Leg
#declare BM_RF_Rot   = <0,0,0>;  // Right Foot

#declare BM_LL_H2K   = <20,0,15>;  // Left Thigh
#declare BM_LL_K2A   = <0,0,0>;  // Left Lower Leg
#declare BM_LF_Rot   = <0,0,0>;  // Left Foot
              
/****************************************************************
 Hand Settings
   Hand Rotation Vectors <X,Y,Z>
   <0,0,0> - fingers pointing down with thumbs foward.
  <X,Y,Z,T> = <1st Joint, 2nd Joint, 3rd Joint, Spread>

                 Z  Z  Z
                 |  |  |  Z
                 Y  Y  Y  |
           Z     |  |  |  Y
            \    X  X  X  |          Please excuse the crude
             Y   +--+--+_ X          Diagram :)
              \ /        \+
               X          \
               |          |
                \        /
                 +------+

(+) Figures in X,Y or Z bend the joint towards the palm.
(-) Figures in X,Y or Z bend the joint away from the palm.

The T figure bends the whole finger sideways (+) is towards the
thumb, (-) towards the Pinky. 
*****************************************************************/
/*                                              // Right Hand
#declare BM_RFP_Pos    = <  5, 45,  5,   0>;  // Pinky Finger
#declare BM_RFR_Pos    = < 10, 30,  5,   0>;  // Ring Finger
#declare BM_RFM_Pos    = <  5, 15,  5,   0>;  // Middle Finger
#declare BM_RFI_Pos    = <  0, 10,  0,   0>;  // Index Finger
#declare BM_RFT_Pos    = <  0,-10,  5,  10>;  // Thumb
  
                                              // Left Hand
#declare BM_LFP_Pos    = <  5, 45,  5,   0>;  // Pinky Finger 
#declare BM_LFR_Pos    = < 10, 30,  5,   0>;  // Ring Finger  
#declare BM_LFM_Pos    = <  5, 15,  5,   0>;  // Middle Finger
#declare BM_LFI_Pos    = <  0, 10,  0,   0>;  // Index Finger 
#declare BM_LFT_Pos    = <  0,-10,  5,  10>;  // Thumb        
*/
                                              // Right Hand
#declare BM_RFP_Pos    = < 45, 45, 45,   0>;  // Pinky Finger
#declare BM_RFR_Pos    = < 45, 45, 45,   0>;  // Ring Finger
#declare BM_RFM_Pos    = < 45, 45, 45,   0>;  // Middle Finger
#declare BM_RFI_Pos    = < 45, 45, 45,   0>;  // Index Finger
#declare BM_RFT_Pos    = < 45, 20, 10,   0>;  // Thumb
  
                                              // Left Hand
#declare BM_LFP_Pos    = <  5, 45,  5,   0>;  // Pinky Finger 
#declare BM_LFR_Pos    = < 10, 30,  5,   0>;  // Ring Finger  
#declare BM_LFM_Pos    = <  5, 15,  5,   0>;  // Middle Finger
#declare BM_LFI_Pos    = <  0, 10,  0,   0>;  // Index Finger 
#declare BM_LFT_Pos    = <  0,-10,  5,  10>;  // Thumb        
/****************************************************************
 Foot Settings
   Foot Rotation Vectors <X,Y,Z>
   <0,0,0> - toes pointing forward
*****************************************************************/

#declare BM_Toe_Angle  =<0,0,20>;  // x = Left Foot
                                  // y = ** Not Used **
                                  // z = Right Foot

/****************************************************************
 Hair Settings     
   Note: Hair drastically increases the parse time !
*****************************************************************/
#declare BM_Hair_On    = 0;          // Hair (1) - No Hair (0)
#declare BM_Hair_Rot   = <0,0,0>;    // Hair Rotation - Standard <0,0,0>
#declare BM_Hair_Arch  = 0;          // Arch hairline over head in line with ears (1) or Not (0)
#declare BM_Hair_Thck  = 0.25;       // Hair Thickness <0.15 to 0.5> - Standard: 0.25
#declare BM_Hair_Line  = 5;          // Hair Line Height (Best Settings 3 to 6) - Standard: 5 
#declare BM_Hair_LDpth = 0.7;        // Hairline profile Depth (Range: 0-Straight Fringe to 1-Widows Peak) - standard: 0.7
#declare BM_Hair_Wght  = 0.01;       // Hair Weight (Range 0.005 to 0.05) - Standard: 0.01
#declare BM_Hair_Hght  = 1;          // Hair Height (Range 1 to 2) - Standard: 1
#declare BM_Hair_Length= 10;         // Hair Length (1 to 20) - Standard: 10
#declare BM_Hair_Curl  = 0.05;       // Curliness (Range 0-Straight to 0.1-Curly) - Standard: 0.05

/****************************************************************
*****************************************************************

*****************************************************************
 Write settings to external files.
*****************************************************************/
#fopen file "bmarray.txt" write
    #write (file, "/************************************************************\n",
                  "  Blob Man Pose File for use with Blob_Man.inc\n",
                  "  This file was created automatically by Blob_Man_Studio.POV\n",
                  "*************************************************************/\n\n")  
    #write (file, "#declare BM_Pose=array[1][17]\n",
                  "  {\n",
                  "     { ",BM_Head_Rot,",",BM_Neck_Rot,",",BM_Torso_Rot,",",BM_RA_S2E,",",BM_RA_E2W,",",BM_LA_S2E,",",BM_LA_E2W,",",BM_RL_H2K,",",BM_RL_K2A,",",BM_LL_H2K,",",BM_LL_K2A,",",BM_RF_Rot,",",BM_LF_Rot,",",BM_Toe_Angle,",",BM_RH_Rot,",",BM_LH_Rot,", <0,0,1> },\n",
                  "  }\n\n")
    #write (file, "#declare BM_Hands=array[2][5]\n",
                  "  {\n",
                  "     { ",BM_LFP_Pos,",",BM_LFR_Pos,",",BM_LFM_Pos,",",BM_LFI_Pos,",",BM_LFT_Pos," },\n",
                  "     { ",BM_RFP_Pos,",",BM_RFR_Pos,",",BM_RFM_Pos,",",BM_RFI_Pos,",",BM_RFT_Pos," },\n",
                  "  }\n\n")
    #write (file, "#declare BM_Pose_Hair_1=array[1][1]\n",
                  "  {\n",
                  "     { ",BM_Hair_Rot," },\n",
                  "  }\n\n")
    #write (file, "#declare BM_Pose_Hair_2=array[1][9]\n",
                  "  {\n",
                  "     { ",BM_Hair_On,",",BM_Hair_Arch,",",BM_Hair_Thck,",",BM_Hair_Line,",",BM_Hair_LDpth,",",BM_Hair_Wght,",",BM_Hair_Hght,",",BM_Hair_Length,",",BM_Hair_Curl," },\n",
                  "  }\n")                  
    #write (file, "// End of File")                  
#fclose file        

#fopen file "bmdeclar.txt" write
    #write (file, "/************************************************************\n",
                  "  Blob Man Pose File for use with bmpeople.inc\n",
                  "  This file was created automatically by Blob_Man_Studio.POV\n",
                  "*************************************************************/\n\n")  
    #write (file, "    #declare BM_Head_Rot     = ",BM_Head_Rot,";\n")  
    #write (file, "    #declare BM_Neck_Rot     = ",BM_Neck_Rot,";\n")  
    #write (file, "    #declare BM_Torso_Rot    = ",BM_Torso_Rot,";\n") 
    #write (file, "    #declare BM_RA_S2E       = ",BM_RA_S2E,";\n")    
    #write (file, "    #declare BM_RA_E2W       = ",BM_RA_E2W,";\n")    
    #write (file, "    #declare BM_LA_S2E       = ",BM_LA_S2E,";\n")    
    #write (file, "    #declare BM_LA_E2W       = ",BM_LA_E2W,";\n")    
    #write (file, "    #declare BM_RL_H2K       = ",BM_RL_H2K,";\n")    
    #write (file, "    #declare BM_RL_K2A       = ",BM_RL_K2A,";\n")    
    #write (file, "    #declare BM_LL_H2K       = ",BM_LL_H2K,";\n")    
    #write (file, "    #declare BM_LL_K2A       = ",BM_LL_K2A,";\n")    
    #write (file, "    #declare BM_RF_Rot       = ",BM_RF_Rot,";\n")    
    #write (file, "    #declare BM_LF_Rot       = ",BM_LF_Rot,";\n")    
    #write (file, "    #declare BM_Toe_Angle    = ",BM_Toe_Angle,";\n")
    #write (file, "    #declare BM_RH_Rot       = ",BM_RH_Rot,";\n")      
    #write (file, "    #declare BM_LH_Rot       = ",BM_LH_Rot,";\n\n")    
    #write (file, "// If you wish to use a predefined hand be sure to include\n",
                  "// bm_hands.inc and then set BM_Pose_RHand/LHand to the array\n",
                  "// entry number (0 being the first entry).  Otherwise set them \n",
                  "// to -1 and use the finger positions defined below\n\n")
    #write (file, "    #declare BM_Pose_RHand   = ",BM_Pose_RHand,";\n")
    #write (file, "    #declare BM_Pose_LHand   = ",BM_Pose_LHand,";\n\n")
    #write (file, "    #declare BM_RFP_Pos      = ",BM_RFP_Pos,";\n")
    #write (file, "    #declare BM_RFR_Pos      = ",BM_RFR_Pos,";\n")
    #write (file, "    #declare BM_RFM_Pos      = ",BM_RFM_Pos,";\n")
    #write (file, "    #declare BM_RFI_Pos      = ",BM_RFI_Pos,";\n")
    #write (file, "    #declare BM_RFT_Pos      = ",BM_RFT_Pos,";\n")
    #write (file, "    #declare BM_LFP_Pos      = ",BM_LFP_Pos,";\n")
    #write (file, "    #declare BM_LFR_Pos      = ",BM_LFR_Pos,";\n")
    #write (file, "    #declare BM_LFM_Pos      = ",BM_LFM_Pos,";\n")
    #write (file, "    #declare BM_LFI_Pos      = ",BM_LFI_Pos,";\n")
    #write (file, "    #declare BM_LFT_Pos      = ",BM_LFT_Pos,";\n")
    #write (file, "    #declare BM_Hair_Rot     = ",BM_Hair_Rot,";\n")   
    #write (file, "    #declare BM_Hair_Arch    = ",BM_Hair_Arch,";\n")  
    #write (file, "    #declare BM_Hair_Thck    = ",BM_Hair_Thck,";\n")  
    #write (file, "    #declare BM_Hair_Line    = ",BM_Hair_Line,";\n")  
    #write (file, "    #declare BM_Hair_LDpth   = ",BM_Hair_LDpth,";\n") 
    #write (file, "    #declare BM_Hair_Wght    = ",BM_Hair_Wght,";\n")  
    #write (file, "    #declare BM_Hair_Hght    = ",BM_Hair_Hght,";\n")  
    #write (file, "    #declare BM_Hair_Length  = ",BM_Hair_Length,";\n")
    #write (file, "    #declare BM_Hair_Curl    = ",BM_Hair_Curl,";\n\n")  
    #write (file, "    #declare BM_PoseNo       = -1;\n\n")
    #write (file, "// End of File")
#fclose file            

#ifdef (Costume)
    #include Costume
#end

#declare BM_PoseNo=-1;
Blob_Man(BM_Gender,1)

#else
/****************************************************************
 Use Pre-Defined Poses
*****************************************************************/
//#include "bm_pose.inc"

#ifdef (Costume)
    #include Costume
#end

// The TufGirlz Macro
TufGirlz_Costume(0,0,0,0)
Blob_Man(BM_Gender,1)

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
background {rgb Background}
 
/****************************************************************
 The Models
****************************************************************/
object {BlobMan              translate x*-15 no_shadow}
object {BlobMan rotate y*180 translate x* 45 no_shadow}
object {BlobMan rotate y* 90 translate x*-45 no_shadow}
object {BlobMan rotate y*-90 translate x* 15 no_shadow}
object {BlobMan rotate x*-90 translate y*-75 translate x*-15 no_shadow}
object {BlobMan rotate y*180 rotate x*90     translate y*-75 translate x* 45 no_shadow}
text { 
   ttf
   "crystal.ttf",
   #if (BM_Gender=0)
       #ifdef (Costume)
          concat ("Blob Man v4 - ",Costume),
       #else
          "Blob Man v4",
       #end
   #else   
       #ifdef (Costume)
           concat ("Blob Lady v4 - ",Costume),
       #else
           "Blob Lady v4",
       #end
   #end
   .1,
   0
   translate <-11.5,1.5,0>
   pigment {rgb 1}
   finish {ambient 1}
   no_shadow
   scale 6
}

// EOF