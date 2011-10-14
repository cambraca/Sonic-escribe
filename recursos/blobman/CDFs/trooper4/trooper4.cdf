/*******************************************************
     POV-Ray - Blob_Man Costume Definition File
 File Name : trooper4.cdf
 BM_Version: 4.0+
 Desciption: Costume Definition File - Stormtrooper
 Date      : April 2000
 Author    : Peter Houston 
 Email     : houston.graphics@iname.com 
 WWW       : http://welcome.to/HoustonGraphics 

Notes :
    This CDF only works for Male Figures.
    
  
    The Boots do not sit on y0 so if you transform
    the figure using the Foot or Toe Origins you will need 
    to add the following translation after the 
    transformation
    
        translate <0,1,0>*BM_Scale 
    
    The Toes of the Boot will bend to match the Toe Angle
    however you need to specify the Toe Angle before the 
    CDF is called, even if you are using arrays.
    
        #declare BM_Toe_Angle=<0,0,0>;
    
    Use the Default Hand Position 10 in "bm_hands.inc" to hold
    the blaster.

    If you do not want the figure to hold the blaster then
    declare the following before the CDF is called.
         
        #decalre Blaster=0;

    By default the figure holds the blaster in his right hand
    use the following to change the defaults.
 
        #declare RHand=1; //1 - Blaster, 0 - No Blaster
        #decalre LHand=0; //1 - Blaster, 0 - No Blaster

    If both RHand & LHand are set to 1 the figure will hold 2
    blasters.

    Use the Default Hand Position 10 in "bm_hands.inc" to hold
    the blaster.

********************************************************/

// Note if Both RHand and LHand =1 then the figure will
// hold two blasters.

// Use the Default Hand Position 10 in "bm_hands.inc" to hold
// the blaster.

#ifndef (Blaster) #declare Blaster=1; #end  // Set blaster on.
#ifndef (RHand) #declare RHand=1; #end //Set Handedness
#ifndef (LHand) #declare LHand=0; #end //Set Handedness

/********************************************************
  Image Maps & Textures
********************************************************/


#include "metals.inc"
#declare Plastoid_White= 
    texture {
        pigment {rgb 1}
        finish {specular .09 roughness .05}
    }
#declare Plastoid_Black= 
    texture {
        pigment {rgb 0}
        finish {specular .09 roughness .05}
    }    
#declare BM_Skin_Tex = texture { 
                        pigment {rgb .05}
                    }

#declare BM_Map_Finish = finish {specular .09 roughness .05}

#declare BM_Foot_R_IMap     = "white.png"
#declare BM_Foot_L_IMap     = "white.png"


/********************************************************
  Body Part Options
********************************************************/
#declare BM_Head_Mass=0;
#declare BM_R_Foot=0;
#declare BM_L_Foot=0;
#declare BM_Flex=0;
#declare BM_Nails=0;

/********************************************************
  Body Part Objects
********************************************************/
#declare Head_Effector=
    difference {
        union {
            sphere {<0,0,0>4.8 scale <1,.5,1>  clipped_by {plane {y,0 inverse}} bounded_by {sphere {<0,0,0>4.8 scale <1,.5,1>}} translate y*2}
            cone {<0,0,0>4.8<0,-1,0>5 bounded_by {cylinder {<0,0,0><0,-1,0>5}} translate y*2 clipped_by {plane {z,1}}}
            cylinder {<0,0,0><0,-6,0>4.8 translate y*2 clipped_by {plane {z,0 inverse}} bounded_by {cylinder {<0,0,0><0,-6,0>4.8 translate y*2}}}
            superellipsoid {<.7,.3> scale <4.4,4.4,5> rotate z*45 rotate x*100 translate <0,-2.2,0> clipped_by {plane {z,0}} clipped_by {plane {y,-4 inverse}}}
            torus {4.3,1.5 translate y*-4 clipped_by {plane {z,0 inverse}}}
            torus {4.3,1.5 rotate x*-15 translate y*-4 clipped_by {plane {z,0}}}
            cone {<0,1,-3>1.5<0,-6,-3>3 bounded_by {cylinder {<0,1,-3><0,-6,-3>3}} clipped_by {plane {y,-4 inverse}}}
        }
        plane {y,0 rotate x*60 translate z*-7}
        difference {
            sphere {0,2 scale <1,2,.5> rotate x*-30 translate <0,-6.5,-3.5> }
            plane {y,0 rotate x*60 translate z*-6.5 inverse}
            bounded_by {sphere {0,2 scale <1,2,.5> rotate x*-30 translate <0,-6.5,-3.5> }}
        }
        sphere {0,1 translate <-2.5,-5,-3.5>}
        sphere {0,1 translate < 2.5,-5,-3.5>}
    }

