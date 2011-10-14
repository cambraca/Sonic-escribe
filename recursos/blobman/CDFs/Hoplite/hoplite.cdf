/*******************************************************
    POV-Ray - BlobMan People Costume Definition File
 File Name : Hoplite.cdf
 BM_Version: 4.2
 Desciption: Costume Definition File for Greek Hoplite (Armoured Warrior)
             of circa 450 B.C.
 Date      : July 2000
 Author    : Ulrich von Bek
 Email     : ulrich_von_bek@hotmail.com
 WWW       :             
 Notes     : Hoplite.cdf version 1.0 
    This .CDF file incorporates large chunks of Bmtorso.inc, along with 
    some snippets from Croft.cdf, both by Peter Houston who created 
    Blobman 4.2, and thus inspired me to waste my time writing
    .CDF files...
     
    Email: houston.graphics@iname.com  
    WWW: http://welcome.to/HoustonGraphics 
         http://members.xoom.com/HosutonGraph

    This .CDF file makes use of Chris Colefax's Bend.inc, if you havn't got it,
    check the links at:
    http://www.povray.org
    
    It also uses Ingo's n-sided cone macro, which for convienience, I have
    pasted into this file.
    
    The Boots do not sit on y0 so if you transform
    the figure using the Foot or Toe Origins you will need 
    to add the following translation after the 
    transformation
    
        translate <0,1,0>*BM_Scale 
    
    The Toes of the Boot will bend to match the Toe Angle
    however you need to specify the Toe Angle before the 
    CDF is called, even if you are using arrays.
    
        #declare BM_Toe_Angle=<0,0,0>;
    
    This .cdf works for both male & female Blobpeople, but...
    You must make sure that the BM_Gender and GM_Build values
    your using are specified BEFORE including this file, else
    it will use it's default values which may not match the 
    figure your using. You will also need colors.inc & textures.inc.
    
    Here is a suggested method of using this file:
    > cut & paste from here...
        #include "colors.inc"          // standard colours
        #include "textures.inc"        // standard textures
        #include "bmpeople.inc"        // sets default Blobman values, defines macros
        >---                           // your scene, lighting and camera goes here
        ---<
        #declare Gender=0;             // pick a gender for the figure
        #declare HopBlazon="demon.png" // An example hoplite.cdf option
        #include "hoplite.pos"         // The Hoplite Pose file
        #include "hoplite.cdf"         // this file
        Blob_Man(Gender,1.8)           // call the Blobman macro
        object {BlobMan}               // put the dressed figure in your scene
    > ... to here    
    
    Options: There are a number of variables you can declare to alter the 
        appearance of the costume.
        Helmon:      Does the figure wear a helmet, default= on
        HopCrest:    Does the helmet have a crest, default= on
        Crestrgb:    Helmet crest colour, default= red
        Cresttex:    Helmet crest texture, if you redefine this, you must include a colour
        Armourtex:   Texture for Helmet, Corslet, Greaves, Sword Hilt & Shield Rim,
                     default= Bright_Bronze
        Tunicrgb:    Tunic colour, default= blue
        Tunictex:    Tunic texture, default= colour Tunicrgb with bumpmap from 
                     Linen.png, if you redefine this, you must include a colour
        BootTex:     Texture of Boot uppers
        SoleTex:     Texture of Boot soles
        LaceTex:     Texture of Boot laces
        Shieldrgb:   Colour of the shield face, default = red
        Shieldtex:   Texture for the shield face
        ShieldMap:   Does the shield have an image map on the face, default= on
        HopBlazon:   The source of the Shield Blazon image map, default= Blazon.png
                     Note: .png's for shield blazons should be square, with the
                           design centered in a circular area. If the .png features
                           an alpha channel mask, the shield texture will be 
                           visible through the transparent areas.
        Xena:        Set BM_Gender to female, and try "#declare Xena=on;", default= off           
    All of these options should be "#declare Variable=Value;" before including 
    this file.
    
    Poses: The pose file Hoplite.pos contains 4 poses
           0: Standing relaxed, same as the standard pose file
           1: At ready, shield in front of body, sword in guard position
           2: As pose 1, but with sword raised for attack
           3: Parrying to side with shield, sword raised for counter attack
           None of the poses include hair, I would suggest that if you do use hair,
           disable the helmet, or keep the hair very, very short. Otherwise it will 
           sprout through the surface of the helmet.
        
********************************************************/
#declare CDF=true; //Used by Body_Part_Viewer.pov Can be removed. 
/********************************************************
  Image Maps & Textures
********************************************************/
// ==== Standard POV-Ray Includes ====
#include "colors.inc"	// Standard Color definitions
#include "textures.inc"	// Standard Texture definitions


#ifndef (BM_Gender)
    #declare BM_Gender=0;
#end
#ifndef (BM_Build)
    #declare BM_Build=0.5;
#end
//#ifndef (BM_TShirt)
    #declare BM_TShirt=off;
//#end
#ifndef (Helmon)
    #declare Helmon=on;
#end
#ifndef (HopCrest)
    #declare HopCrest=on;
#end
#ifndef (Crestrgb)
    #declare Crestrgb=rgb x;
#end
#ifndef (Cresttex)
    #declare Cresttex=
        texture{
            pigment{Crestrgb}
            finish {phong 0.25  phong_size 1}
        }
