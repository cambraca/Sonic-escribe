/*******************************************************
     POV-Ray - Blob_Man Costume Definition File
 File Name : sample.cdf
 BM_Version: 4.0
 Desciption: Sample Costume Definition File - Astronaut
 Date      : 06 July 1999 
 Author    : Peter Houston
 Email     : houston.graphics@iname.com
 WWW       : http://welcome.to/HoustonGraphics
********************************************************/
#declare CDF=true; //Used by Body_Part_Viewer.pov Can be removed.
#include "glass.inc"

/********************************************************
  Image Maps & Textures
********************************************************/

//#declare Skin_Tex = texture {}                         
//#declare Lip_Tex  = texture {}                         
//#declare Hair_Tex = texture {}                         
//#declare Tooth_Pig= pigment {}

#declare Map_Finish = finish {phong .15 phong_size 20 }

//#declare Map_Normal = normal {}

//#declare Bump_Map_Size = 0.25;

// PNG Image Maps for Body Parts these must be in your Library Path

//#declare Face_IMap       = "filename.png"
#declare Torso_IMap      = "samp1.png"
#declare Abdomen_IMap    = "samp1.png"  
#declare Upperarm_R_IMap = "samp1.png"
#declare Upperarm_L_IMap = "samp1.png"
#declare Forearm_R_IMap  = "samp1.png"
#declare Forearm_L_IMap  = "samp1.png"
#declare Hand_R_IMap     = "samp1.png"
#declare Hand_L_IMap     = "samp1.png"
#declare Thigh_R_IMap    = "samp1.png"
#declare Thigh_L_IMap    = "samp1.png"
#declare Calf_R_IMap     = "samp1.png"
#declare Calf_L_IMap     = "samp1.png"
#declare Foot_R_IMap     = "samp1.png"
#declare Foot_L_IMap     = "samp1.png"


/********************************************************
  Body Part Options
********************************************************/

#declare BM_Nails=0;

// Ears - 2 = Normal Ears, 1=Replace ears with small lumps as if under a swimming cap, 0 = No ears
#declare BM_Ears=0;

// Eyes - 1=Normal 0=No Eyes
#declare BM_Eyes=1;

// Nose - Range : 0 - 1.25 Size of Nose
//#declare BM_Nose=.5;

// Face - 1 = Normal Face Structure, 0 = Removes Nose and Lips
#declare BM_Face=2;

// Jaw - Range: 0 - 1  0 = Closed, 1 = Open
//#declare BM_Jaw=.5;

// Teeth - 0 = No Teeth, 1 = Teeth
//#declare BM_Teeth=1;

// Jowls - Range : 0 - 3 Mass added to side of jaw.
//#declare BM_Jowls=0;

// Toes - 1 = Bare Foot with toes, 0 = Replaces toes so that foot looks like it has a sock on
#declare BM_Toes=0;

// Body Style - 0=Original Chest Modelling 1=New Chest Modelling
//#declare BM_BodyStyle=1;     
  
// Hand Scale <X,Y,Z>
//#declare BM_Hand_Scale=<1,1,1>;

// Head - 1 = Normal Head, 0 = No Head, -1 = Guides
//#declare BM_Head_Mass=1;

// Torso - 1 = Normal Torso, 0 = No Torso, -1 = Guides
//#declare BM_Torso_Mass=1;

// Right Upperarm - 2 = Muscles, 1 = Cylinders, 0 = Amputated, -1=Guide
#declare BM_R_Upperarm_Mass=1;

// Right Forearm - 2 = Muscles, 1 = Cylinders, 0 = Amputated, -1=Guide
#declare BM_R_Forearm_Mass=1;

// Right Hand - 1 = Normal, 0 = Amputated
#declare BM_R_Hand=1;

// Left Upperarm - 2 = Muscles, 1 = Cylinders, 0 = Amputated, -1=Guide
#declare BM_L_Upperarm_Mass=1;

// Left Forearm - 2 = Muscles, 1 = Cylinders, 0 = Amputated, -1=Guide
#declare BM_L_Forearm_Mass=1;

// Left Hand  - 1 = Normal, 0 = Amputated
#declare BM_L_Hand=1;

// Right Thigh - 2 = Muscles, 1 = Cylinders, 0 = Amputated, -1=Guide
#declare BM_R_Thigh_Mass=1;

// Right Calf - 2 = Muscles, 1 = Cylinders, 0 = Amputated, -1=Guide
#declare BM_R_Calf_Mass=1;