#declare Mouth=
difference {
    sphere {0,7
        translate z*-2
        translate y*-3
    }
    plane {y,0 
        rotate x*7 
        rotate x*30
        inverse 
        translate z*-2
        translate y*-3
    }
    plane {y,0 
        rotate x*-7 
        rotate x*25
        translate z*-2
        translate y*-2.75
    }
    object {Head_Effector
        translate z*.25
        pigment {
            gradient x
            pigment_map {
                [0.00 rgb 0.5]
                [0.65 rgb 0.5]
                [0.65 rgb 0.0]
                [1.00 rgb 0.5]
            }
        }        
    }
    bounded_by {sphere {<0,-3,-2>,7}}
}

#declare Eye=
difference {
    cylinder {<0,0,0><0,0,-10>1.35
        scale <2,1,1>
        rotate z*35
    }
    plane {y,0 inverse}
    translate x*-2
    texture {Plastoid_Black}
}

#declare Eye_Decor=
difference {
    difference {
        cylinder {<0,0,0><0,0,-10>1.8}
        cylinder {<0,0,0><0,0,-10>1.65}
        scale <1.85,1.25,1>
        rotate z*35
    }
    plane {y,0 inverse rotate z*20}
    plane {y,0         rotate z*45}
    translate x*-2
    pigment {rgb .45}
}

#declare Eyes=
union {
    intersection {
        union {
            object {Eye translate <0,1.5,0>}
            object {Eye translate <0,1.5,0> scale <-1,1,1>}
        }
        union {
            cone {<0,0,0>4.8<0,-6,0>5.2 bounded_by {cylinder {<0,0,0><0,-6,0>5.2}} translate y*2}
            superellipsoid {<.7,.3> scale <4.4,4.4,5> rotate z*45 rotate x*100 translate <0,-2.2,0>}
            cylinder {<0,0,0><0,-6,0>4.8 translate y*2}
        }
        texture {Plastoid_Black}
    }
    intersection {
        union {
            object {Eye_Decor translate <0,1.5,0>}
            object {Eye_Decor translate <0,1.5,0> scale <-1,1,1>}
        }
        union {
            cone {<0,0,0>4.8<0,-6,0>5.2 bounded_by {cylinder {<0,0,0><0,-6,0>5.2}} translate y*2}
            superellipsoid {<.7,.3> scale <4.4,4.4,5> rotate z*45 rotate x*100 translate <0,-2.2,0>}
            cylinder {<0,0,0><0,-6,0>4.8 translate y*2}
        }
        pigment {rgb .45}
    }    
    intersection {
        cone {<0,.75,0>1<0,0,0>2 bounded_by {cylinder {<0,.75,0><0,0,0>2}} translate <0,2,-2> scale <9,1,1>}    
        sphere {<0,0,0>4.801 scale <1,.5,1> translate y*2}
        translate x*.2
        pigment {rgb .45}
    }
    intersection {
        cone {<0,.75,0>1<0,0,0>2 bounded_by {cylinder {<0,.75,0><0,0,0>2}} translate <0,2,-2> scale <9,1,1>}    
        sphere {<0,0,0>4.801 scale <1,.5,1> translate y*2}
        translate x*-.2
        pigment {rgb .45}
    }
    intersection {
        cone {<0,.75,0>1<0,0,0>2 bounded_by {cylinder {<0,.75,0><0,0,0>2}} translate <0,2,-2> scale <9,1,.5>}    
        sphere {<0,0,0>4.801 scale <1,.5,1> translate y*2}
        translate x*-.3
        rotate y*-75
        pigment {rgb .45}
    }
    intersection {
        cone {<0,.75,0>1<0,0,0>2 bounded_by {cylinder {<0,.75,0><0,0,0>2}} translate <0,2,-2> scale <9,1,.5>}    
        sphere {<0,0,0>4.801 scale <1,.5,1> translate y*2}
        translate x*.3
        rotate y*75
        pigment {rgb .45}
    }    
}    