#end
#ifndef (Armourtex)
    #declare Armourtex=Bright_Bronze
#end
#ifndef (Shieldrgb)
    #declare Shieldrgb=rgb x;
#end
#ifndef (Shieldtex)
    #declare Shieldtex=
        texture{
            pigment{Shieldrgb}
            finish {phong 0.5  phong_size 1}
        }
#end
#ifndef (ShieldMap)
    #declare ShieldMap=1;
#end
#local Hopset=-1;
#local Hopdia=15;
#local Hopscale=.3;
#ifndef (HopBlazon)
    #declare HopBlazon="Blazon.png"
#end
#ifndef (Tunicrgb)
    #declare Tunicrgb=rgb x;
#end
#ifndef (Tunictex)
    #declare Tunictex=
        texture{
            pigment{Tunicrgb}
            normal {bump_map{png "Linen.png" map_type 2 interpolate 4 bump_size 0.1}}
            finish {phong 0.5  phong_size 1}
        }
#end
#ifndef (BootTex)
    #declare BootTex=
        texture{
            pigment{rgb .05}
            finish{phong .5 reflection .1}
        }
#end
#ifndef (SoleTex) 
    #declare SoleTex=
        texture{
            pigment{rgb .15 }
            normal{ripples 1 scale .5}
        } 
#end
#ifndef (LaceTex)
    #declare LaceTex=
        texture{
            pigment{rgb <0.556863, 0.137255, 0.137255>}
            normal{quilted 1 scale .1 rotate z*45}
        }
#end    
#ifndef (Xena)
    #declare Xena=off;
#end
/************************************************
  Useful macros by others
************************************************/
// n_sided-cone.inc
// By: Ingo
// This macro makes a cone with n sides:
// 
// n_Sided_Cone (number of sides, base_type, radius/lenght Bottom, radius/length Top, height)
//
// Base type: 1 = Inscribed (=default)
//            2 = Circumscribed
//            3 = Length of one side
// object{ n_Sided_Cone(8, 3, 0.5, 0.2, 1) pigment{color White}}

#macro n_Sided_Cone(n,b,rlB,rlT,h)
      // select the base-type and set the radius accordingly.
  #switch (b)
    #case (2)
      #local rB= rlB/cos(radians(180/n));
      #local rT= rlT/cos(radians(180/n));
    #break
    #case (3)  
      #local rB= (0.5*rlB)/sin(radians(180/n));   
      #local rT= (0.5*rlT)/sin(radians(180/n));   
    #break
    #else
      #local rB= rlB;
      #local rT= rlT;    
  #end
      // Check wether the top or base has the biggest radius and
      // determine the startpoint to get the right top-radius.
  #if (rB=rT)
    #debug "\n WARNING: Both radii of the cone are equal!"
    #debug "\n          This wil give unexpected results."
    #debug "\n          Change one radius, or use n_Sided_Cylinder.\n"
  #end
  #if (rT<rB)
    #local D= (rT/rB);  
  #end  
  #if (rB<=rT)
    #local D= (rB/rT);  
  #end
  
  #local Rot=0;
  #local Count=0;
      // Create the points and extrude    
  prism {
    conic_sweep
    linear_spline
    D, 1, n+1,
    #while (Count<=n)
      <cos(radians(Rot)),sin(radians(Rot))>
      #local Rot=Rot+(360/n);
      #local Count=Count+1;
    #end
    sturm
  }
      // Put the cone on its base, and scale to the right size.
      // The way its done depends on the radii.
  #local ScY=h*(1/(1-D));
  #if (rT<rB)
    rotate <180, 0, 0>
    translate <0, 1, 0>
    scale <rB,ScY,rB>
  #end
  #if (rB<rT)
    translate <0,-rB/rT,0>
    scale <rT,ScY,rT>
  #end
#end

/********************************************************
  Body Part Options
********************************************************/
#declare BM_Ears=2;
#declare BM_Eyes=on;
// Nose - Range : 0 - 1.25 Size of Nose
//#declare BM_Nose=.5;
#declare BM_Face=on;
#declare BM_Teeth=on;
// Navel - -1 = Inverted Navel, 0 = No Navel, 1 = Protruding Navel
#declare BM_Navel=-1;
#declare BM_Nipples=on;
#declare BM_Flex=off;
 #declare BM_Nails=on;

/********************************************************
  Body Part Objects
********************************************************/
    #if (BM_Gender=0)
        #local UpperarmLength   =11;
        #local ForearmLength    =10.5;
        #local ThighLength      =14;
        #local CalfLength       =17;     
    #end
    #if (BM_Gender=1)
        #local UpperarmLength   =10.85;
        #local ForearmLength    =10.5;
        #local ThighLength      =14.7;
        #local CalfLength       =18.9; 
    #end

