/*******************************************************
    POV-Ray - BlobMan People Costume Definition File
 File Name : Tufgirlz.cdf
 BM_Version: 4.2
 Desciption: Female Costume Definition File
 Date      : July 2000 
 Author    : Ulrich von Bek 
 Email     : ulrich_von_bek@hotmail.com 
 WWW       :             
 Notes     : Tufgirlz.cdf version 1.0 
    This .CDF file incorporates large chunks of Bmtorso.inc, along with 
    some snippets from Croft.cdf, both by Peter Houston who created 
    Blobman 4.2, and thus inspired me to waste my time writing
    .CDF files...
     
    Email: houston.graphics@iname.com  
    WWW: http://welcome.to/HoustonGraphics 
         http://members.xoom.com/HosutonGraph

    The Boots do not sit on y0 so if you transform
    the figure using the Toe Origins you will need 
    to add the following translation after the 
    transformation
    
        translate <0,1,0>*BM_Scale 
    
    The Toes of the Boots are bent to match the Toe Angle
    of 50 degrees, to create the high heels. 
    
    This .cdf has only been designed and tested for female 
    Blobpeople, but... 
    If you want a guy in a skirt that doesn't fit...
    
    You must make sure that the BM_Build value your using is 
    specified BEFORE including this file, else it will use it's 
    default value which may not match the figure your using. 
    You must specify the pose file before including this file, 
    as some of the limb angles are used in the creation of the
    costume objects.
    
    You must call the Tufgirlz macro in order to generate a
    costume. No macro, no costume, it's that simple.
    
    Here is a suggested method of using this file:
    > cut & paste from here...
        #include "colors.inc"          // standard colours
        #include "textures.inc"        // standard textures
        #include "bmpeople.inc"        // sets default Blobman values, defines macros
        #include "fempose.pos"         // the female pose file for use 
                                       // with this .cdf
        #include "tufgirlz.cdf"        // this file
        // your scene, lighting and camera goes here
        //==========================================
        #declare Gender=1;             // pick a gender for the figure
        #declare BM_PoseNo=7;          // pick a pose
        TufGirlz_Costume(1,0,1,0)      // the Tufgirlz macro
        Blob_Man(Gender,1.8)           // call the Blobman macro
        object {BlobMan}               // put the dressed figure in your scene
    > ... to here    
    
    Options: The macro parameters are as follows, these alter the 
    appearance of the costume.
    TufGirlz_Costume(value 1, value 2, value 3, value 4)
        Value 1:    Underwear
                    0= Bra, Panties, Stockings
                    1= Bra, Panties
                    2= Panties, Stockings
                    3= Panties
                    4= Boobtube, Shorts
                    5= Shorts
                    6= 1 Piece Swimsuit
                    9= No Underwear
        Value 2:    Top
                    0= Blouse
                    1= Croptop
                    9= No Top
        Value 3:    Suit
                    0= Jacket, Miniskirt
                    1= Miniskirt
                    2= Jacket, Trousers
                    3= Trousers
                    9= No Suit
        Value 4:    Shoes
                    0= High Heels
                    9= No Shoes
    
    Poses: The pose file Fempose.pos contains 13 poses
           These are the standard poses modified to function with the
           High Heeled Shoes, plus a bonus pose. None of the poses 
           include hair.        

********************************************************/
#declare CDF=true; //Used by Body_Part_Viewer.pov Can be removed. 
/********************************************************
  Image Maps & Textures
********************************************************/
// ==== Standard POV-Ray Includes ====
//#include "colors.inc"	// Standard Color definitions
//#include "textures.inc"	// Standard Texture definitions
#declare BM_Gender=1;
#declare BM_Toe_Angle=<50,0,50>;

#ifndef (BM_PoseNo)
    #declare BM_PoseNo=0;
#end
    #if (BM_PoseNo>=0)
        #declare BM_RL_H2K       = BM_Pose[BM_PoseNo][7];
        #declare BM_RL_K2A       = BM_Pose[BM_PoseNo][8];
        #declare BM_LL_H2K       = BM_Pose[BM_PoseNo][9];
        #declare BM_LL_K2A       = BM_Pose[BM_PoseNo][10];
#end
    #if (BM_Gender=0)
        #local Shoulder         =<8.25,1,0>;
        #local Hips             =<1.5,2,1.5>;
        #local UpperarmLength   =11;
        #local ForearmLength    =10.5;
        #local ThighLength      =14;
        #local CalfLength       =17;     
        #local R_Leg            =transform {translate <-0,-2,-.75>}
        #local L_Leg            =transform {translate < 0,-2,-.75>}
    #end
    #if (BM_Gender=1)
        #local Shoulder         =<6.25,1,.25>;
        #local Hips             =<.75,-3,1>;//<1,-3,1.25>;//<.75,-3,1>;
        #local UpperarmLength   =10.85;
        #local ForearmLength    =10.5;
        #local ThighLength      =14.7;
        #local CalfLength       =18.9; 
        #local R_Leg            =transform {translate <-.55,2,-1>}
        #local L_Leg            =transform {translate < .55,2,-1>}
    #end
    #local R_Knee =vrotate(<0,-ThighLength,0>,BM_RL_H2K);
    #local R_Ankle=vrotate(<0,-CalfLength,0> ,BM_RL_K2A);
    #local L_Knee =vrotate(<0,-ThighLength,0>,BM_LL_H2K);
    #local L_Ankle=vrotate(<0,-CalfLength,0> ,BM_LL_K2A);
    #local R_HipReplace=<BM_RL_H2K.y/-50,0,BM_RL_H2K.y/-50>;
    #local L_HipReplace=<BM_LL_H2K.y/-50,0,BM_LL_H2K.y/50>;
    #local R_Thigh=transform {rotate BM_RL_H2K translate <-Hips.x+R_HipReplace.x,-29+Hips.y,R_HipReplace.z+Hips.z>}
    #local L_Thigh=transform {rotate BM_LL_H2K translate < Hips.x+L_HipReplace.x,-29+Hips.y,L_HipReplace.z+Hips.z>}
    #local R_Calf =transform {rotate BM_RL_K2A translate R_Knee translate <-Hips.x+R_HipReplace.x,-29+Hips.y+BM_Gender,R_HipReplace.z+Hips.z>}
    #local L_Calf =transform {rotate BM_LL_K2A translate L_Knee translate < Hips.x+L_HipReplace.x,-29+Hips.y+BM_Gender,L_HipReplace.z+Hips.z>}


#declare TG_Ruby_Glass =
texture {
    finish {
        ambient 0.1
        diffuse 0.1
        reflection .25
        specular 1
        roughness 0.001
    }
    pigment { color rgbf <0.9, 0.1, 0.2, 0.8> }
}

#declare TubeTex=
    texture {
        pigment {rgb 1}
        normal {quilted .5 scale .1}
    }