#declare Grill=
difference {
    union {
    #declare Loop=0;
    #while (Loop<8*6)
        cylinder {<0,0,0><0,0,-.2>1.5 translate <-4.3,0,0> rotate y*-Loop}
        cylinder {<0,0,0><0,0,-.2>1.5 translate < 4.3,0,0> rotate y*Loop}
        #declare Loop=Loop+8;
    #end          
    translate y*.75
    }
    torus {4,1.3}
}    
            
#declare Pouch=box {<1,0,-.5><-1,3,.5>
                    scale <1,1,2.5>
               }
    
#declare ChestPlate=
difference {
    box {<-1,-1,-1><1,1,1>
         rotate x*25
         scale <7,4,2>
    }
    plane {z,-.5 inverse rotate x*-10}                   
    plane {z,0 rotate y*30 rotate z*20 translate <-3,0,0>}
    plane {x,0 rotate y*30 rotate z*15 translate <6,0,0> inverse}
    bounded_by{box {<-1,-1,-1><1,1,1> rotate x*25 scale <7,4,2>}}
    rotate x*10
    scale <1,1,.75>
}

#declare Hex=                            
prism {
    linear_sweep
    linear_spline
    -.5,
    .5,
    7,
    <3,5>, <-3,5>, <-5,0>, <-3,-5>, <3, -5>, <5,0>, <3,5>
}

#declare ShoeGrip=texture {Plastoid_Black}

#declare Heavy_Blaster=
union {
    cylinder {<-9,0,0><5,0,0>.6}
    cylinder {<-8.5,0,0><-1.5,0,0>1}
    torus {.5,.25 scale <1,.25,1> rotate x*90 translate <-8,.8,0>}
    superellipsoid {<.5,.5> 
        scale .65 
        translate <4.5,0,0>
    }              
    union {
        cylinder {<-1.5,0,0><0,0,0>.6 translate <0,-.2,0>}
        cylinder {<-.1,0,0><.5,0,0>.3}
        cone {<.25,0,0>.3,<1.35,-.2,0>.6 bounded_by {cylinder{<.25,0,0><1.35,-.2,0>.6}}}
        cylinder {<1.25,-.2,0><2.5,-.2,0>.6}
        superellipsoid {<.1,.1> scale <.25,3,.6> translate <.5,-2.5,0>}
        translate <1,2.5,0>
    }
    cylinder {<0,0,0><0,-1,0>1 scale <1.5,1,.6> translate <2,0,0>}
    #declare Loop=0;
    #while (Loop<180)
        torus {1,.25 
            scale <3,1,1>
            translate <-5.5,0,0>
            rotate x*Loop
        }
        #declare Loop=Loop+30;
    #end
    torus {1,.1 
        rotate x*90
        translate <-.5,-2,0>
    }
    cylinder {<0,0,0><0,-.75,0>.1 translate <-.5,-2,0>}    
    superellipsoid {<.1,.1>
        scale <1.2,1,1>
        translate <-1.5,0,0>
    }
    superellipsoid {<.1,.1>
        scale <5,.5,.6>
        translate <-2.5,-1.5,0>
    }
    superellipsoid {<.1,.1>
        scale <2,.5,.6>
        translate <1,1,0>
    }
    superellipsoid {<.1,.1>
        scale <1,.45,1.35>
        translate <0,0,-.75>
        rotate x*-15
    }
    superellipsoid {<.5,.5>
        scale <.75,3.5,.6>
        translate y*-3.5
        rotate z*15  
    }
    texture {T_Chrome_1B}
}