// Right Foot - 1 = Normal, 0 = Amputated
#declare BM_R_Foot=1;

// Left Thigh - 2 = Muscles, 1 = Cylinders, 0 = Amputated, -1=Guide
#declare BM_L_Thigh_Mass=1;

// Left Calf - 2 = Muscles, 1 = Cylinders, 0 = Amputated, -1=Guide
#declare BM_L_Calf_Mass=1;

// Left Foot - 1 = Normal, 0 = Amputated
#declare BM_L_Foot=1;


/********************************************************
  Body Part Objects
********************************************************/
#declare Pouch=union {  box {<1,0,0><-1,3,.5>}
                        cylinder {<1,0,.25><1,3,.25> .25}
                        cylinder {<-1,0,.25><-1,3,.25> .25}
                        cylinder {<-1,0,.25><1,0,.25> .25}
                        cylinder {<-1,3,.25><1,3,.25> .25}
                        sphere {<-1,0,.25>.25}
                        sphere {<-1,3,.25>.25}
                        sphere {< 1,0,.25>.25}
                        sphere {< 1,3,.25>.25}
                        difference {
                                        cylinder {<0,0,0><0,0,-.25>1.25 rotate x*5}
                                        plane{y,0 inverse}                    
                                        translate <0,3.25,.2> 
                        }
                        sphere {<0,2.5,-.25>.35 scale <1,1,.25> pigment {rgb 0}}
                        scale <1,1,2.5>
               }

#declare ShoeGrip=texture {pigment {rgb .15}
                           finish {Map_Finish}
                           normal {crackle 3 scale <3,1,1>}
                  }

#declare BM_Head_Object=union {
                        object{BM_Head_Object}
                        union { // Headset
                            torus {4.35,.25 
                                rotate x*90
                                clipped_by {plane {y,0 inverse}}
                            }
                            sphere{0,1 scale<1,1,1> scale <1,1.75,1.5> rotate z*5 translate<-3.5,-.85,0>}
                            sphere{0,1 scale<1,1,1> scale <1,1.75,1.5> rotate z*-5 translate<3.5,-.85,0>}
                            torus {4.25,.25 
                                clipped_by {plane {x,0}}
                                clipped_by {plane {z,0}}
                                rotate x*-40
                                translate <0,-1,-1>
                            }
                            pigment {rgb 0}
                        }
                     }