#declare BootTex= texture {
    pigment {rgb .05}
    finish {phong .5 reflection .1}
}
 
#declare SoleTex= texture {
    pigment {rgb .15 }
    normal {ripples 1 scale .5}
    
} 

#declare LaceTex=texture {pigment {rgb <0.556863, 0.137255, 0.137255>}
                          normal {quilted 1 scale .1 rotate z*45}
                 }

#declare SpecFrames = texture {
  pigment {
    rgb <0.2, 0.2, 0.2> 
  }
  finish {
    ambient 0.1
    diffuse 0.7
    brilliance 6.0
    reflection 0.2
    phong 0.8
    phong_size 120
  }
}

#declare StockingTex=
    texture{
        pigment {rgbt <.3,.3,.3,.5> quick_colour rgbt .3}
        normal {quilted .5 scale .1 rotate z*45}
        //normal {spiral2 30, .001}
        }

#declare LingerieTex=
    texture{
        pigment{
            marble
            color_map{
                [0.0 color rgbt<.2,.2,.2,.35>]
                [0.5 color rgbt<.2,.2,.2,.35>]
                [0.6 color rgb .2]
                [1.0 color rgb .2]
                }
            turbulence 2.3
            quick_colour rgbt .2
        }
        normal{marble turbulence 2.3}
        normal {quilted .5 scale .1 rotate z*45}
        }

#declare DressTex=
    texture {
        pigment {rgb <1,0,0> quick_colour rgb <1,0,0>}
        normal {quilted .5 scale .1}
    }

#declare SuitTex=
    texture{
        pigment{
            radial color_map{[0.95 rgb .45][0.95 rgb .75]}
            frequency 20
            quick_colour rgb .45
        }
        normal {quilted .5 scale .2 rotate z*45}
        }

/********************************************************
  Body Part Options
********************************************************/
// Navel - -1 = Inverted Navel, 0 = No Navel, 1 = Protruding Navel
#declare BM_Navel=-1;
// Nipples - : 0 = No Nipples, 1=Nipples
#declare BM_Nipples=1;
// Right Foot - 1 = Normal, 0 = Amputated
//#declare BM_R_Foot=1;
// Left Foot - 1 = Normal, 0 = Amputated
//#declare BM_L_Foot=1;
// Male Abdomen Muscle Flexing - 1 = On, 0 = off
#declare BM_Flex=0;
// Female T-Shirt - 1 = On, 0 = Off
#declare BM_TShirt=0;
// Finger Nails - 1 = On, 0 = Off
// #declare BM_Nails=1;
// Apply Iamge Maps to Right Hand Fingers - 1=On, 0=Off
//#declare BM_Map_R_Finger=1;
// Apply Iamge Maps to Left Hand Fingers - 1=On, 0=Off
//#declare BM_Map_L_Finger=1;

/********************************************************
  Body Form Objects
********************************************************/

#macro BodyFoot (BT_Gender,BT_Build,BT_Side,BT_ToeAng)
     union {
    	blob{
    		threshold BT_Build
    		cylinder { <0,0,0>,<0,.00001,0> 0.36, .75 // joint
    			scale <1, 0.8, .5>
    			translate <0.0, 0.08, -0.03>
    		}                                 
            cylinder { <-.1,.05,-.1>,<.1,.05,-.15>,.1,1 }
    		cylinder { <0, 0, -0.1>, <0, .1, -0.25>, 0.4, 1 //
    			scale <0.6,0.6, 1>
    			translate <-0.01, 0, 0>    
    		}
    		cylinder { <0, 0, -0.05>, <0, 0, -0.45>, 0.3, 1
    			scale <0.9,0.7, 1>
    			translate <0.05, -0.08, 0>  
    		}
    		cylinder { <0, 0, -0.5>, <0, 0, -0.75>, 0.3, 1 // side
    			scale <0.9, 0.5, 1>
    			translate <0.15, -0.15, 0>  
    		}
    		cylinder { <0, 0, -0.15>, <0, 0, -0.65>, 0.4, 1 // bottom & heel
    			scale <0.9,0.55, 1>
    			translate <0, -0.17,0>    
    		}        
    		sphere { 0,.1, 1 
    		    scale <1,1,1.5> 
    		    translate <-0.12, -.21, -0.8>
    		}  
    		sphere { 0,.1, 1 
    		    scale <1,1,1.5>  
    		    translate <0.01, -.22, -0.8>
    		}   
            sphere { 0,.1, 1 
    		    scale <1,1,1.5>  
    		    translate <0.12, -.22, -0.8>
    		}
            sphere { <0,0,0>,.1, 1 
    		    scale <1,1,1.5>  
    		    translate <0.22, -.2, -0.8>
    		}
    		sphere { 0,.1, 1 
    		    scale <1,1,1.5>
    		    translate <0.28, -.18, -0.8> 
    	    }
    	    // Heel
    	    cylinder {<0,0,0>,<0,.4,0>,.3,.5 
    	        scale <1,.5,1>
    	        rotate x*-15
    	        translate <0.00, -0.17,0>  
    	    }                                    
            sphere {0,.3,1 
    	        scale <.75,.5,.8>
    	        translate <0.05, -0.15,-.7> 
    	    }
    	    sphere {0,.3,-.85
    	            scale <.75,2,.9>
    	            rotate z*55
    	            translate <-.3,-.27,-.45>
    	    } 
    	}
        // Toes
    	union {
    		// 1st Toe (Big)
    		blob {
    			threshold BT_Build
    			cylinder { <0, 0, .1>, <0, 0, -0.2>, 0.16, 1
    				}
                sphere { <0,0,.2>,.25,-.7 }    				
    		    rotate <BT_ToeAng, 0, 0>
    		    translate <-0.12, 0, -0.8>
    			//sturm
    		}
    		// 2nd Toe
    		blob {
    			threshold BT_Build
    			cylinder { <0, 0, 0>, <0, 0, -0.19>, 0.14, 1
    				rotate BT_ToeAng*x
    				translate <0.01, 0.01, -0.8>}
    			//sturm
    		}
    		// 3rd Toe
    		blob {
    			threshold BT_Build
    			cylinder { <0, 0, 0>, <0, 0, -0.17>, 0.13, 1
    				rotate BT_ToeAng*x
    				translate <0.12, 0.005, -0.8>}
    			//sturm
    		}
    		// 4th Toe
    		blob {
    			threshold BT_Build
    			cylinder { <0, 0, 0>, <0, 0, -0.15>, 0.12, 1
    				rotate <BT_ToeAng, 5, 0>
    				translate <0.22, 0, -0.8>}
    			sturm
    		}
    		// 5th Toe (Little)
    		blob {
    			threshold BT_Build
    			cylinder { <0, 0, 0>, <0, 0, -0.13>, 0.11, 1
    				rotate <BT_ToeAng, 10, 0>
    				translate <0.3, 0,-0.8>}
    			//sturm
    		}
    		translate <0, -0.175, 0>
    	}
        translate <0,.05,0>
        #if (BT_Gender=0)
            #local BT_Ankle=<.15,-1.5,1.35>;
            scale <8.5,8,8>
        #end
        #if (BT_Gender=1)
            #local BT_Ankle=<0,-1,.25>;
            scale 7                             
    	#end
    	rotate -3*z
    	scale <BT_Side,1,1> //right foot BT_Side=-1 left foot BT_Side=1
        translate BT_Ankle
    }                             