#declare BM_Head_Object=union {
                        object{BM_Head_Object}
                        difference {
                            union {
                                sphere {<0,0,0>4.8 scale <1,.5,1>  clipped_by {plane {y,0 inverse}} translate y*2}
                                cone {<0,0,0>4.8<0,-1,0>5  bounded_by {cylinder{<0,.1,0><0,-1.1,0>5.1}} translate y*2 clipped_by {plane {z,1}} pigment {rgb .15}}
                                cylinder {<0,0,0><0,-6,0>4.8 bounded_by {cylinder {<0,0,0><0,-6,0>4.8}} translate y*2 clipped_by {plane {z,0 inverse}}}
                                superellipsoid {<.7,.3> scale <4.4,4.4,5> rotate z*45 rotate x*100 translate <0,-2.2,0> clipped_by {plane {z,0}} clipped_by {plane {y,-4 inverse}}}
                                torus {4.3,1.5 translate y*-4 clipped_by {plane {z,0 inverse}}}
                                difference {
                                    torus {4.3,1.5 rotate x*-15 translate y*-4 clipped_by {plane {z,0 }}}
                                    object {Grill rotate x*-15 translate y*-4 pigment {rgb .45}}
                                }                                                             
                                cone {<0,1,-3>1.5<0,-6,-3>3  bounded_by {cylinder{<0,1,-3><0,-6,-3>3}} clipped_by {plane {y,-4 inverse}}}
                            }
                            plane {y,0 rotate x*60 translate z*-7}
                            difference {
                                sphere {0,2 scale <1,2,.5> rotate x*-30 translate <0,-6.5,-3.5> }
                                plane {y,0 rotate x*60 translate z*-6.5 inverse}
                            }
                            sphere {0,1 translate <-2.5,-5,-3.5>}
                            sphere {0,1 translate < 2.5,-5,-3.5>}
                            object {Mouth translate z*-.1}
                        }
                        
                        difference {
                            union {
                                cone {<0,0,0>4.8<0,-6,0>5.2 bounded_by {cylinder {<0,0,0><0,-6,0>5.2}} translate y*2 clipped_by {plane {z,0 inverse}}}
                                torus {4.3,1.7 translate y*-4}
                            }
                            plane {y,0 rotate x*60}
                        }                
                        cylinder {<0,0,1><0,0,-.5>.6 rotate x*-15 rotate y*-15 translate <-2.5,-5.25,-3.5> pigment {rgb .3}}
                        cylinder {<0,0,1><0,0,-.5>.6 rotate x*-15 rotate y*15 translate < 2.5,-5.25,-3.5> pigment {rgb .3}}  
                        union {
                            cylinder {<0,0,-1><0,0,-4>.25}
                            cylinder {<-.5,0,-1><-.5,0,-3.75>.25}
                            cylinder {< .5,0,-1>< .5,0,-3.75>.25}
                            cylinder {<-1,0,-1><-1,0,-3.25>.25}
                            cylinder {< 1,0,-1>< 1,0,-3.25>.25}

                             rotate x*60 
                             translate z*-2.5 
                             translate y*-7 
                             pigment {rgb 0}
                        }
                        object {Eyes translate <0,0,.5>}
                        scale <1,1.1,1>
                        translate <0,2,-1>
                        texture {Plastoid_White}
                        
                     }