#declare BM_Torso_Object=union {
                            object{BM_Torso_Object}
                            union {
                                cone{<-7,-10,1>3.5<-1.99,-10,1>,5}
                                cone{< 7,-10,1>3.5< 1.99,-10,1>,5}
                                cylinder {<-2,-10,1>< 2,-10,1> 5 }
                            }               
                            torus {3,1 rotate z*90 translate <-7,-10,1>}
                            torus {3,1 rotate z*90 translate < 7,-10,1>}
                            superellipsoid {
                                <.5,.6>
                                scale <6,10,4>
                                translate <0,-17, 3>
                            }
                            cylinder {<0,-9,5><0,-29,4>3}
                            union {
                                cylinder {<-4,-9,5>< 4,-9,5> 3 }
                                sphere {<-4,-9,5> 3}
                                sphere {< 4,-9,5> 3}
                            }
                            union {
                                cylinder {<-4,-9,5>< 4,-9,5> 3 }
                                sphere {<-4,-9,5> 3}
                                sphere {< 4,-9,5> 3}
                                translate y*-19
                            }
                            union {
                                torus {1,.5 rotate x*90 translate <-3, 0,0>}
                                torus {1,.5 rotate x*90 translate <-3,-3,0>}
                                torus {1,.5 rotate x*90 translate <-3,-6,0>}
                                torus {1,.5 rotate x*90 translate <-3,-9,0>}
                                torus {1,.5 rotate x*90 translate <3, 0,0>}
                                torus {1,.5 rotate x*90 translate <3,-3,0>}
                                torus {1,.5 rotate x*90 translate <3,-6,0>}
                                torus {1,.5 rotate x*90 translate <3,-9,0>}
                                translate <0,-14,7> 
                            }                  
                            cone {<0,0,0>6.15<0,3,0>6.3
                               scale <1.05,1,.65> 
                               translate <0,-25,-.3>
                            }                   
                            union {  
                                #declare Loop=30;
                                #while (Loop<360)
                                        object {Pouch                                    
                                                translate <0,0,-7>  
                                                rotate y*Loop                   
                                        }
                                        #declare Loop=Loop+30;
                                #end                         
                                translate y*-25
                                scale <1.05,1,.65>
                                translate z*-.3
                            }
                            cylinder {<0,0,0><0,0,-1.8>5 translate <0,-15,-3> }
                            torus {4.5,.5 rotate x*90 translate <0,-15,-4.8>}
                            torus {2.5,.5 rotate x*90 translate <0,-15,-4.8>}  
                            cylinder {< 4.5,0,1><0,-10,0>2 translate < 1,-15,-3> }
                            cylinder {<-4.5,0,1><0,-10,0>2 translate <-1,-15,-3> }
                            cylinder {<0,0,1><0,-10,0>2 translate < 1,-15,-3> }
                            cylinder {<0,0,1><0,-10,0>2 translate <-1,-15,-3> }
                            sphere {< 4.5,0,1>2 translate < 1,-15,-3>}
                            sphere {<-4.5,0,1>2 translate <-1,-15,-3>}
                            union {
                                #declare Length=20;
                                #declare Loop=0;
                                #while (Loop<Length)
                                    torus {6,1 
                                           scale <1,1,.5>
                                           translate <0,-Loop-10,0>
                                    }
                                    #declare Loop=Loop+1;
                                #end
                            }
                            torus {5,3 rotate z*90 translate <0,-28,1> scale <1,1,.75>}
                             
                            merge {
                                sphere {0,8 clipped_by {plane {y,-0.0000001 inverse}}}
                                cone {<0,0,0>8<0,-10,0>5.5}
                                hollow
                                translate z*1
                                clipped_by {plane {y,-2 rotate x*-45 inverse}}
                               texture {T_Old_Glass}
                            }
                               
                            merge {
                                sphere {0,8 clipped_by {plane {y,-0.0000001 inverse}}}
                                cone {<0,0,0>8<0,-10,0>5.5}
                                hollow
                                translate z*1
                                clipped_by {plane {y,-2 rotate x*-45}}
                                texture {
                                    pigment {
                                        image_map {
                                            png Torso_IMap
                                            map_type 2
                                            interpolate 4
                                            //once
                                        } 
                                        rotate y*-90
                                        scale 40
                                        translate <0,-40,0>
                                    }
                                    #ifdef (Map_Finish)
                                        finish {Map_Finish}
                                    #end
                                    #ifdef (Map_Normal)
                                        normal {Map_Normal}
                                    #end
                                    #ifdef (Torso_BMap)
                                        normal {
                                            bump_map {
                                                png Torso_BMap
                                                map_type 2
                                                interpolate 4
                                                once
                                                bump_size Bump_Map_Size
                                            }
                                            rotate y*-90
                                            scale 40
                                            translate <0,-40,0>
                                        }
                                    #end
                                }
                            }
                            difference {
                                union {
                                    torus {3,.5 rotate z*90 translate <0,-5,7> rotate y*45}
                                    torus {3,.5 rotate z*90 translate <0,-5,7> rotate y*-45}
                                }                          
                                cone {<0,0,0>8<0,-10,1>5.5}
                            }    
                      }     

#declare BM_Upperarm_R_Object=union {
                                object {BM_Upperarm_R_Object}
                                union {
                                    #declare Length=11;
                                    #declare Loop=0;
                                    #while (Loop<Length)
                                        torus {2.05,.65 
                                               translate y*-Loop
                                               #if (Loop=4)
                                                    pigment {rgb <1,0,0>}
                                               #end
                                        }
                                        #declare Loop=Loop+1;
                                    #end
                                }
                                union {
                                    #declare Loop=0;
                                    #while (Loop<360)
                                        torus {2.6,.8 
                                               rotate z*Loop
                                               //rotate y*Loop
                                        }
                                        #declare Loop=Loop+30;
                                    #end
                                    sphere {0,2.6}
                                    translate y*1
                                }                
                                //pigment {rgb 1}                
                           }

#declare BM_Upperarm_L_Object=union {
                                object {BM_Upperarm_L_Object}
                                union {
                                    #declare Length=11;
                                    #declare Loop=0;
                                    #while (Loop<Length)
                                        torus {2.05,.65 
                                               translate y*-Loop
                                        }
                                        #declare Loop=Loop+1;
                                    #end

                                }                    
                                union {
                                    #declare Loop=0;
                                    #while (Loop<360)
                                        torus {2.6,.8 
                                               rotate z*Loop
                                               //rotate y*Loop
                                        }
                                        #declare Loop=Loop+30;
                                    #end
                                    sphere {0,2.6}
                                    translate y*1
                                }
                                //pigment {rgb 1}                                
                           }
                           