#end     

#macro BodyUArm(BT_Gender,BT_Build,BT_Side)
    #if (BT_Gender=0)
        #local UpperarmLength   =11;     
    #end
    #if (BT_Gender=1)
        #local UpperarmLength   =10.85; 
    #end
    #local UArmform=
        #if (BT_Gender=0)
            blob{
                threshold BT_Build
                sphere   { 0, 5, 1 scale <1.0, 0.8, 0.9> rotate 45*z }// Shoulder Joint
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
#macro BodyFArm(BT_Gender,BT_Build,BT_Side)
    #if (BT_Gender=0)
        #local ForearmLength    =10.5;     
    #end
    #if (BT_Gender=1)
        #local ForearmLength    =10.5; 
    #end
    #local FArmform=
        #if (BT_Gender=0)
            blob{
                threshold BT_Build
                cylinder { <0, 0, 0 >, <ForearmLength, 0, 0>, 2.0, 1 scale <1, 1, 0.7>}
                sphere { <0, 0, 0>, 3.5, 1 scale <2.0, 1, 1> translate x*(ForearmLength*.4) }
                cylinder { <0,0,0>, <(ForearmLength*.4), 0, 0>, 2.0, 1 }
                rotate z*-90
                }
        #end
        #if (BT_Gender=1)
            blob{
                threshold BT_Build
                cylinder { <0, 0, 0 >, <ForearmLength, 0, 0>, 1.96, 1 scale <1, 1, 0.7>}
                sphere { <0, 0, 0>, 2.8, 1 scale <2.0, 1, 1> translate 4.2*x }
                cylinder { <0,0,0>, <4.2, 0, 0>, 1.68, 1 }
                rotate z*-90
                }
        #end                         
    object{FArmform scale<BT_Side,1,1>} //right arm BT_Side=1 left arm BT_Side=-1
#end

#macro BodyShin(BT_Gender,BT_Build,BT_Side)
    #if (BT_Gender=0)
        #local CalfLength       =17;     
    #end
    #if (BT_Gender=1)
        #local CalfLength       =18.9; 
    #end
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

#macro BodyThigh(BT_Gender,BT_Build,BT_Side)
    #if (BT_Gender=0)
        #local ThighLength       =14;     
    #end
    #if (BT_Gender=1)
        #local ThighLength       =14.7; 
    #end
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

#macro BodyBot(BT_Gender,BT_Build)
    
#local FemaleBot=
    blob{
        threshold BT_Build
        cylinder { <0,0.5,0>, <0,0.95,0>, 1, 1 scale <1.05, 0.95, 0.85> }
        sphere { 0, 1, 1 scale < 1.15, 0.75, 0.55> translate <0, 0.3, 0.0> }
        sphere { 0, 1, 1 scale <0.5, 0.8, 0.5 > translate <0, 0, 0 > }
        sphere { 0, 1,-.5 scale <.75,.75,.8> translate <.65,-.3,.75> }
        sphere { 0, 1,-.5 scale <.75,.75,.8> translate <-.65,-.3,.75>}
        /*#if (BM_Navel<0)
            sphere {0,.3,-1 scale <.14,.1,2.1> translate <0,1, -.7> }
        #end
        #if (BM_Navel>0)
            sphere {0,.3,1 scale <.14,.14,.14> translate <0,1, -.45> }
        #end*/                                
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
        /*#if (BM_Navel<0)
            sphere {0,.75,-1 scale <1,.75,3> translate <0,-22, -5.25> }
        #end
        #if (BM_Navel>0)
            sphere {0,.6,1 scale <1,1,2> translate <0,-22, -3.15> }
        #end*/
    }   

// Select the Body Form
        #if (BM_Gender=0)
            object{MaleBot}
        #end
        #if (BM_Gender=1)
            object {FemaleBot scale <1,1,.95> translate <0,0,-.5> }
        #end    
#end

#macro BodyHead(BT_Gender,BT_Build) // start head form macro
    
    #local MouthWidth=BM_Mouth;
    #local MouthHeight=BM_Jaw;
    #local MouthPos=<0,-4,-2.75>;
    #local MouthRot=<0,0,BM_MouthShape*15>;

#local HalfHead=
    difference{
        blob{
            threshold BT_Build
            sphere{0,5.6,2 scale <1,1,.95> translate z*-1 } // Top Front of Skull
            sphere{0,5.6,2 scale <1,1,.9> translate z*1 } // Top of Back Skull  
            cylinder{<0,2.5,0><0,4,0>,1,1 scale <2.5,1,3> translate <0,-5,-1.3> }
            cylinder{<0,1.5,0><0,2,0>,1,1 scale <1.5,1,3>translate <0,-5,-1.3> }
            sphere{0,4,1 scale <.75,.5,.75> rotate x*10 translate  <0,-3.5,.75>} // Base of Skull
            sphere {0,2.85,2 translate <0,-2.75,-1.3> rotate y*-35}
            cylinder{<0,0,0><0,1,0>,1,1 scale <3-(BT_Gender/2),1,3> translate <0,-5,-1.75> rotate x*(BM_Jaw*-12)}
            sphere {0,4,1.5 scale <1,1,.75> translate <0,-3.5,0>}
            cylinder {<1,0,0><2.5,0,0>,1,-.75 rotate y*-35 translate <0,-.8,-4.25> }
            sphere {0,1,-.25 scale <3,1,1> translate <.5,-1,-4.25> }
            // Nose
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
            // Eye Ridge Socket
            cylinder{<0,0,0>,<10,0,0>,1,-1.5  scale <1,1.75,1> rotate y*-20 rotate z*0 translate <1.5,-1.8,-4.5>  }
            cylinder{<0,0,0>,<10,0,0>,1,-1 scale <1,1.75,1> rotate y*-20 rotate z*0 translate <1.5,-1.8,-4.5> rotate y*-20 }
            cylinder{<0,0,0>,<10,0,0>,1,-1 scale <1,1.75,1> rotate y*-20 rotate z*0 translate <1.5,-1.9,-4.5> rotate y*-40 }
            cylinder{<0,0,0>,<10,0,0>,1,-1.5 scale <1,1,1> rotate y*-20 rotate z*7.5 translate <1.5,-1.8,-4.5> }
            // Cheeks
            sphere{0,1.5,BM_Jowls+.0000001 scale <1.25,1.5,.75> rotate x*-20 translate <0,-3,-3> rotate y*-55 }
            // Ears
            #if (BM_Ears>= 2)
                sphere{0,1,2 scale<1,1.75,.7> rotate y*-45 rotate z*-10 translate<4.2,-.85-.5,0> } // Outer Ear Left
                sphere{0,1,-2 scale<1,1.75,.7>*.7 rotate y*-45 rotate z*-10 translate<4.2,-.7-.5,-.35>} // Inner Ear Left
                sphere{0,1,2 scale<1,1.75,.7>/3.5 rotate y*-45 rotate z*-10 translate<4.025,-.7-.5,-.35>} // Inner Ear Canal Left
            #end
            #if (BM_Ears = 1)
                sphere{0,1,2 scale<1,1.0,.9> scale <1,1.75,1.5> rotate z*-5 translate<3.8,-.85-.75,0> } // Outer Ear Left
            #end
            // Mouth     
            #if (BM_Jaw>1)              
                #local MouthHeight=1;
            #end
            #if (MouthHeight<=.25)
                #local MouthHeight=.5;
            #end
            #local MouthHeight=BM_Jaw+(BM_Jaw/10)+.0001;
            // Inside of Mouth
            //sphere {0,1,-4 scale <.1+BM_Mouth*1.5,.1+BM_Jaw,1> rotate MouthRot translate MouthPos-<0,BM_Jaw/2-(BM_Jaw/3),0> pigment {rgb -1.5}}
        }
        plane {x,-0.0000001}
    }
    
    union{
        object {HalfHead}
        object {HalfHead scale <-1,1,1>}
    }        
#end //end head form macro

#macro SuitShin(BT_Gender,BT_Build,BT_Side)
    #if (BT_Gender=0)
        #local CalfLength       =17;     
    #end
    #if (BT_Gender=1)
        #local CalfLength       =18.9; 
    #end
#local Shinform=
        #if (BT_Gender=0)
            blob{
                threshold BT_Build
                cylinder{<0,0,0>, <0, -CalfLength, 0>, 2.75, 1}
           		cylinder { <0, 0, 0>,<0,(-CalfLength+6.65)*1/2,-1>, 5.5, 1 scale <1, 2, 1> translate <-.14, -6.65, .84>}  
                //sphere{ <0, 0, 0>, 5.5, 1 scale <1, 2, 1> translate <-.14, -6.65, .84>}
                //sphere{ <0, 0, 0>, 4, -.1 scale <2, 4, .75> translate <0, -CalfLength-2, -1>}
            }
        #end
        #if (BT_Gender=1)
            blob{
                threshold BT_Build
           		cylinder {<0,-1.5,0>, <0, -CalfLength, 0>, 2.52, 1}
           		cylinder { <0, 0, 0>,<0,(-CalfLength+6.65)*1/2.4,-1>, 4.13, 1 scale <1, 2.4, 1> translate <-.14, -6.65, .84>}  
           		//sphere { <0, 0, 0>, 4.13, 1 scale <1, 2.4, 1> translate <-.14, -6.65, .84>}  
                //sphere { <0, 0, 0>, 2, -.1 scale <2, 4, .75> translate <0, -CalfLength-2, -1>}
            }   
        #end                       
    
    object{Shinform scale<BT_Side,1,1>} //right shin BT_Side=1 left shin BT_Side=-1
#end // end of Shin macro

#macro SuitFArm(BT_Gender,BT_Build,BT_Side)
    #if (BT_Gender=0)
        #local ForearmLength    =10.5;     
    #end
    #if (BT_Gender=1)
        #local ForearmLength    =10.5; 
    #end
    #local FArmform=
        #if (BT_Gender=0)
            blob{
                threshold BT_Build
                cylinder { <0, 0, 0 >, <ForearmLength, 0, 0>, 2.0, 1 scale <1, 1, 0.7>}
                //sphere { <0, 0, 0>, 3.5, 1 scale <2.0, 1, 1> translate x*(ForearmLength*.4) }
                cylinder { <0, 0, 0>,<(ForearmLength-ForearmLength*.4)/2,0,0>, 3.5, 1 scale <2.0, 1, 1> translate (ForearmLength*.4)*x }
                cylinder { <0,0,0>, <(ForearmLength*.4), 0, 0>, 2.0, 1 }
                rotate z*-90
                }
        #end
        #if (BT_Gender=1)
            blob{
                threshold BT_Build
                cylinder { <0, 0, 0 >, <ForearmLength, 0, 0>, 1.96, 1 scale <1, 1, 0.7>}
                //sphere { <0, 0, 0>, 2.8, 1 scale <2.0, 1, 1> translate 4.2*x }
                cylinder { <0, 0, 0>,<(ForearmLength-4.2)/2,0,0>, 2.8, 1 scale <2.0, 1, 1> translate 4.2*x }
                cylinder { <0,0,0>, <4.2, 0, 0>, 1.68, 1 }
                rotate z*-90
                }
        #end                         
    object{FArmform scale<BT_Side,1,1>} //right arm BT_Side=1 left arm BT_Side=-1
#end

/*===============================================
Create the clothing objects
===============================================*/
#declare Specs=
    union {
        object{sphere {0,1 scale <1,.75,.25>  translate <-1.75,0,0> texture {TG_Ruby_Glass}} interior {ior 1.5}}    
        torus {1.15,.15 rotate x*90 scale <1,.75,.1>  translate <-1.75,0,0> }
        cylinder {<0,0,0><-1.9,0,4>.15 translate <-2.75,0,0>}
        torus {1,.15 rotate z*90 scale <1,1,1> clipped_by {plane {z,0 inverse}}translate y*-1 rotate z*15 translate <-4.75,0,4>} 
        object{sphere {0,1 scale <1,.75,.25>  translate <1.75,0,0> texture {TG_Ruby_Glass}} interior {ior 1.5}}            
        torus {1.15,.15 rotate x*90 scale <1,.75,.1>  translate <1.75,0,0>}
        cylinder {<0,0,0><1.9,0,4>.15 translate <2.75,0,0>}
        torus {1,.15 rotate z*90 scale <1,1,1> clipped_by {plane {z,0 inverse}}translate y*-1 rotate z*-15 translate <4.75,0,4>} 
        torus {1,.15 rotate x*90 translate y*-.5 clipped_by {plane {y,0 inverse}} }
        texture {SpecFrames}
    }      

#declare BootLF=
    union{
        object{
        //difference{
            union{ // Sole
                /*
                cylinder {<0,0,0><0,-.75,0> 2.0  // heel plate 
                    translate <0,-2.5,0>
                    }*/
                cone {<0,0,0>,1.5,<0,-5.1,0> .2  // stiletto
                    rotate <50,0,0>
                    translate <0,-2.25,0>
                    texture {BootTex}
                    }
                cylinder {<0,0,0><0,-.75,0> 2.5   // toe plate 
                    rotate x*BM_Toe_Angle.z
                    translate <-.3,-2.5,-5.7> 
                    clipped_by {plane {z,-5.7}}
                    }                              
                prism {   linear_sweep   linear_spline    // instep plate 
                    0,-0.75,5,
                    <-1.5,0>,<1.5,0>,<2.2,-5.7>,<-2.8,-5.7>,<-1.5,0>
                    translate <0,-2.5,0>
                    }
                }
            /*        
            box {<-4,-8,0><4,0,-8>
                rotate x*-14
                rotate y*8
                translate <0,-2.6,-2>
                }*/
            texture {SoleTex}
        }      
        union { //Uppers
            /*union {
                sphere {<0,.5,0>,2.4}  // toecap
                cylinder {<0,.5,0><0,0,0>2.4}
                clipped_by {plane{y,0 inverse}}
                clipped_by {plane {z,0 rotate x*45}}                                            
                rotate x*BM_Toe_Angle.z 
                translate <-.3,-2.5,-5.7>
                
                }*/
            //cone {<0,0,0>1.75,<0,-2.5,0>1.9} // heel
            sphere {<0,-2.0,0>,1.9}
            //sphere {0,1.75} // ankle
            /*
            cone {<0,-.5,0>1.75,<-.3,-2.5,-5.7>2.6  // instep
                clipped_by {plane {y,-2.5 inverse}}
                }*/
            cone {<0,-2,0>1.75,<-.3,-2.5,-5.0>2.5  // instep 2
                clipped_by {plane {y,-2.5 inverse}}
                }
            texture {BootTex}
        }
        /*                         
        #local Laces=0;
        #while (Laces<4)
            torus {1,.2 
                texture {LaceTex}
                rotate z*30
                translate <0,-1-Laces,-.2>
                rotate x*80
                }  
            torus {1,.2 
                texture {LaceTex}
                rotate z*-30
                translate <0,-1-Laces,-.3>
                rotate x*80
                }  
            #declare Laces=Laces+1;
        #end*/
        scale <-1,1,1>
    }    
#declare BootRF=object{BootLF scale<-1,1,1>}

#declare Bra=
    difference{
        BodyTop(BM_Gender,BM_Build-0.005,0)
        //BodyTop(BM_Gender,BM_Build-0.000,0)
        cylinder{<0,-17.25,0>,<0,-26,0>,10 rotate<-10,0,0>}        
        box{<3,0,1><-3,-10,-10> }
        box{<3,0,10>,<-3,-15,-1> }
        cylinder{<0,-10,1>,<0,-10,-10>,5 scale<.6,1,1>}
        box{<-9.5,0,1><-3.5,-10,-10> }
        box{<-9.5,0,10><-3.5,-15,-1> }
        cylinder{<0,-10,1>,<0,-10,-10>,5 scale<.6,1,1> translate<-6.5,0,0>}
        box{<9.5,0,1><3.5,-10,-10> }
        box{<9.5,0,10><3.5,-15,-1> }
        cylinder{<0,-10,1>,<0,-10,-10>,5 scale<.6,1,1> translate<6.5,0,0>}
        texture{LingerieTex}
    }
    
#declare Boobtube=
    difference{
        BodyTop(BM_Gender,BM_Build-0.005,1)
        BodyTop(BM_Gender,BM_Build-0.000,1)
        cylinder{<0,0,0>,<0,-13.0,0>,10}
        texture{TubeTex}
    }

#declare Dresstop=
    difference{
        BodyTop(BM_Gender,BM_Build-0.010,1)
        BodyTop(BM_Gender,BM_Build-0.005,1)
        box{<3,0,10><-3,-10,-10> }
        cylinder{<0,-10,10>,<0,-10,-10>,5 scale<.6,1,1>}
        texture{DressTex}
    }

#declare DressRUA=
    difference{
        BodyUArm(BM_Gender,BM_Build-0.010,1)
        BodyUArm(BM_Gender,BM_Build-0.005,1)
        cylinder{<0,-5,0>,<0,-15,0>,5}
        texture{DressTex}
    }

#declare DressLUA=object{DressRUA scale<-1,1,1>}

#declare DressRUAL=
    difference{
        BodyUArm(BM_Gender,BM_Build-0.010,1)
        BodyUArm(BM_Gender,BM_Build-0.005,1)
        //cylinder{<0,-5,0>,<0,-12,0>,5}
        texture{DressTex}
    }

#declare DressLUAL=object{DressRUAL scale<-1,1,1>}

#declare DressRFA=
    difference{
        SuitFArm(BM_Gender,BM_Build-0.010,1)
        SuitFArm(BM_Gender,BM_Build-0.005,1)
        cylinder{<0,0,0>,<0,-5,0>,10 translate y*-9.75}
        scale<1,1,1>
        texture{DressTex}
    }

#declare DressLFA=object{DressRFA scale<-1,1,1>}

#declare Dressbot=
    intersection{
        difference{
            BodyBot(BM_Gender,BM_Build-0.020)
            BodyBot(BM_Gender,BM_Build-0.010)
        }
        cylinder{<0,0,10>,<0,0,-10>,10 scale<1,.7,1> translate<0,-17,0>}
        texture{DressTex}
    }

#declare Croptop=
    union{
        difference{
            BodyTop(BM_Gender,BM_Build-0.010,1)
            BodyTop(BM_Gender,BM_Build-0.005,1)
            box{<3,0,10><-3,-10,-10> }
            cylinder{<0,-10,10>,<0,-10,-10>,5 scale<.6,.8,1>}
            cylinder{<0,0,1>,<0,-10,1>,2.5}
            plane { y, -16.25-0.01}
            }
        difference{
            BodyTop(BM_Gender,BM_Build-0.010,1)
            BodyTop(BM_Gender,BM_Build-0.005,1)
            cylinder{<0,0,1>,<0,-10,1>,2.5}
            plane { y, -16.0 inverse}
            plane { y, -16.25}
            translate y*16.0
            scale<1,8,1>
            translate y*-16.0
        }
        texture{DressTex}
    }

#declare Swimtop=
    difference{
        BodyTop(BM_Gender,BM_Build-0.005,1)
        BodyTop(BM_Gender,BM_Build-0.000,1)
        box{<3,0,1><-3,-10,-10> }
        box{<3,0,10>,<-3,-15,-1> }
        cylinder{<0,-10,1>,<0,-10,-10>,5 scale<.6,1,1>}
        cylinder{<0,-15,-1>,<0,-15,10>,5 scale<.6,1,1>}
        box{<-10.0,0,10><-4.0,-10,-10> }
        cylinder{<0,-10,10>,<0,-10,-10>,5 scale<.6,.9,1> translate<-7.0,0,0>}
        box{<10.0,0,10><4.0,-10,-10> }
        cylinder{<0,-10,10>,<0,-10,-10>,5 scale<.6,.9,1> translate<7.0,0,0>}
        texture{DressTex}
    }

#declare Swimbot=
    difference{
        BodyBot(BM_Gender,BM_Build-0.005)
        //BodyBot(BM_Gender,BM_Build-0.00)
        sphere{0,6 scale<1,1.3,1> translate<-7,-31,-1>}
        sphere{0,6 scale<1,1.3,1> translate<7,-31,-1>}
        texture{DressTex}
    }

#declare Panties=
    difference{
        BodyBot(BM_Gender,BM_Build-0.005)
        //BodyBot(BM_Gender,BM_Build-0.000)
        cylinder{<0,0,10>,<0,0,-10>,10 scale<1,.7,1> translate<0,-18,0>}
        sphere{0,6 scale<1,1,1> translate<-7,-31,-1>}
        sphere{0,6 scale<1,1,1> translate<7,-31,-1>}
        texture{LingerieTex}
    }

#declare Shortbot=
    difference{
        BodyBot(BM_Gender,BM_Build-0.005)
        //BodyBot(BM_Gender,BM_Build-0.000)
        cylinder{<0,0,10>,<0,0,-10>,10 scale<1,.7,1> translate<0,-18,0>}
        texture{TubeTex}
    }

#declare ShortRT=
    difference{
        BodyThigh(BM_Gender,BM_Build-0.005,1)
        //BodyThigh(BM_Gender,BM_Build-0.000,1)
        cylinder{<3,-18,0>,<3,-5,0>,10 rotate x*10 translate y*0}
        texture{TubeTex}
    }

#declare ShortLT=object{ShortRT scale<-1,1,1>}

#declare StockingRT=
    union{
        difference{
            BodyThigh(BM_Gender,BM_Build-0.005,1)
            object{BodyThigh(BM_Gender,BM_Build-0.000,1)texture{BM_Skin_Tex}}
            cylinder{<3,5,0>,<3,-5,0>,10 rotate x*10 translate y*1}
            texture{StockingTex}
        }
        intersection{
            cylinder{<3,1,0>,<3,-1,0>,10 rotate x*10 translate y*-5}
            //object{
            difference{
                BodyThigh(BM_Gender,BM_Build-0.006,1)
                object{BodyThigh(BM_Gender,BM_Build-0.000,1)texture{BM_Skin_Tex}}
                texture{LingerieTex}
            }
        }
    }
/*
#declare StockingLT=
    union{
        difference{
            BodyThigh(BM_Gender,BM_Build-0.005,-1)
            //BodyThigh(BM_Gender,BM_Build-0.000,-1)
            cylinder{<3,5,0>,<3,-5,0>,10 rotate x*10 translate y*1}
            texture{StockingTex}
        }
        intersection{
            cylinder{<3,1,0>,<3,-1,0>,10 rotate x*10 translate y*-5}
            object{
            //difference{
                BodyThigh(BM_Gender,BM_Build-0.006,-1)
                //BodyThigh(BM_Gender,BM_Build-0.000,-1)
                texture{LingerieTex}
            }
        }
    }
*/
#declare StockingLT=object{StockingRT scale<-1,1,1>}

#declare StockingRS=
    //object{
    difference{
        BodyShin(BM_Gender,BM_Build-0.005,1)
        object{BodyShin(BM_Gender,BM_Build-0.000,1)texture{BM_Skin_Tex}}
        texture{StockingTex}
    }
/*
#declare StockingLS=
    object{
    //difference{
        BodyShin(BM_Gender,BM_Build-0.005,-1)
        //BodyShin(BM_Gender,BM_Build-0.000,-1)
        texture{StockingTex}
    }
*/
#declare StockingLS=object{StockingRS scale<-1,1,1>}

#declare StockingRF=
    //object{
    difference{    
        BodyFoot(BM_Gender,BM_Build-0.005,-1,BM_Toe_Angle.z)
        object{BodyFoot (BM_Gender,BM_Build-0.000,-1,BM_Toe_Angle.z)texture{BM_Skin_Tex}}
        texture{StockingTex}
    }    

#declare StockingLF=
    //object{
    difference{    
        BodyFoot(BM_Gender,BM_Build-0.005,1,BM_Toe_Angle.x)
        object{BodyFoot (BM_Gender,BM_Build-0.000,1,BM_Toe_Angle.x)texture{BM_Skin_Tex}}
        texture{StockingTex}
    }    

#declare Suittop=
    union{
        difference{
            BodyTop(BM_Gender,BM_Build-0.020,1)
            BodyTop(BM_Gender,BM_Build-0.010,1)
            cylinder{<0,0,1>,<0,-10,1>,2.5}
            plane { y, -16.0-0.01}
            box{<1.5,0,0>,<-1.5,-20,-10>}
        }
        difference{
            difference{
                BodyTop(BM_Gender,BM_Build-0.020,1)
                BodyTop(BM_Gender,BM_Build-0.010,1)
                cylinder{<0,0,1>,<0,-10,1>,2.5}
                plane { y, -16.0 inverse}
                plane { y, -16.25}
                translate y*16.0
                scale<1,26,1>
                translate y*-16.0
            }
            box{<1.5,0,0>,<-1.5,-30,-10>}
        }
        texture{SuitTex}
    }

#declare Suitbot=
    difference{
        BodyBot(BM_Gender,BM_Build-0.020)
        BodyBot(BM_Gender,BM_Build-0.010)
        cylinder{<0,0,10>,<0,0,-10>,10 scale<1,.7,1> translate<0,-16,0>}
        texture{SuitTex}
    }

#declare SuitRT=
    difference{
        BodyThigh(BM_Gender,BM_Build-0.020,1)
        BodyThigh(BM_Gender,BM_Build-0.010,1)
        texture{SuitTex}
    }

#declare SuitLT=object{SuitRT scale<-1,1,1>}

#declare SuitRS=
    difference{
        SuitShin(BM_Gender,BM_Build-0.020,1)
        SuitShin(BM_Gender,BM_Build-0.010,1)
        cylinder{<0,0,0>,<0,-5,0>,10 translate y*-17.5}
        scale<1,1,1>
        texture{SuitTex}
    }

#declare SuitLS=object{SuitRS scale<-1,1,1>}

#declare SuitRUA=
    difference{
        BodyUArm(BM_Gender,BM_Build-0.020,1)
        BodyUArm(BM_Gender,BM_Build-0.010,1)
        texture{SuitTex}
    }

#declare SuitLUA=object{SuitRUA scale<-1,1,1>}

#declare SuitRFA=
    difference{
        SuitFArm(BM_Gender,BM_Build-0.020,1)
        SuitFArm(BM_Gender,BM_Build-0.010,1)
        cylinder{<0,0,0>,<0,-5,0>,10 translate y*-9}
        scale<1,1,1>
        texture{SuitTex}
    }

#declare SuitLFA=object{SuitRFA scale<-1,1,1>}

#declare Minibot=
    difference{
        union{  // outside of skirt
            difference{
                BodyBot(BM_Gender,BM_Build-0.020)
                //BodyBot(BM_Gender,BM_Build-0.010)
                cylinder{<0,0,10>,<0,0,-10>,10 scale<1,.7,1> translate<0,-16,0>}
                cylinder{<0,0,1>,<0,-10,1>,2.5}
                plane { y, -27.0-0.01}
                box{<1.5,0,0>,<-1.5,-20,-10>}
            }
            difference{
                BodyBot(BM_Gender,BM_Build-0.020)
                //BodyBot(BM_Gender,BM_Build-0.010)
                    cylinder{<0,0,1>,<0,-10,1>,2.5}
                    plane { y, -27.0 inverse}
                    plane { y, -27.25}
                    translate y*27.0
                    scale<1,68,1>
                    translate y*-27.0
            }
            difference{
                BodyThigh(BM_Gender,BM_Build-0.020,1)
                //BodyThigh(BM_Gender,BM_Build-0.010,1)
                plane { y, -5}
                transform R_Thigh
                transform R_Leg
            }
            difference{
                BodyThigh(BM_Gender,BM_Build-0.020,-1)
                //BodyThigh(BM_Gender,BM_Build-0.010,-1)
                plane { y, -5}
                transform L_Thigh
                transform L_Leg
            }
        }
        union{ // inside of skirt
            difference{
                //BodyBot(BM_Gender,BM_Build-0.020)
                BodyBot(BM_Gender,BM_Build-0.010)
                cylinder{<0,0,10>,<0,0,-10>,10 scale<1,.7,1> translate<0,-16,0>}
                cylinder{<0,0,1>,<0,-10,1>,2.5}
                plane { y, -27.0-0.01}
                box{<1.5,0,0>,<-1.5,-20,-10>}
            }
            difference{
                //BodyBot(BM_Gender,BM_Build-0.020)
                BodyBot(BM_Gender,BM_Build-0.010)
                    cylinder{<0,0,1>,<0,-10,1>,2.5}
                    plane { y, -27.0 inverse}
                    plane { y, -27.25}
                    translate y*27.0
                    scale<1,68,1>
                    translate y*-27.0
            }
            difference{
                //BodyThigh(BM_Gender,BM_Build-0.020,1)
                BodyThigh(BM_Gender,BM_Build-0.010,1)
                plane { y, -5}
                transform R_Thigh
                transform R_Leg
            }
            difference{
                //BodyThigh(BM_Gender,BM_Build-0.020,-1)
                BodyThigh(BM_Gender,BM_Build-0.010,-1)
                plane { y, -5}
                transform L_Thigh
                transform L_Leg
            }
        }
        plane { y, -34.0}
        texture{SuitTex}
    }
/*=======================================================
Here's the main macro, which puts the costume on the figure
=======================================================*/
#macro TufGirlz_Costume(TG_Layer1,TG_Layer2,TG_Layer3,TG_Layer4)
    #ifndef (BM_Pose_Title)
        #local BM_Pose_Title=array[BM_PoseNo+1]
        #local BM_Pose_Title[BM_PoseNo]="No Description"
    #end
    #if (BM_PoseNo >= 0)
        #warning concat("Tuf Girlz Costume Selections:\nPose No. ",
        str(BM_PoseNo,2,0),": ",BM_Pose_Title[BM_PoseNo],":\n")
    #else
        #warning concat("Tuf Girlz Costume Selections:\nPose No. ",
        str(BM_PoseNo,2,0),": No Pose Selected:\n")
    #end    
    #switch (TG_Layer1)
        #case (1)
            #warning "  Bra, Panties,\n"
            #local TG_Bra=1;
            #local TG_Panties=1;
            #local TG_Stockings=0;
            #local TG_Boobtube=0;
            #local TG_Shorts=0;
            #local TG_Swimsuit=0;
        #break
        #case (2)
            #warning "  Panties, Stockings,\n"
            #local TG_Bra=0;
            #local TG_Panties=1;
            #local TG_Stockings=1;
            #local TG_Boobtube=0;
            #local TG_Shorts=0;
            #local TG_Swimsuit=0;
        #break
        #case (3)
            #warning "  Panties,\n"
            #local TG_Bra=0;
            #local TG_Panties=1;
            #local TG_Stockings=0;
            #local TG_Boobtube=0;
            #local TG_Shorts=0;
            #local TG_Swimsuit=0;
        #break
        #case (4)
            #warning "  Lycra Shorts, Boobtube,\n"
            #local TG_Bra=0;
            #local TG_Panties=0;
            #local TG_Stockings=0;
            #local TG_Boobtube=1;
            #local TG_Shorts=1;
            #local TG_Swimsuit=0;
        #break
        #case (5)
            #warning "  Lycra Shorts,\n"
            #local TG_Bra=0;
            #local TG_Panties=0;
            #local TG_Stockings=0;
            #local TG_Boobtube=0;
            #local TG_Shorts=1;
            #local TG_Swimsuit=0;
        #break
        #case (6)
            #warning "  Swimsuit,\n"
            #local TG_Bra=0;
            #local TG_Panties=0;
            #local TG_Stockings=0;
            #local TG_Boobtube=0;
            #local TG_Shorts=0;
            #local TG_Swimsuit=1;
        #break
        #case (7)
            #warning "  Bra, Shorts,\n"
            #local TG_Bra=1;
            #local TG_Panties=0;
            #local TG_Stockings=0;
            #local TG_Boobtube=0;
            #local TG_Shorts=1;
            #local TG_Swimsuit=0;
        #break
        #case (8)
            #warning "  Boobtube, Panties,\n"
            #local TG_Bra=0;
            #local TG_Panties=1;
            #local TG_Stockings=0;
            #local TG_Boobtube=1;
            #local TG_Shorts=0;
            #local TG_Swimsuit=0;
        #break
        #case (9)
            #warning "  No underwear,\n"
            #local TG_Bra=0;
            #local TG_Panties=0;
            #local TG_Stockings=0;
            #local TG_Boobtube=0;
            #local TG_Shorts=0;
            #local TG_Swimsuit=0;
        #break
        #else
            #warning "  Bra, Panties, Stockings,\n"
            #local TG_Bra=1;
            #local TG_Panties=1;
            #local TG_Stockings=1;
            #local TG_Boobtube=0;
            #local TG_Shorts=0;
            #local TG_Swimsuit=0;
    #end
    #switch (TG_Layer2)
        #case (1)
            #warning "  Croptop,\n"
            #local TG_Dresstop=0;
            #local TG_Croptop=1;
        #break
        #case (9)
            #warning "  No Top,\n"
            #local TG_Dresstop=0;
            #local TG_Croptop=0;
        #break
        #else
            #warning "  Blouse,\n"
            #local TG_Dresstop=1;
            #local TG_Croptop=0;
    #end    
    #switch (TG_Layer3)
        #case (1)
            #warning "  Miniskirt,\n"
            #local TG_Suittop=0;
            #local TG_Suitbot=0;
            #local TG_Miniskirt=1;
        #break
        #case (2)
            #warning "  Jacket, Trousers,\n"
            #local TG_Suittop=1;
            #local TG_Suitbot=0;
            #local TG_Miniskirt=1;
        #break
        #case (3)
            #warning "  Trousers,\n"
            #local TG_Suittop=0;
            #local TG_Suitbot=1;
            #local TG_Miniskirt=0;
        #break
        #case (4)
            #warning "  Jacket,\n"
            #local TG_Suittop=1;
            #local TG_Suitbot=0;
            #local TG_Miniskirt=0;
        #break
        #case (9)
            #warning "  No Suit,\n"
            #local TG_Suittop=0;
            #local TG_Suitbot=0;
            #local TG_Miniskirt=0;
        #break
        #else
            #warning "  Jacket, Miniskirt,\n"
            #local TG_Suittop=1;
            #local TG_Suitbot=0;
            #local TG_Miniskirt=1;
    #end    
    #switch (TG_Layer4)
        #case (9)
            #warning "  No Shoes,\n"
            #local TG_Shoes=0;
        #break
        #else
            #warning "  High Heels,\n"
            #local TG_Shoes=1;
    #end    

