/****************************************************************
                       _  _              _
                      | || |__ _ _ _  __| |
                      | __ / _` | ' \/ _` |
                     _|_||_\__,_|_||_\__,_|
                    / __| |_ _  _ __| (_)___
                    \__ \  _| || / _` | / _ \
                    |___/\__|\_,_\__,_|_\___/  
                    
                    for use with bmpeople.inc
                    
This scene creates a file "bmhand.txt" which contains a single 
entry array for use with the hand macro in "bmpeople.inc"

see "bmmanual.txt" for full details.

 Set View_Hands (below) to "yes", then change the HandNo to view
 the hand poses in "bm_hands.inc"
*****************************************************************/

#local View_Hands=yes;
#local HandNo=0;

/****************************************************************
 Set View_Hands (above) to off and then alter the vectors below 
 to change the finger positions.
  
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
#include "bmhand.inc"

#local Thumb    = < 0, 0, 0, 0>; //<1st,2nd,3rd,Spread>
#local Index    = < 0, 0, 0, 0>; //<1st,2nd,3rd,Spread>
#local Middle   = < 0, 0, 0, 0>; //<1st,2nd,3rd,Spread>
#local Ring     = < 0, 0, 0, 0>; //<1st,2nd,3rd,Spread>
#local Pinky    = < 0, 0, 0, 0>; //<1st,2nd,3rd,Spread>

// Rendering at [320 x 240, No AA] shouldn't take very long,
// and is large enought to see if the positions are correct,

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
    concat ("Hand Studio for bmpeople.inc v4.0"),
    .1,
    0
    translate <-9,1,-5>
    pigment {rgb 1}
    finish {ambient 1}
    scale 7.5
    no_shadow
}

#if (View_Hands=on)
    #include "bm_hands.inc"
    #local Pinky    = BM_Hands[HandNo][0];
    #local Ring     = BM_Hands[HandNo][1];
    #local Middle   = BM_Hands[HandNo][2];
    #local Index    = BM_Hands[HandNo][3];
    #local Thumb    = BM_Hands[HandNo][4];
#end

#declare BM_RFP_Pos=Pinky;
#declare BM_RFR_Pos=Ring;
#declare BM_RFM_Pos=Middle;
#declare BM_RFI_Pos=Index;
#declare BM_RFT_Pos=Thumb;
#declare BM_RA_S2E=<0,0,0>;
#declare BM_RA_E2W=<0,0,0>;
#declare BM_RH_Rot=<0,0,0>;

#declare BodyPart=
    union {
        bmhand(-1)
        translate <9,30,0>
        scale 5
    }

object {BodyPart scale <-1,-1,1> translate <-10,-45,0> no_shadow}
object {BodyPart scale <-1,-1,1> rotate y*180 translate <40,-45,0> no_shadow}
object {BodyPart scale <-1,-1,1> rotate y* 90 translate <-55,-45,0> no_shadow}
object {BodyPart scale <-1,-1,1> rotate y*-90 translate <20,-45,0> no_shadow}
object {BodyPart rotate x*-90 rotate z*-90 translate y*-75 translate x*-20 no_shadow}
object {BodyPart rotate y*180 rotate x*90 rotate z*90    translate y*-75 translate x* 50 no_shadow}

#fopen file "bmhand.txt" write
    #write (file, "/************************************************************\n",
                  "  Blob Man Hand Pose File for use with bmpeople.inc\n",
                  "  This file was created automatically by Hand_Studio.pov\n",
                  "*************************************************************/\n\n")  
    #write (file, "#declare BM_Hands=array[1][5]\n",
                  "  {\n",
                  "     { ",Pinky,",",Ring,",",Middle,",",Index,",",Thumb," },\n",
                  "  }\n")
#fclose file

// EOF          