#declare BM_Abdomen_Object=union {
                        object {BM_Abdomen_Object}
                        union {  // Belt
                            cylinder {<0,0,0><0,3,0>7}
                            #declare Loop=60;
                            #while (Loop<300)
                                object {Pouch                                    
                                    translate <7,0,0>  
                                    rotate y*-60
                                    rotate y*Loop                   
                                }
                                #declare Loop=Loop+30;
                            #end                         
                            translate y*-25
                            scale <1.05,1,.65>
                            translate z*-.3
                        }
                        
                        difference { //Thermal Detonator at back of Belt
                            union {
                                cylinder {<-3,0,0><3,0,0>1.5}
                                cylinder {<-2.25,0,0><-1.5,0,0>1.55 texture {Plastoid_Black}}
                                cylinder {<2.25,0,0><1.5,0,0>1.55 texture {Plastoid_Black}}
                                #declare Loop=-1;
                                    #while (Loop<2)
                                    box {<-.25,-.25,-.25><.25,.25,.25> translate <Loop,0,1.5> rotate x*-30}
                                    #declare Loop=Loop+1;
                                #end
                                box {<-.5,-.25,-.25><.5,.25,.25> translate <.75,0,1.5>}
                            }
                            sphere {<-3.5,0,0>1.4}
                            sphere {< 3.5,0,0>1.4}
                            translate z*5.5
                            translate y*-23.5
                        }
                        
                        // Abdoman Plate - Front
                        cone {<0,2.9,0>7<0,9,-.1>6.9
                            translate y*-25
                            scale <1.05,1,.65>
                            translate z*-.3
                        }         

                        union { //Abdoman Plate - Front Detail
                            box {<-2,0,-.5><2,5,0>}
                            sphere {<.5,1,-.5>.3 texture {Plastoid_Black}}
                            sphere {<.5,2,-.5>.3 texture {Plastoid_Black}}
                            sphere {<.5,3,-.5>.3 texture {Plastoid_Black}}
                            sphere {<.5,4,-.5>.3 texture {Plastoid_Black}}
                            union {
                                cylinder {<0,0,0><0,8,0>.5                                    
                                    translate <7,0,0>  
                                    rotate y*135
                                }
                                cylinder {<0,0,0><0,8,0>.5                                   
                                    translate <7,0,0>  
                                    rotate y*40
                                }      
                                torus {7,.25 translate y*3 
                                    clipped_by {plane {z,0}}
                                    clipped_by {plane {x,5}}
                                }
                                scale <1.05,1,.65>
                                translate z*5
                            }
                            scale <1,.5,1>
                            translate <0,-22,-4.9>
                        }
                        
                        difference {
                            intersection { // Pelvis/Buttock Guard
                                union {
                                    torus {5,4 rotate x*10 scale <1.05,1,.65> translate y*3}
                                    torus {5,3 rotate z*90 scale <1,1,.75>}
                                    torus {5,3 rotate z*90 scale <1,1,.75> translate y*5 rotate z*20 translate y*-5}
                                    torus {5,3 rotate z*90 scale <1,1,.75> translate y*5 rotate z*-20 translate y*-5}
                                }
                                cone {<0,-10,0>7.5<0,10,0>6.5 bounded_by {cylinder {<0,-10,0><0,10,0>7.5}}
                                    scale <1.05,1,.85>
                                    translate z*.4
                                }           
                                plane {y,3}
                                plane {z,5.5 rotate x*-15 translate y*-1.44}

                            }
                            sphere {0,6 translate <8,-4,-1> }
                            sphere {0,6 translate <-8,-4,-1>}
                            translate <0,-28,0>                    
                        }
                        cylinder {<0,0,.5><0,-5.5,.5>.5 translate <0,-25,-5.5>}
                        texture {Plastoid_White}
                    }    


#declare BM_Torso_Object=union {
                        object{BM_Torso_Object}
                        
                        
                        difference { // Chest Plate
                            union {
                                cone{<-7,-10,1>3.5<-1.,-10,.5>,5 bounded_by {cylinder{<-7,-10,1><-1,-10,.5>5}}scale <1,1,1.1>}
                                cone{< 7,-10,1>3.5< 1.,-10,.5>,5 bounded_by {cylinder{< 7,-10,1><-1,-10,.5>5}}scale <1,1,1.1>}
                                cylinder {<-2,-10,.5>< 2,-10,.5> 5 scale <1,1,1.1>}
                                cone { <0,-.1,-.5>7.51<0,8,1.5>9 bounded_by {cylinder {<0,-.1,-.5><0,8,1.5>9}}
                                    translate y*-19
                                    scale <1,1,.65>
                                    translate z*-.45
                                    clipped_by {plane {y,-18 inverse}}
                                }
                                sphere {0,9
                                    scale <1,.5,1>
                                    translate <0,-12,1.5>
                                    scale <1,1,.62>
                                    translate z*-.3
                                    clipped_by {plane {y,-18 inverse}}
                                }
                                union {  // Back Plate Detail
                                    box{<-4, 3,.5>< 4, -3,-1> }
                                    cylinder {<-4, 3,0>< 4, 3,0>1}
                                    cylinder {<-4,-3,0>< 4,-3,0>1}
                                    cylinder {<-4, 3,0><-4,-3,0>1}
                                    cylinder {< 4, 3,0>< 4,-3,0>1}
                                    sphere {<-4, 3,0>1}
                                    sphere {< 4, 3,0>1}
                                    sphere {<-4,-3,0>1}
                                    sphere {< 4,-3,0>1}
                                    torus {1.25,.5 rotate x*90 translate <1.25,0,.25>}
                                    cylinder {<-1.25, 1.75,.25><-1.25,-1.75,.25>.5}
                                    cylinder {<-2.5, 1.75,.25><-2.5,-1.75,.25>.5 }
                                    translate z*5
                                    rotate x*5
                                    translate <0,-12,.75>
                                }
                                object {ChestPlate translate < 0,-12,-4>}
                                object {ChestPlate scale <-1,1,1> translate <0,-12,-4>}
                            }
                            cylinder {<0,0,-20><0,0,20> 5 scale <.5,1,1> translate <-9,-10,0>}
                            cylinder {<0,0,-20><0,0,20> 5 scale <.5,1,1> translate < 9,-10,0>}
                            
                        }               
                        texture {Plastoid_White}
                    }
                      