#declare BM_Head_Object=object{BM_nul}
#declare BM_Neck_Object=object{BM_nul}   
#declare BM_Torso_Object=object{BM_nul}
#declare BM_Abdomen_Object=object{BM_nul}
#declare BM_Upperarm_R_Object=object{BM_nul}
#declare BM_Upperarm_L_Object=object{BM_nul}
#declare BM_Forearm_R_Object=object{BM_nul}
#declare BM_Forearm_L_Object=object{BM_nul}
#declare BM_Hand_R_Object=object{BM_nul}
#declare BM_Hand_L_Object=object{BM_nul}
#declare BM_Thigh_R_Object=object{BM_nul}
#declare BM_Thigh_L_Object=object{BM_nul}
#declare BM_Calf_R_Object=object{BM_nul}
#declare BM_Calf_L_Object=object{BM_nul}
#declare BM_Foot_R_Object=object{BM_nul}
#declare BM_Foot_L_Object=object{BM_nul}

#declare BM_Head_Object=
    union{
        object{BM_Head_Object}
        object{Specs rotate x*-30 translate <0,-2,-4.5>}
        object {BM_nul}
        }
//#declare BM_Neck_Object=object{BM_Neck_Object}
#declare BM_Torso_Object=
    union{
        object{BM_Torso_Object}
        #if (TG_Bra=1)
            object{Bra}
        #end
        #if (TG_Boobtube=1)
            object{Boobtube}
        #end
        #if (TG_Swimsuit=1)
            object{Swimtop}
        #end    
        #if (TG_Dresstop=1)
            object{Dresstop}
        #end
        #if (TG_Croptop=1)
            object{Croptop}
        #end
        #if (TG_Suittop=1)
            object{Suittop}
        #end
        object {BM_nul}
        }