#declare BM_Forearm_R_Object=union {
                                object {BM_Forearm_R_Object}
                                union {
                                    #declare Length=11;
                                    #declare Loop=0;
                                    #while (Loop<Length)
                                        torus {2.05-(Loop/9),.65 
                                               translate y*-Loop
                                        }
                                        #declare Loop=Loop+1;
                                    #end
                                }         
                                union {
                                    #declare Loop=0;
                                    #while (Loop<360)
                                        torus {2.4,.8 
                                               rotate x*Loop
                                               //rotate y*Loop
                                        }
                                        #declare Loop=Loop+30;
                                    #end
                                    sphere {0,2.4}
                                }
                                //pigment {rgb 1}
                                
                           }
                           
#declare BM_Forearm_L_Object=union {
                                object {BM_Forearm_L_Object}
                                union {
                                    #declare Length=11;
                                    #declare Loop=0;
                                    #while (Loop<Length)
                                        torus {2.05-(Loop/9),.65 
                                               translate y*-Loop
                                        }
                                        #declare Loop=Loop+1;
                                    #end
                                }
                                union {
                                    #declare Loop=0;
                                    #while (Loop<360)
                                        torus {2.4,.8 
                                               rotate x*Loop
                                               //rotate y*Loop
                                        }
                                        #declare Loop=Loop+30;
                                    #end
                                    sphere {0,2.4}
                                }
                                //pigment {rgb 1}
                           }
#declare BM_Hand_R_Object=union {
                              object {BM_Hand_R_Object}
                               union {                              
                                  union {
                                         sphere {0,.3 pigment {rgb .5}}
                                         torus  {.3,.2 rotate z*90 scale <.75,1,1>}
                                         rotate y*-15
                                         translate <-.5,-2.5,0>
                                         rotate x*17
                                  }
                                  union {
                                         sphere {0,.3 pigment {rgb .5}}
                                         torus  {.3,.2 rotate z*90 scale <.75,1,1>}
                                         rotate y*-10
                                         translate <-.5,-2.5,0 >
                                         rotate x*0
                                  }
                                  union {
                                         sphere {0,.3 pigment {rgb .5}}
                                         torus  {.3,.2 rotate z*90 scale <.75,1,1>}
                                         rotate y*10
                                         translate <-.5,-2.5, 0>
                                         rotate x*-17
                                  }
                                  union {
                                         sphere {0,.3 pigment {rgb .5}}
                                         torus  {.3,.2 rotate z*90 scale <.75,1,1>}
                                         rotate y*45
                                         translate <-.1,-2.5,0>
                                         rotate x*-34
                                         
                                  }
                                  
                                  union {
                                         cylinder {<-.45,0,0><-.45,-2.5,0>,.3 rotate x*17}
                                         cylinder {<-.45,0,0><-.45,-2.5,0>,.3 rotate x*0}
                                         cylinder {<-.45,0,0><-.45,-2.5,0>,.3 rotate x*-17}
                                         cylinder {<-.25,0,0><-.1,-2.5,0>,.3 rotate x*-34}
                                         translate <0,0,0>
                                  }
                                  
                              translate z*0
                              }
                              torus {1.1,.6 scale <.65,1.5,1> translate x*.2}  
                              //pigment {rgb 1}
                       }
                       
#declare BM_Hand_L_Object=union {
                              object {BM_Hand_L_Object}
                               union {                              
                                  union {
                                         sphere {0,.3 pigment {rgb .5}}
                                         torus  {.3,.2 rotate z*90 scale <.75,1,1>}
                                         rotate y*-15
                                         translate <-.5,-2.5,0>
                                         rotate x*17
                                  }
                                  union {
                                         sphere {0,.3 pigment {rgb .5}}
                                         torus  {.3,.2 rotate z*90 scale <.75,1,1>}
                                         rotate y*-10
                                         translate <-.5,-2.5,0 >
                                         rotate x*0
                                  }
                                  union {
                                         sphere {0,.3 pigment {rgb .5}}
                                         torus  {.3,.2 rotate z*90 scale <.75,1,1>}
                                         rotate y*10
                                         translate <-.5,-2.5, 0>
                                         rotate x*-17
                                  }
                                  union {
                                         sphere {0,.3 pigment {rgb .5}}
                                         torus  {.3,.2 rotate z*90 scale <.75,1,1>}
                                         rotate y*45
                                         translate <-.1,-2.5,0>
                                         rotate x*-34
                                         
                                  }
                                  
                                  union {
                                         cylinder {<-.45,0,0><-.45,-2.5,0>,.3 rotate x*17}
                                         cylinder {<-.45,0,0><-.45,-2.5,0>,.3 rotate x*0}
                                         cylinder {<-.45,0,0><-.45,-2.5,0>,.3 rotate x*-17}
                                         cylinder {<-.25,0,0><-.1,-2.5,0>,.3 rotate x*-34}
                                         translate <0,0,0>
                                  }
                                  
                              translate z*0
                              }
                              torus {1.1,.6 scale <.65,1.5,1> translate x*.2} 
                              scale <-1,1,1> 
                              //pigment {rgb 1}
                       }