#declare BM_Upperarm_R_Object=union {
                                object {BM_Upperarm_R_Object}
                                difference {
                                    sphere {<0,0,0>5 scale <1,2,1>}
                                    sphere {<0,0,0>4.5 scale <1,2,1>}
                                    plane {y,0}
                                    plane {x,1 inverse}
                                    translate <0,-5,0>
                                }    
                                cone {<-.5,0,-.5>3.25<0,-6,0>2.5 bounded_by {cylinder{<-.5,0,-.5><0,-6,0>3.25}} translate y*-5}
                                cylinder {<-3.75,0,-.5><-2.5,-6,0>.5 translate y*-5}
                                texture {Plastoid_White}
                           }
                           
#declare BM_Upperarm_L_Object=union {
                                object {BM_Upperarm_L_Object}
                                difference {
                                    sphere {<0,0,0>5 scale <1,2,1> }
                                    sphere {<0,0,0>4.5 scale <1,2,1> }
                                    plane {y,0}
                                    plane {x,1 inverse}
                                    translate <0,-5,0>
                                }    
                                cone {<-.5,0,-.5>3.25<0,-6,0>2.5 bounded_by {cylinder {<-.5,0,-.5><0,-6,0>3.25}} translate y*-5}
                                cylinder {<-3.75,0,-.5><-2.5,-6,0>.5 translate y*-5}
                                scale <-1,1,1>
                                texture {Plastoid_White}
                           }
                           
#declare BM_Forearm_R_Object=union {
                                object {BM_Forearm_R_Object}
                                cone {<0,0,0>2.8<0,-10,0>1.75 bounded_by {cylinder {<0,0,0><0,-10,0>2.8}}}
                                difference {
                                    box {<-.5,0,-.5><.5,-10,.5>}
                                    #declare Loop=1;
                                    #while (Loop<10)
                                        sphere {<-.5,-Loop,0>.3 scale <1,1,1.5>}
                                        #declare Loop=Loop+1;
                                    #end
                                    rotate z*7
                                    translate <-2.6,0,0>
                                }
                                texture {Plastoid_White}
                           }
                                
                                
#declare BM_Forearm_L_Object=union {
                                object {BM_Forearm_L_Object}
                                cone {<0,0,0>2.8<0,-10,0>1.75 bounded_by {cylinder {<0,0,0><0,-10,0>2.8}}}
                                difference {
                                    box {<-.5,0,-.5><.5,-10,.5>}
                                    #declare Loop=1;
                                    #while (Loop<10)
                                        sphere {<-.5,-Loop,0>.3 scale <1,1,1.5>}
                                        #declare Loop=Loop+1;
                                    #end
                                    rotate z*7
                                    translate <-2.6,0,0>
                                }
                                scale <-1,1,1>
                                texture {Plastoid_White}
                           }