/************************************************
  Macros
************************************************/
#macro Helmform(BT_Gender,BT_Build) // start helmet macro
#local HalfHelm=
    object{
        difference{
            union{ // outer skull
                intersection{
                    blob{
                        threshold BT_Build
                        sphere{0,6.6,2 scale <1,1,.95> translate z*-1 } // Top Front of Skull
                        sphere{0,6.6,2 scale <1,1,.9> translate z*1 } // Top of Back Skull  
                    }
                    cylinder{<-7,6.5,5>,<7,6.5,5>,10 scale<1,.4,1>}
                }
                difference{
                    blob{
                        threshold BT_Build
                        cylinder{y*1,y*-10,5.6,2 scale <1,1,.95> translate z*-1 } // Top Front of Skull
                        cylinder{y*1,y*-10,5.6,2 scale <1,1,.9> translate z*1 } // Top of Back Skull  
                    }
                    cylinder{<-7,6.5,5>,<7,6.5,5>,10 scale<1,.4,1>}
                    cylinder{y*-8,y*-15,8}
                }
                // Nose
                blob{
                    threshold BT_Build
                    #if (BT_Gender=0)
                        cylinder{<-.5-(BT_Gender/6),1.5,1><-.15-(BT_Gender/6),-1,-BM_Nose>,1,2 translate <0,-.7-.75,-4.>}   // Nose
                        cylinder{<-.7-(BT_Gender/4),0,0><.7-(BT_Gender/4),0,0>,.5,2 translate<0,-1.75-.75,-4.3>} // Nostrils
                    #end
                    #if (BT_Gender=1)
                        sphere {0,1,1 scale <.75,1,1> translate <-.15,-1.5,-3.8>}
                        sphere {0,1,1 scale <.75,1,1> translate <-.15,-2,-3.9>}
                        sphere {0,1,1 scale <.75,1,1> translate <-.10,-2.5,-4>}
                        sphere {0,.75,1 scale <.75,1,1> translate <-.05,-2.75,-4.25>}
                    #end                                            
                }
            }
            cylinder{<-8,-1.25,-.25>,<8,-1.25,-.25>,1.5 scale<1,1,.75>} // ears
            cylinder{<-1.5,-1,0>,<-2,-1,-8>,1.25 scale<1,.75,1>} // right eye
            cylinder{<1.5,-1,0>,<2,-1,-8>,1.25 scale<1,.75,1>} // left eye
            box{<-.75,-3,0>,<.75,-9,-8>} // mouth
            box{<-.75,-1,0>,<-.5,-9,-8>} // mouth
            box{<.75,-1,0>,<.5,-9,-8>} // mouth
            prism{linear_sweep linear_spline -7,7,8,<-8,7>, <-5,7>, <-3,.875>, <-1.125,.875>, <-1.125,-1.375>, <-3,-1.375>, <-8,-7>, <-8,7> rotate<0,0,90>}
            plane {x,-0.0000001}
            }
        }
    
    
    union{
        object {HalfHelm}
        object {HalfHelm scale <-1,1,1>}
    }        
#end //end helmet macro
//===============================================
#macro BodyUArm(BT_Gender,BT_Build,BT_Side)
#local UArmform=    
    #if (BT_Gender=0)
        blob{
            threshold BT_Build
            sphere{ 0, 5, 1 scale <1.0, 0.8, 0.9> rotate 45*z }// Shoulder Joint
            cylinder { <0, 0, 0>, <UpperarmLength, 0, 0>, 3, 1 }
            sphere   { 0, 3.5, 1	scale <2, 1, 1> translate x*(UpperarmLength*.387)}
            rotate z*-90
        }
    #end
    #if (BT_Gender=1)
        blob{
            threshold BT_Build
            sphere { 0, 4.2, 1 scale <1.0, 0.8, 0.9> rotate 45*z }// Shoulder Joint
            cylinder { <0, 0, 0>, <UpperarmLength, 0, 0>, 2.45, 1 }
            sphere { 0, 2.8, 1	scale <2, 1, 1> translate 4.2*x	}
            rotate z*-90
        }
    #end
    object{UArmform scale<BT_Side,1,1>} //right arm BT_Side=1 left arm BT_Side=-1
#end
//===============================================
#macro BodyShin(BT_Gender,BT_Build,BT_Side)  // start calf macro
#local Shinform=
        #if (BT_Gender=0)
            blob{
                threshold BT_Build
                cylinder{<0,0,0>, <0, -CalfLength, 0>, 2.75, 1}
                sphere{ <0, 0, 0>, 5.5, 1 scale <1, 2, 1> translate <-.14, -6.65, .84>}
                sphere{ <0, 0, 0>, 4, -.1 scale <2, 4, .75> translate <0, -CalfLength-2, -1>}
            }
        #end
        #if (BT_Gender=1)
            blob{
                threshold BT_Build
           		cylinder {<0,-1.5,0>, <0, -CalfLength, 0>, 2.52, 1}
           		sphere { <0, 0, 0>, 4.13, 1 scale <1, 2.4, 1> translate <-.14, -6.65, .84>}  
                sphere { <0, 0, 0>, 2, -.1 scale <2, 4, .75> translate <0, -CalfLength-2, -1>}
            }   
        #end                       
    
    object{Shinform scale<BT_Side,1,1>} //right shin BT_Side=1 left shin BT_Side=-1