#declare BM_Abdomen_Object=
    union{
        object{BM_Abdomen_Object}
        #if (TG_Panties=1)
            object{Panties}
        #end
        #if (TG_Swimsuit=1)
            object{Swimbot}
        #end
        #if (TG_Shorts=1)
            object{Shortbot}
        #end
        #if (TG_Dresstop=1)
            object{Dressbot}
        #end
        #if (TG_Suitbot=1)
            object{Suitbot}
        #end
        #if (TG_Miniskirt=1)
            object{Minibot}
        #end
        object {BM_nul}
        }
#declare BM_Upperarm_R_Object=
    union{
        object{BM_Upperarm_R_Object}
        #if (TG_Dresstop=1)
            object{DressRUAL}
        #end
        #if (TG_Croptop=1)
            object{DressRUA}
        #end
        #if (TG_Suittop=1)
            object{SuitRUA}
        #end
        object {BM_nul}
        }
#declare BM_Upperarm_L_Object=
    union{
        object{BM_Upperarm_L_Object}
        #if (TG_Dresstop=1)
            object{DressLUAL}
        #end
        #if (TG_Croptop=1)
            object{DressLUA}
        #end
        #if (TG_Suittop=1)
            object{SuitLUA}
        #end
        object {BM_nul}
        }
#declare BM_Forearm_R_Object=
    union{
        object {BM_Forearm_R_Object}
        #if (TG_Dresstop=1)
            object{DressRFA}
        #end
        #if (TG_Suittop=1)
            object{SuitRFA}
        #end
        object {BM_nul}
        }