#declare BM_Hand_R_Object=union {
                            object {BM_Hand_R_Object}
                            sphere {0,2.5 scale <.25,.8,.6> clipped_by {plane {x,0}} rotate z*-5 translate <-.8,-2,.2>}
                            #if (RHand)
                                #if (Blaster)    
                                    object {Heavy_Blaster
                                            rotate z*80
                                            rotate y*-90
                                            rotate x*-7.5
                                            translate <1,-3,-3.5>
                                    }
                                #end
                            #end
                            texture {Plastoid_White}
                       }
                            
#declare BM_Hand_L_Object=union {
                            object {BM_Hand_L_Object}
                            sphere {0,2.5 scale <.25,.8,.6> clipped_by {plane {x,0}} rotate z*-5 translate <-.8,-2,.2> scale <-1,1,1>}
                            #if (LHand)
                                #if (Blaster)    
                                    object {Heavy_Blaster
                                            rotate z*80
                                            rotate y*-90
                                            rotate x*-7.5
                                            translate <-1,-3,-3.5>
                                    }
                                #end
                            #end
                            texture {Plastoid_White}
                       }
                       
#declare BM_Thigh_R_Object=union {
                            object {BM_Thigh_R_Object}
                            difference {
                                union {
                                    cone {<-2.5,2,0>5<0,-14,-.5>3.5 bounded_by {cylinder {<-2.5,2,0><0,-14,-.5>4.5}}}
                                    cylinder {<-2.5,1.5,-3.5><0,-14,-3.65> 1}
                                }
                                cylinder {<0,0,-7><0,0,7> 7.5 scale <2,1,1> translate <7.5,3,0>}
                                sphere {<0,-14,3.5>3.75 scale <1,1.1,1>}
                            }
                            union {
                                #declare Loop=0;
                                #while (Loop<=180)    
                                    cylinder {<-3.5,0,0><-3.5,2,0>1 rotate y*-Loop}
                                    #declare Loop=Loop+30;
                                #end
                                rotate z*5
                                translate y*-15
                            }
                            texture {Plastoid_White}
                       }
                            
#declare BM_Thigh_L_Object=union {
                            object {BM_Thigh_L_Object}
                            difference {
                                union {
                                    cone {<-2.5,2,0>5<0,-14,-.5>3.5 bounded_by {cylinder {<-2.5,2,0><0,-14,-.5>4.5}}}
                                    cylinder {<-2.5,1.5,-3.5><0,-14,-3.65> 1}
                                    torus {3,1 rotate z*5 translate <0,-14,0>}
                                }
                                cylinder {<0,0,-7><0,0,7> 7.5 scale <2,1,1> translate <7.5,3,0>}
                                sphere {<0,-14,3.5>3.75 scale <1,1.1,1>}                                                                    
                            }
                            scale <-1,1,1>
                            texture {Plastoid_White}
                       }
#declare BM_Calf_R_Object=union {
                            object {BM_Calf_R_Object}
                            difference {
                                union {
                                    cone {<0,1,1>4.15<0,-18,0>2.25 bounded_by {cylinder {<0,1,1><0,-18,0>4.15}}}
                                    cylinder {<0,1.5,-3.35><0,-18,-1.75> 1}
                                }                                           
                                plane {y,-1.5 inverse rotate x*10}
                            }
                            
                            texture {Plastoid_White}
                       }
                            

#declare BM_Calf_L_Object=union {
                            object {BM_Calf_L_Object}
                            difference {
                                union {
                                    cone {<0,1,1>4.15<0,-18,0>2.25 bounded_by {cylinder {<0,1,1><0,-18,0>4.15}}}
                                    cylinder {<0,1.5,-3.35><0,-18,-1.75> 1}
                                }                                           
                                plane {y,-1.5 inverse rotate x*10}
                            }
                            difference {
                                object {Hex
                                    rotate x*85
                                    scale <.5,.6,1>
                                }
                                object {Hex
                                    rotate x*85
                                    scale <.3,.4,3>
                                }                 
                                translate <0,-1,-4>
                            }
                            object {Hex
                                rotate x*85
                                scale <.5,.6,.5>
                                translate <0,-1,-4>
                            }     
                            texture {Plastoid_White}
                       }