#end // end of Shin macro
//===============================================
#macro BodyThigh(BT_Gender,BT_Build,BT_Side)
#local Thighform=
    blob{
        threshold BT_Build
        // Thigh Left
        #if (BT_Gender=0)
            cylinder {<0, -1.4, 0>+<1, -2.8, -0>, <0, -ThighLength, 1>, 4.3, 1}
            sphere { <0, 0, 0>, 4, .5 
                scale <1.2, 2.0, 1.1>
                scale <1.25,1,1.25>
                rotate z*-20 
                translate <-1.5, -ThighLength*.452, 0.35>+<3.5, -2.8, -1.5>
                }    
            sphere { <0, 0, 0>, 2.1, .5 scale <1,1,1> translate <0, -ThighLength, 0> }                                         
            sphere { <0, 0, 0>, 4, -.35 scale <2,1.5,1> translate <0, -ThighLength, 1.65>}
        #end
        #if (BT_Gender=1)
            cylinder {<0, -1.4, 0>+<2, -2.8, -1>, <0, -ThighLength, .5>, 3.43, 1}                         		    
            sphere { <0, 0, 0>, 4, .5 
                scale <1.2, 2.0, 1.0>
                scale <1.25,1,1.25>
                rotate z*-20 
                translate <-1.5, -ThighLength*.452, 0.35>+<3.5, -2.8, -1.5>
                } 
            sphere { <0, 0, 0>, 1.8, 1 translate <0, -ThighLength, .1> }                                         
            sphere { <0, 0, 0>, 4, -.45 scale <2,1.5,1> translate <0, -ThighLength, 3>}
        #end
        sphere { <0,0,0>, 7, 1
            scale <0.9, 1.4, 1.1> 
            translate <-1.05, 1.75, 1.05>+<3.5, -2.8, -1.4>}
        sphere { <0,0,0>, 7, 1
            scale <0.7, 0.8, 0.7> 
            translate <-3.5, 2.8, 1.4>+<3.5, -2.8, -1.4>}
    }    
    object{Thighform scale<BT_Side*-1,1,1>} //right thigh BT_Side=1 left thigh BT_Side=-1
#end // end of thigh macro
//===============================================
#macro BodyTop (BT_Gender,BT_Build,BT_TShirt) // Begin BodyTop Macro
#local HalfFemaleTop=
    difference{
        blob{
            threshold BT_Build
            cylinder{ <0,0,0>, <0,1.0,0>, 1, 1 scale <1.3,.98,0.8> rotate <10,-10, 0 >}
            cylinder{ <0,0,0>, <0,0.7,0>, 1, 1 scale <1,0.6,0.5> rotate <10,0,-15> translate <0, 0.2, -0.20> }
            cylinder{ <0,0,0>, <0,1.0,0>, 1, 1 scale <0.75,0.5,0.6> translate <0.0,-0.6, -0.10> }
            sphere{ <0,0,0>, 1, 1    scale <0.45,0.6,0.4> rotate <20,-5,0> translate <0.4, 0.4, -0.50> }
            sphere{ <0,0,0>, 0.42, 1 scale <1,1,0.5> rotate <0,-15,0> translate <0.4, 0.25, -0.52> }
            #if (BT_TShirt)
                sphere { <0,0,0>, 1, 1 scale <.8,0.55,0.4> translate <0, 0.35, -0.5> }
                sphere { <0,0,0>, 1, 1 scale <.8,0.55,0.4> translate <0, 0.28, -0.5> }
            #end
            sphere {0,.1,1 scale <1,1,.25> rotate y*-5 rotate x*-5 translate <0.4,0.25,-.71> }
            sphere {0,.05,1 translate <0.4,0.25,-.71> }
            cylinder {<0,0,0><.1,0,0>,1,1 scale <0.6, 0.5, 0.4> translate < 0.7, 0.9, 0.2 >}
            cylinder { <0, 0, 0>, <0.35, 0, 0 >, 0.3, -.8 scale <1.75, 1, 2> rotate <-25,-4, 5> translate <0.0, 1.2, -0.25 >}
            sphere {<1.4,.8,.2>,.5,-1  }	
        }
        plane { x, -0.000001 }
        translate y*-2.25
        scale 7.5
    }
#local HalfMaleTop=
    difference {
        blob{
            threshold BT_Build-.3
            #local Loop=-6;
            #while (Loop>-15)
                sphere{0,2*.75,2 translate<0,Loop-3,sin((Loop+2)*pi/(4+abs(Loop)/4))*(.25+abs(Loop/15))+.8>}
                #if (mod(Loop+2,3)=0)
                    sphere{0,.5*.75,1 translate<0,Loop-3,sin((Loop+2)*pi/(4+abs(Loop)/4))*(.25+abs(Loop/15))+1>}
                #end
                #local Loop=Loop-1;
            #end
            cylinder{< 8,-9,.5><1,-6.75,1>,1.2,2}
            cylinder{< 0,0,1><8,0,1>,3,2 scale <1,1.25,1>translate y*-10.25}
            cylinder{<8,-9,.5><1,-9.5,-1.25>,1,2}
            cylinder{<0,-10.5,-.5><6,-10.5,-.5>,2,2 }
            sphere {0,2,2 scale <1.5,2,1.5> translate <7,-12,.85> }
            sphere{0,4,2.5   scale <1.4,2,1.3>   rotate x*22  translate < 2.8,-14,0>} // Left
            sphere{0,4,3   scale <1.4,1,1.3>   rotate x*20  rotate z*-20 translate< 3,-13,-.25>} 
            sphere{0,4,-.8 scale <1.4,2,1.3>   rotate x*20  translate < 2.8,-14,-3.5> } 
            sphere{0,4,-.8 scale <1.4,1,.5>   rotate x*20  translate < 2.8,-12,-3.7> } 
            sphere{0,2,-2  scale <2,2.75,2>    rotate z*-10 translate < 9.25,-15.25,1> rotate y*15 }
            sphere{0,2,-.8 scale <2.5,1.8,.75> rotate y*-45 rotate x*-15 translate < 5,-18,-3.3>}
            sphere {0,1,1 scale <1,1,.25> rotate y*-5 translate <4.5,-14,-3.5> }
            }
        plane {x,-0.00000001}
    }