#declare BM_Thigh_R_Object=union {
                            object {BM_Thigh_R_Object}
                            union {
                                #declare Length=16;
                                #declare Loop=0;
                                #while (Loop<Length)
                                    torus {4.5-(Loop/14),.65 
                                           translate y*-Loop
                                    }
                                    #declare Loop=Loop+1;
                                #end
                            }
                            union {
                                #declare Loop=0;
                                #while (Loop<360)
                                    torus {5,.65 
                                           rotate z*Loop
                                           //rotate y*Loop
                                    }
                                    #declare Loop=Loop+15;
                                #end
                                sphere {0,3.35}
                                //translate y*1
                            }
                            translate y*16
                            rotate z*5    
                            translate y*-16
                        }

#declare BM_Thigh_L_Object=union {
                            object {BM_Thigh_L_Object}
                            union {
                                #declare Length=16;
                                #declare Loop=0;
                                #while (Loop<Length)
                                    torus {4.5-(Loop/14),.65 
                                           translate y*-Loop
                                    }
                                    #declare Loop=Loop+1;
                                #end
                            }
                            union {
                                #declare Loop=0;
                                #while (Loop<360)
                                    torus {5,.65 
                                           rotate z*Loop
                                           //rotate y*Loop
                                    }
                                    #declare Loop=Loop+15;
                                #end
                                sphere {0,3.35}
                                //translate y*1
                            }
                            translate y*16
                            rotate z*-5    
                            translate y*-16
                        }
#declare BM_Calf_R_Object=union {
                            object {BM_Calf_R_Object}
                            union {
                                #declare Length=19;
                                #declare Loop=0;
                                #while (Loop<Length)
                                    torus {3.4-(Loop*0.05),.65 
                                           translate y*-Loop
                                    }
                                    #declare Loop=Loop+1;
                                #end
                            }         
                            union {
                                #declare Loop=0;
                                #while (Loop<360)
                                    torus {3.75,.8 
                                           rotate x*Loop
                                           //rotate y*Loop
                                    }
                                    #declare Loop=Loop+30;
                                #end
                                sphere {0,3.75}
                            }                  
                            union {
                                sphere { 0,1.5}
                                cylinder {<0,0,0><0,-8,0> 1.5 }
                                sphere {<0,-8,0>,1.5}
                                scale <1.6,1,1> rotate x*5 translate <0,-4,3.5>
                            }
                            torus {1,.5 scale <1,1,1.5> translate <2,-6,3.5>}
                            torus {1,.5 scale <1,1,1.5> translate <-2,-8,3.5>}
                        }
#declare BM_Calf_L_Object=union {
                            object {BM_Calf_L_Object}
                            union {
                                #declare Length=19;
                                #declare Loop=0;
                                #while (Loop<Length)
                                    torus {3.4-(Loop*0.05),.65 
                                           translate y*-Loop
                                    }
                                    #declare Loop=Loop+1;
                                #end
                            }         
                            union {
                                #declare Loop=0;
                                #while (Loop<360)
                                    torus {3.75,.8 
                                           rotate x*Loop
                                           //rotate y*Loop
                                    }
                                    #declare Loop=Loop+30;
                                #end
                                sphere {0,3.75}
                            }                  
                            union {
                                sphere { 0,1.5}
                                cylinder {<0,0,0><0,-8,0> 1.5 }
                                sphere {<0,-8,0>,1.5}
                                scale <1.6,1,1> rotate x*5 translate <0,-4,3.5>
                            }
                            torus {1,.5 scale <1,1,1.5> translate <2,-6,3.5>}
                            torus {1,.5 scale <1,1,1.5> translate <-2,-8,3.5>}
                            scale <-1,1,1>
                        }