#declare BM_Forearm_L_Object=
    union{
        object {BM_Forearm_L_Object}
        #if (TG_Dresstop=1)
            object{DressLFA}
        #end
        #if (TG_Suittop=1)
            object{SuitLFA}
        #end
        object {BM_nul}
        }
//#declare BM_Hand_R_Object=object {BM_Hand_R_Object}
//#declare BM_Hand_L_Object=object {BM_Hand_L_Object}
#declare BM_Thigh_R_Object=
    union{
        object {BM_Thigh_R_Object}
        #if (TG_Stockings=1)
            object{StockingRT}
        #end
        #if (TG_Shorts=1)
            object{ShortRT}
        #end
        #if (TG_Suitbot=1)
            object{SuitRT}
        #end
        object {BM_nul}
        }
#declare BM_Thigh_L_Object=
    union{
        object {BM_Thigh_L_Object}
        #if (TG_Stockings=1)
            object{StockingLT}
        #end
        #if (TG_Shorts=1)
            object{ShortLT}
        #end
        #if (TG_Suitbot=1)
            object{SuitLT}
        #end
        object {BM_nul}
        }
#declare BM_Calf_R_Object=
    union{
        object {BM_Calf_R_Object}
        #if (TG_Stockings=1)
            object{StockingRS}
        #end
        #if (TG_Suitbot=1)
            object{SuitRS}
        #end
        object {BM_nul}
        }
#declare BM_Calf_L_Object=
    union{
        object {BM_Calf_L_Object}
        #if (TG_Stockings=1)
            object{StockingLS}
        #end
        #if (TG_Suitbot=1)
            object{SuitLS}
        #end
        object {BM_nul}
        }
#declare BM_Foot_R_Object=
    union{
        object {BM_Foot_R_Object}
        #if (TG_Stockings=1)
            object{StockingRF}
        #end
        #if (TG_Shoes=1)
            object{BootRF}
        #end
        object {BM_nul}
        }
#declare BM_Foot_L_Object=
    union{
        object {BM_Foot_L_Object}
        #if (TG_Stockings=1)
            object{StockingLF}
        #end
        #if (TG_Shoes=1)
            object{BootLF}
        #end
        object {BM_nul}
        }

#end // end of selection macro
// End of Costume Definition File