// Create the Body Form
    union{
        #if (BT_Gender=0)
            object{HalfMaleTop scale <1,1,1.15> }
            object{HalfMaleTop scale<-1,1,1.15> }
        #end
        #if (BT_Gender=1)
            object{HalfFemaleTop scale<1,1,1> }
            object{HalfFemaleTop scale<-1,1,1> }
        #end    
    }
#end // End BodyTop Macro
//===============================================
#macro BodyBot(BT_Gender,BT_Build)
#local FemaleBot=
    blob{
        threshold BT_Build
        cylinder { <0,0.5,0>, <0,0.95,0>, 1, 1 scale <1.05, 0.95, 0.85> }
        sphere { 0, 1, 1 scale < 1.15, 0.75, 0.55> translate <0, 0.3, 0.0> }
        sphere { 0, 1, 1 scale <0.5, 0.8, 0.5 > translate <0, 0, 0 > }
        sphere { 0, 1,-.5 scale <.75,.75,.8> translate <.65,-.3,.75> }
        sphere { 0, 1,-.5 scale <.75,.75,.8> translate <-.65,-.3,.75>}
        scale <1.15, 1.2, 1.2>
        scale <7,7,7>
        translate y*-30
    }
#local MaleBot=
    blob{
        threshold BT_Build-.3
        #local Loop=-17;
        #while (Loop>-29)
            sphere{0,2*.75,2 translate<0,Loop-3,sin((Loop+2)*pi/(4+abs(Loop)/4))*(.25+abs(Loop/15))+.75>}
            #if (mod(Loop+2,3)=0)
                sphere{0,.5*.75,1 translate<0,Loop-3,sin((Loop+2)*pi/(4+abs(Loop)/4))*(.25+abs(Loop/15))+1>}
            #end
            #local Loop=Loop-1;
        #end
        sphere{0,3,1   scale <1.5,2,1.2>   rotate <(BM_Torso_Rot.x)*BM_Flex,0,0>  translate < 2.8,-19,(BM_Torso_Rot.x/100)*BM_Flex> rotate <0,(BM_Torso_Rot.y/1.5)*BM_Flex,0>}
        sphere{0,3,1   scale <1.5,2,1.2>   rotate <(BM_Torso_Rot.x)*BM_Flex,0,0> translate <-2.8,-19,(BM_Torso_Rot.x/100)*BM_Flex> rotate <0,(BM_Torso_Rot.y/1.5)*BM_Flex,0>}
        sphere{0,3,1 scale <1.5,1.5,.6>  rotate x*-20 rotate z*-45 translate < 3,-25.5,1.9>}
        sphere{0,3,1 scale <.8,1.5,.5>  rotate x*-10 rotate y*90 translate < 5.4,-25,0>}
        sphere{0,3,1 scale <1.5,1.5,1 >   translate < 2.5,-24,0>}
        sphere{0,3,2 scale <1,1,1>        translate < 1.5,-17.5,-1.5+BM_Torso_Rot.x/60> rotate <0,(BM_Torso_Rot.y/1.3)*BM_Flex,0>}
        sphere{0,3,2 scale <1,1,1.2>      translate < 1.5,-20,-1.25> rotate <0,(BM_Torso_Rot.y/1.2)*BM_Flex,0>}
        sphere{0,3,2 scale <1,1.2,1.2>    translate < 1.5,-22.5,-1.25> rotate <0,(BM_Torso_Rot.y/1.1)*BM_Flex,0>}
        sphere{0,3,2 scale <1,1,1.2>      translate < 1.5,-25,-1> rotate <0,(BM_Torso_Rot.y/1.05)*BM_Flex,0>}
        sphere{0,3,1 scale <1.5,1.5,.6> rotate x*-20 rotate z*45 translate <-3,-25.5,1.9>}
        sphere{0,3,1 scale <.8,1.7,.5>  rotate x*-10 rotate y*-90 translate < -5.4,-25,0>}
        sphere{0,3,1 scale <1.5,1.5,1 >   translate <-2.5,-24,0>}
        sphere{0,3,2 scale <1,1,1>        translate <-1.5,-17.5,-1.5+BM_Torso_Rot.x/60> rotate <0,(BM_Torso_Rot.y/1.3)*BM_Flex,0>}
        sphere{0,3,2 scale <1,1,1.2>      translate <-1.5,-20,-1.25> rotate <0,(BM_Torso_Rot.y/1.2)*BM_Flex,0>}
        sphere{0,3,2 scale <1,1.2,1.2>    translate <-1.5,-22.5,-1.25> rotate <0,(BM_Torso_Rot.y/1.1)*BM_Flex,0>}
        sphere{0,3,2 scale <1,1,1.2>      translate <-1.5,-25,-1> rotate <0,(BM_Torso_Rot.y/1.05)*BM_Flex,0>}
        sphere{0,5,2 scale <1.2,1.4,1>  translate<0,-27,-.5> } //Front & Back
        sphere{0,3,1 scale <1.4,.8,1.5> rotate z* 75 translate< 4,-28,-.5>}
        sphere{0,3,1 scale <1.4,.8,1.5> rotate z*-75 translate<-4,-28,-.5>}
    }   