#declare BM_Foot_R_Object=union{difference {
                                         union {
                                                cylinder {<0,-1,0><0,1,0>2 translate <0,0,7> texture {ShoeGrip}}
                                                sphere{<0,0,.5>,3.25} 
                                                torus {2.25,.5 translate <0,0,7> texture {ShoeGrip}}
                                                torus {2.0,.5 translate <0,1,7>}
                                                torus {1.9,.5 translate <0,1.75,7>}
                                                torus {1.8,.5 translate <0,2.5,7>}
                                                torus {3,.5 translate <0,0,.5> texture {ShoeGrip}}
                                                cone  {<0,1.25,7>2.25,<0,-1,.5>3.25 scale <1,1.1,1>}
                                                cone  {<0,1.25,7>2.25,<0,-1,.5>3.25 scale <1.1,1.1,1> clipped_by {plane{y,.5}}texture {ShoeGrip}}
                                                cone  {<0,3.6,7>2,<0,-0.00001,7>2.5}
                                                blob { threshold .5
                                                        #declare SideLoop=-60;
                                                        #while (SideLoop<61)
                                                                #declare Loop=5;
                                                                #while (Loop<60)
                                                                        #declare Width=(61-Loop)/30;
                                                                        sphere {0,Width,1 scale <1,1,1> translate <0,0,-3> rotate x*50 rotate x*Loop rotate y*SideLoop translate <0,-.5,1>}
                                                                        sphere {0,Width,1 scale <1,1,1> translate <0,0,-3> rotate x*50 rotate x*-Loop rotate y*SideLoop translate <0,-.5,1>}
                                                                        #declare Loop=Loop+10;
                                                                #end        
                                                                #declare SideLoop=SideLoop+60;
                                                        #end
                                                }
                                                torus {.75,.35 rotate z*90 rotate y*5 translate <-2.1,2.5,7>}
                                         }
                                         plane {y,-.5 texture {ShoeGrip}}
                                         translate <0,-3.6,-7>
                             }
                             torus {1.5,.5 scale <1,2,1>}
                             scale .85
                             translate <0,.5,-.35>
                       }

#declare BM_Foot_L_Object=union{difference {
                                         union {
                                                cylinder {<0,-1,0><0,1,0>2 translate <0,0,7> texture {ShoeGrip}}
                                                sphere{<0,0,.5>,3.25} 
                                                torus {2.25,.5 translate <0,0,7> texture {ShoeGrip}}
                                                torus {2.0,.5 translate <0,1,7>}
                                                torus {1.9,.5 translate <0,1.75,7>}
                                                torus {1.8,.5 translate <0,2.5,7>}
                                                torus {3,.5 translate <0,0,.5> texture {ShoeGrip}}
                                                cone  {<0,1.25,7>2.25,<0,-1,.5>3.25 scale <1,1.1,1>}
                                                cone  {<0,1.25,7>2.25,<0,-1,.5>3.25 scale <1.1,1.1,1> clipped_by {plane{y,.5}}texture {ShoeGrip}}
                                                cone  {<0,3.6,7>2,<0,-0.00001,7>2.5}
                                                blob { threshold .5
                                                        #declare SideLoop=-60;
                                                        #while (SideLoop<61)
                                                                #declare Loop=5;
                                                                #while (Loop<60)
                                                                        #declare Width=(61-Loop)/30;
                                                                        sphere {0,Width,1 scale <1,1,1> translate <0,0,-3> rotate x*50 rotate x*Loop rotate y*SideLoop translate <0,-.5,1>}
                                                                        sphere {0,Width,1 scale <1,1,1> translate <0,0,-3> rotate x*50 rotate x*-Loop rotate y*SideLoop translate <0,-.5,1>}
                                                                        #declare Loop=Loop+10;
                                                                #end        
                                                                #declare SideLoop=SideLoop+60;
                                                        #end
                                                }
                                                torus {.75,.35 rotate z*90 rotate y*5 translate <-2.1,2.5,7>}
                                         }
                                         plane {y,-.5 texture {ShoeGrip}}
                                         translate <0,-3.6,-7>
                             }
                             torus {1.5,.5 scale <1,2,1>}
                             scale .85
                             translate <0,.5,-.35>
                             scale <-1,1,1>
                       }
// EOF