#declare BM_Foot_R_Object=union{
                            object {BM_Foot_R_Object}
                                difference {    
                                    union { // Sole
                                        cylinder {<0,0,0><0,-.75,0> 2.2 
                                                   translate <0,-2.5,0>
                                        }
                                        cylinder {<0,0,0><0,-.75,0> 2.9 
                                                   scale <1,1,1.2>
                                                   rotate x*BM_Toe_Angle.z
                                                   translate <-.3,-2.5,-6.25> 
                                                    
                                                    clipped_by {plane {z,-6.25}}
                                        }                              
                                        prism {   linear_sweep   linear_spline 
                                            0,-0.75,5,        
                                          <-2,0>,<2,0>,<2.5,-6.25>,<-3.4,-6.25>,<-2,0>
                                          translate <0,-2.5,0>
                                        }
                                   }        
                                   box {<-4,-8,0><4,0,-8>
                                        rotate x*-14
                                        rotate y*8
                                        translate <0,-2.6,-2>
                                   }
                                   
                                   translate <0,-1,1>
                                   texture {ShoeGrip}
                               }      
                              
                               union { //Uppers
                                    union {sphere {<0,0,0>,2.65
                                           scale <1,1,1.2>}
                                     
                                            clipped_by {plane{y,0 inverse}}
                                            clipped_by {plane {z,0 rotate x*45}}                                            
                                            rotate x*BM_Toe_Angle.z 
                                            translate <-.3,-2.5,-6.25>
                                            
                                    }
                                    
                                    cone {<0,0,0>1.75,<0,-2.5,0>1.9}
                                    sphere {0,1.75}
                                    cone {<0,-.5,0>1.75,<-.3,-2.5,-6.25>2.6
                                          clipped_by {plane {y,-2.5 inverse}}
                                    }
                                    cone {<0,-2,0>1.75,<-.3,-2.5,-5.7>2.6
                                          clipped_by {plane {y,-2.5 inverse}}
                                    }
                                    translate <0,-1,1>
                               }
                               
                               texture {Plastoid_White}
                               
                            } 


                      
                            
#declare BM_Foot_L_Object=union{
                            object {BM_Foot_L_Object}
                                difference {    
                                    union { // Sole
                                        cylinder {<0,0,0><0,-.75,0> 2.2 
                                                   translate <0,-2.5,0>
                                        }
                                        cylinder {<0,0,0><0,-.75,0> 2.9 
                                                   scale <1,1,1.2>
                                                   rotate x*BM_Toe_Angle.z
                                                   translate <-.3,-2.5,-6.25> 
                                                    
                                                    clipped_by {plane {z,-6.25}}
                                        }                              
                                        prism {   linear_sweep   linear_spline 
                                            0,-0.75,5,        
                                          <-2,0>,<2,0>,<2.5,-6.25>,<-3.4,-6.25>,<-2,0>
                                          translate <0,-2.5,0>
                                        }
                                   }        
                                   box {<-4,-8,0><4,0,-8>
                                        rotate x*-14
                                        rotate y*8
                                        translate <0,-2.6,-2>
                                   }
                                   
                                   translate <0,-1,1>
                                   texture {ShoeGrip}
                               }      
                              
                               union { //Uppers
                                    union {sphere {<0,0,0>,2.65
                                           scale <1,1,1.2>}
                                     
                                            clipped_by {plane{y,0 inverse}}
                                            clipped_by {plane {z,0 rotate x*45}}                                            
                                            rotate x*BM_Toe_Angle.z 
                                            translate <-.3,-2.5,-6.25>
                                            
                                    }
                                    
                                    cone {<0,0,0>1.75,<0,-2.5,0>1.9}
                                    sphere {0,1.75}
                                    cone {<0,-.5,0>1.75,<-.3,-2.5,-6.25>2.6
                                          clipped_by {plane {y,-2.5 inverse}}
                                    }
                                    cone {<0,-2,0>1.75,<-.3,-2.5,-5.7>2.6
                                          clipped_by {plane {y,-2.5 inverse}}
                                    }
                                    translate <0,-1,1>
                               }
                               
                               texture {Plastoid_White}
                               scale <-1,1,1>
                            } 

// EOF