// Select the Body Form
        #if (BM_Gender=0)
            object{MaleBot}
        #end
        #if (BM_Gender=1)
            object {FemaleBot scale <1,1,.95> translate <0,0,-.5> }
        #end    
#end // end BodyBot macro
//===============================================
/************************************************
 Declare the objects
************************************************/
#macro Helmet(BT_Gender,BT_Build)
    #local Helmrad=6.6*sqrt(1-sqrt(BM_Build/2));
    #local Crestlen=(Helmrad*pi/2)+6;
    #local Crestoff=<0,0,1+Helmrad>;
    #if (HopCrest>=1)
        #declare Crest=
            union{
                box{<-1,0,0>,<1,Crestlen,1> texture{pigment{checker color rgb 1 color rgb 0 scale .5}finish {phong 0.5  phong_size 1}}}
                object{
                    n_Sided_Cone(4,3,1,1.3,1)
                    rotate y*45
                    rotate x*90
                    translate <0,0.5,0>
                    scale <2,Crestlen,2.5>
                    translate z*1
                    texture{Cresttex}
                }    
            }
        #declare object_axis1=<0,0,0>;
        #declare object_axis2=<0,Crestlen,0>;
        #declare bend_angle=110;
        #declare bend_direction=-z;
        #declare bend_smoothness=100;
        #declare bend_start=0;
        #declare bend_finish=1-(3/Crestlen);
        #declare bend_object=Crest
        union{
            difference{
                Helmform(BT_Gender,BT_Build-0.05)
                Helmform(BT_Gender,BT_Build-0.0)
            }
            object{
                #include "bend.inc"
                translate Crestoff
            }    
            texture{Armourtex}
        }    
    #else        
        difference{
            Helmform(BT_Gender,BT_Build-0.05)
            Helmform(BT_Gender,BT_Build-0.0)
            texture{Armourtex}
        }
    #end
#end    
//===============================================
#macro CorsTop(BT_Gender,BT_Build,BT_TShirt)
    difference{
        BodyTop(BT_Gender,BT_Build-0.03,BT_TShirt)
        BodyTop(BT_Gender,BT_Build,BT_TShirt)
        cylinder{<0,0,1.5>,<0,-10,1.5>,3.5 scale<1,1,.8>}
        #if (BT_Gender=1)
            #if (BT_TShirt=1)
            cylinder{<0,0,1.5><0,0,-10>,3.5 scale<1,1.5,1> translate y*-8}
            #end
        #end
        sphere{<-10,-10,2>,4.5}
        sphere{<10,-10,2>,4.5}
        texture{Armourtex}
    }
#end    
//===============================================
#macro CorsBot(BT_Gender,BT_Build)
    difference{    
        BodyBot(BT_Gender,BT_Build-0.03)
        BodyBot(BT_Gender,BT_Build)
        cylinder{<-12,-30,0>,<12,-30,0>,6}
        texture{Armourtex}
    }
#end
//===============================================
#macro TunicTop(BT_Gender,BT_Build,BT_TShirt)
    difference{
        BodyTop(BT_Gender,BT_Build-0.02,BT_TShirt)
        BodyTop(BT_Gender,BT_Build,BT_TShirt)
        cylinder{<0,0,1.5>,<0,-10,1.5>,3.0 scale<1,1,.8>}
        #if (BT_Gender=1)
            #if (BT_TShirt=1)
            cylinder{<0,0,1.5><0,0,-10>,3.0 scale<1,1.5,1> translate y*-8}
            #end
        #end
        texture{Tunictex}
    }
#end    
//===============================================
#macro TunicBot(BT_Gender,BT_Build)
    union{
        difference{    
            BodyBot(BT_Gender,BT_Build-0.02)
            BodyBot(BT_Gender,BT_Build)
        }
        difference{
            blob{
                threshold BT_Build-0.02
                cylinder{<0,1,0>,<0,-9,0>,9.25,1}
            }
            blob{
                threshold BT_Build
                cylinder{<0,1,0>,<0,-9,0>,9.25,1}
            }
            plane {y,-9}
            plane {y,0 inverse}
            #if (BT_Gender=0)
                scale <1.25,1,.75>
                translate <0,-27,-0.25>
            #end    
            #if (BT_Gender=1)
                scale <1.2,1,.7>
                translate <0,-27,-0.5>
            #end    
        }
        texture{Tunictex}
    }
#end
//===============================================
#macro TunicLeg(BT_Gender,BT_Build,BT_Side)
    difference{
        BodyThigh(BT_Gender,BT_Build-0.02,BT_Side)
        BodyThigh(BT_Gender,BT_Build,BT_Side)
        #if (BT_Gender=0)
            plane {y,-8}
        #end
        #if (BT_Gender=1)
            plane {y,-6.5}
        #end
        texture{Tunictex}
    }
#end
//===============================================
#macro TunicArm(BT_Gender,BT_Build,BT_Side)
    difference{
        BodyUArm(BT_Gender,BT_Build-0.02,BT_Side)
        BodyUArm(BT_Gender,BT_Build,BT_Side)
        plane {y,-6}
        texture{Tunictex}
    }
#end
//===============================================
#declare GreaveR=
    difference{
        BodyShin(BM_Gender,BM_Build-0.05,1)
        BodyShin(BM_Gender,BM_Build-0.0,1)
        box{<-.5,0,0>,<.5,-CalfLength,5>}
        cylinder{<-5,0,1>,<5,0,1>,3}
        cylinder{<0,0,-5>,<0,0,5>,3 scale<1,.5,1> translate <0,-CalfLength,0>}
        texture{Armourtex}                       
    }
//===============================================
#declare GreaveL=
    object{GreaveR scale<-1,1,1>}
//===============================================
#declare Hoplon=
    object{
        union{  // shield
            difference{  // rim
                torus{Hopdia,2 rotate<0,0,90> translate<0,Hopset,0> scale<.5,1,1>}
                cylinder{<0,Hopset,0>,<-5,Hopset,0>,Hopdia+2}
                cylinder{<-1,Hopset,0>,<2,Hopset,0>,Hopdia-1}
                texture{Armourtex}
            }
            difference{
                sphere{  // outer face
                    <0,Hopset,0>,Hopdia 
                    scale<Hopscale,1,1>
                    material{
                        texture{Shieldtex}
                        #if (ShieldMap=1)
                            texture{pigment{image_map{png "HopBlazon.png" map_type 0 interpolate 4 once} translate <-.5,-.5,0> rotate y*-90 rotate x*-90 scale Hopdia*2 translate y*Hopset}}
                        #end
                        }
                    }
                cylinder{<0,Hopset,0>,<-5,Hopset,0>,Hopdia+2}
                sphere{<0,Hopset,0>,Hopdia-1 scale<Hopscale,1,1> texture{Rust}} // inner face
            }
            union{  // porpax
                difference{
                    union{
                        cylinder{<0,Hopset-.75,0>,<0,Hopset+.75,0>,2}
                        box{<0,Hopset-.75,2>,<Hopdia-1,Hopset+.75,-2> scale<Hopscale,1,1>}
                    }
                    union{
                        cylinder{<0,Hopset-.85,0>,<0,Hopset+.85,0>,1.75}
                        box{<0,Hopset-.85,1.75>,<Hopdia-1,Hopset+.85,-1.75> scale<Hopscale,1,1>}
                    }
                }
                intersection{
                    box{<-.25,Hopset-Hopdia/3,-Hopdia/6>,<.25,Hopset+Hopdia/3,Hopdia/6> translate<(Hopdia-1)*Hopscale,0,0>}
                    cylinder{<0,Hopset,-Hopdia/6>,<0,Hopset,Hopdia/6>Hopdia-1 scale<Hopscale,1,1>}
                }
                }
            intersection{
                torus{2,.5 rotate<0,0,-80> translate<0,Hopset-(Hopdia-1),0>}
                box{<-3,0,-3>,<3,3,3> translate<0,Hopset-(Hopdia-1),0>}
                }
        }
        texture{Armourtex}
        }
//===============================================
#declare Sword=
    union{
        // Hilt
        blob{
            threshold .2
            cylinder{<0,0,-2>,<0,0,2>,1,1}
            sphere{<0,0,0>,1,1}
        }
        cylinder{<0,0,2>,<0,0,3>,.9}
        box{<-.45,2,-1.95>,<.45,-1.95,-3>}
        // Blade
        difference{
            superellipsoid{<0.01,.95> rotate<0,0,45> translate z*-.6}
            box{<-2,-2,0>,<2,2,1>}
            scale <.25,.75,12>
            translate <0,0,-2.45>
            texture{Silver3}
        }
        #if (BM_Gender=0)
            scale<.8,1,1>
            scale .91
        #end
        rotate <-15,0,0>
        translate<1,-2.0,0>
        texture{Armourtex}
    }
//===============================================
#declare BootR=
    union{
        difference{    
            union{ // Sole
                #if (BM_Gender=0)
                    cylinder{<0,0,0><0,-.75,0> 2.2 scale<1,1,1.2> translate <0,-2.5,0>}
                    cylinder {<0,0,0><0,-.75,0> 2.9 scale<1,1,.6> rotate x*BM_Toe_Angle.z translate <-.3,-2.5,-5.7> clipped_by {plane {z,-5.7}}}
                    prism{ linear_sweep linear_spline 0,-0.75,5, <-2,0>,<2,0>,<2.5,-5.7>,<-3.4,-5.7>,<-2,0> translate <0,-2.5,0>}
                #end
                #if (BM_Gender=1)
                    cylinder{<0,0,0><0,-.75,0> 2.2 translate <0,-2.5,0>}
                    cylinder {<0,0,0><0,-.75,0> 2.9 rotate x*BM_Toe_Angle.z translate <-.3,-2.5,-5.7> clipped_by {plane {z,-5.7}}}                              
                    prism{ linear_sweep linear_spline 0,-0.75,5, <-2,0>,<2,0>,<2.5,-5.7>,<-3.4,-5.7>,<-2,0> translate <0,-2.5,0>}
                #end
            }        
            box{<-4,-8,0><4,0,-8> rotate x*-14 rotate y*8 translate <0,-2.6,-2>}
            texture {SoleTex}
        }      
        union{ //Uppers
            object{
            //union{
                //sphere{<0,.5,0>,2.6}
                cylinder{<0,.5,0><0,0,0>2.6}
                clipped_by{plane{y,0 inverse}}
                clipped_by{plane {z,0 rotate x*45}}                                            
                rotate x*BM_Toe_Angle.z 
                translate <-.3,-2.5,-5.7>
            }
            cone{<0,0,0>1.75,<0,-2.5,0>1.9}
            #if (BM_Gender=0)
                sphere{0,1.75 scale<1,1.3,1.5>}
                cylinder{0,<0,-2.5,0>,1.75 scale<1,1.3,1.5>}
                cone{<0,-.5,0>1.75,<-.3,-2.5,-4.7>2.6 clipped_by {plane {y,-2.5 inverse}}}
                cone{<0,-2,0>1.75,<-.3,-2.5,-4.7>2.6 clipped_by {plane {y,-2.5 inverse}}}
            #end
            #if (BM_Gender=1)
                sphere{0,1.75}
                cone{<0,-.5,0>1.75,<-.3,-2.5,-5.7>2.6 clipped_by {plane {y,-2.5 inverse}}}
                cone{<0,-2,0>1.75,<-.3,-2.5,-5.7>2.6 clipped_by {plane {y,-2.5 inverse}}}
            #end
            texture{BootTex}
        }
        #local Laces=0;
        #while (Laces<4)
            torus{1,.2 texture {LaceTex} rotate z*30 translate <0,-1-Laces,-.2> rotate x*80}  
            torus{1,.2 texture {LaceTex} rotate z*-30 translate <0,-1-Laces,-.3> rotate x*80}  
            #declare Laces=Laces+1;
        #end
        #if (BM_Gender=0)
            scale <8.5/7,8/7,8/7>
            translate<0,0,0.4>
        #end
        #if (BM_Gender=1)
            scale 1
            translate<0,0,0>
    	#end
    
    }
//===============================================
#declare BootL=
    object{BootR scale<-1,1,1>}
//===============================================
#macro Belt(BT_Gender,BT_Build)
#local Buckledist=8*sqrt(1-sqrt(BT_Build/1));
    union{
        difference{
            blob{
                threshold BT_Build
                cylinder{<0,1,0>,<0,-1,0>,8,1}
            }
            plane {y,-1}
            plane {y,1 inverse}
        }
        difference{
            box{<-1.5,-1.5,0><1.5,1.5,.5> translate <0,0,-Buckledist> texture{Armourtex}}           
            box {<-1,-1,0><1,1,.25> translate <0,0,-Buckledist> texture{Armourtex finish {ambient -.15}}}          
        }
        #if (BT_Gender=0)
            scale <1.4,1,.85>
            translate <0,-21,-0.5>
        #end    
        #if (BT_Gender=1)
            scale <1.1,1,.85>
            translate <0,-21,-0.5>
        #end    
        texture{Rust}
    }
#end    
//===============================================
/************************************************
  Declare the BM_Bodypart_Objects
************************************************/
#if (Helmon=1)
    #declare BM_Head_Object=
        union{
            object{BM_Head_Object}
            Helmet(BM_Gender,BM_Build)
            }
#end
//#declare BM_Neck_Object=object{BM_Neck_Object}
#declare BM_Torso_Object=
    union{
        object{BM_Torso_Object}
        TunicTop(BM_Gender,BM_Build,Xena)
        CorsTop(BM_Gender,BM_Build-0.03,Xena)
        }
#declare BM_Abdomen_Object=
    union{
        object{BM_Abdomen_Object}
        TunicBot(BM_Gender,BM_Build)
        CorsBot(BM_Gender,BM_Build-0.03)
        Belt(BM_Gender,BM_Build-0.06)
        }
#declare BM_Upperarm_R_Object=
    union{
        object{BM_Upperarm_R_Object}
        TunicArm(BM_Gender,BM_Build,1)
    }
#declare BM_Upperarm_L_Object=
    union{
        object{BM_Upperarm_L_Object}
        TunicArm(BM_Gender,BM_Build,-1)
    }
//#declare BM_Forearm_R_Object=object {BM_Forearm_R_Object}
#declare BM_Forearm_L_Object=
    union{
        object{BM_Forearm_L_Object}
        object{Hoplon}
        }
#declare BM_Hand_R_Object=
    union{
        object{BM_Hand_R_Object}
        object{Sword}
    }
//#declare BM_Hand_L_Object=object {BM_Hand_L_Object}
#declare BM_Thigh_R_Object=
    union{
        object{BM_Thigh_R_Object}
        TunicLeg(BM_Gender,BM_Build,1)
    }
#declare BM_Thigh_L_Object=
    union{
        object{BM_Thigh_L_Object}
        TunicLeg(BM_Gender,BM_Build,-1)
    }
#declare BM_Calf_R_Object=
    union{
        object{BM_Calf_R_Object}
        object{GreaveR}
        }
#declare BM_Calf_L_Object=
    union{
        object{BM_Calf_L_Object}
        object{GreaveL}
        }
#declare BM_Foot_R_Object=
    union{
        object{BM_Foot_R_Object}
        object{BootR}
    }
#declare BM_Foot_L_Object=
    union{
        object{BM_Foot_R_Object}
        object{BootL}
    }
// End of Costume Definition File

