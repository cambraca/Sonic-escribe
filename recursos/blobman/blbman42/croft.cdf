/*******************************************************
    POV-Ray - BlobMan People Costume Definition File
 File Name : croft.cdf
 BM_Version: 4.0
 Desciption: Costume Definition File - Lara ?
 Date      : April 2000
 Author    : Peter Houston 
 Email     : houston.graphics@iname.com 
 WWW       : http://welcome.to/HoustoGraphics 

Notes :
    This CDF only works for Female Figures.
    
    This CDF includes a hair setting.  To test render
    scenes without hair enter the following code
    after the CDF is included
    
        #decalre BM_HairStyle=0;
    
    Then just remove it when you want the hair.
    
    The Boots do not sit on y0 so if you transform
    the figure using the Foot or Toe Origins you will need 
    to add the following translation after the 
    transformation
    
        translate <0,1.0>*BM_Scale 
    
    The Toes of the Boot will bend to match the Toe Angle
    however you need to specify the Toe Angle before the 
    CDF is called, even if you are using arrays.
    
        #declare BM_Toe_Angle=<0,0,0>;
    
********************************************************/
#include "bm_hair.inc"

/********************************************************
  Image Maps & Textures
********************************************************/
#declare BM_Skin_Tex=
    texture {
        pigment{rgb <0.96,0.80,0.69>}
    }                         
#declare BM_Lip_Tex   = texture {pigment {rgb x*.75}}
#declare BM_Nail_Tex  = texture {pigment {rgb <.2,.5,.5>} finish {phong 1}}                         
#declare BM_Eye_Shadow= texture {pigment {rgb <.2,.5,.5>}}
#declare BM_Map_Normal = normal {wrinkles 0.15 scale <.5,10,.5>}

#include "glass.inc" 

#declare BuckleTex = texture {
  pigment {
    rgb <0.70, 0.56, 0.37> 
  }
  finish {
    metallic
    ambient 0.1
    diffuse 0.65
    specular 0.85
    roughness 0.01
    reflection 0.45
    brilliance 1.5
  }
}

#declare SockTex=
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

#declare BagTex=texture {pigment {rgb <0.35, 0.20, 0.1>}
                    normal {quilted .5 scale .05 rotate z*45}
                }    

#declare Torso_IMap      = "croft1.png"
#declare Abdomen_IMap    = "croft2.png"
#declare Hand_R_IMap     = "croft5.png"
#declare Hand_L_IMap     = "croft5.png"
#declare Thigh_R_IMap    = "croft3.png"
#declare Thigh_L_IMap    = "croft3.png"
#declare Calf_R_IMap     = "croft4.png"
#declare Calf_L_IMap     = "croft4.png"
#declare Foot_R_IMap     = "croft5.png"
#declare Foot_L_IMap     = "croft5.png"

/********************************************************
  Body Part Options
********************************************************/

#declare BM_EyeCol=<.25,.25,0>
#declare BM_Hair_Col=<0.35, 0.20, 0.1>;
#declare BM_HairStyle=2;
#declare BM_Map_R_Finger=0;
#declare BM_Map_L_Finger=0;
#declare BM_TShirt=1;

#declare Specs=
    union {
        sphere {0,1 scale <1,.75,.25>  translate <-1.75,0,0> texture {T_Ruby_Glass}}
        torus {1.15,.15 rotate x*90 scale <1,.75,.1>  translate <-1.75,0,0> }
        cylinder {<0,0,0><-1.9,0,4>.15 translate <-2.75,0,0>}
        torus {1,.15 rotate z*90 scale <1,1,1> clipped_by {plane {z,0 inverse}}translate y*-1 rotate z*15 translate <-4.75,0,4>} 
        sphere {0,1 scale <1,.75,.25>  translate <1.75,0,0> texture {T_Ruby_Glass}}
        torus {1.15,.15 rotate x*90 scale <1,.75,.1>  translate <1.75,0,0>}
        cylinder {<0,0,0><1.9,0,4>.15 translate <2.75,0,0>}
        torus {1,.15 rotate z*90 scale <1,1,1> clipped_by {plane {z,0 inverse}}translate y*-1 rotate z*-15 translate <4.75,0,4>} 
        torus {1,.15 rotate x*90 translate y*-.5 clipped_by {plane {y,0 inverse}} }
        texture {SpecFrames}
    }      

#declare Bag=
    union {                          
        blob {threshold .5
            cylinder {<0,0,0><0,-12,0> 3,1 translate <2,0,0>}
            cylinder {<0,0,0><0,-12,0> 3,1 translate <1,0,0>}
            cylinder {<0,0,0><0,-12,0> 3,1 translate <0,0,0>}
            cylinder {<0,0,0><0,-12,0> 3,1 translate <-1,0,0>}
            cylinder {<0,0,0><0,-12,0> 3,1 translate <-2,0,0>}
            cylinder {<0,-1,-1><0,-12,0> 3,1 translate <2,0,2>}
            cylinder {<0,-1,-1><0,-12,0> 3,1 translate <1,0,2>}
            cylinder {<0,-1,-1><0,-12,0> 3,1 translate <0,0,2>}
            cylinder {<0,-1,-1><0,-12,0> 3,1 translate <-1,0,2>}
            cylinder {<0,-1,-1><0,-12,0> 3,1 translate <-2,0,2>}
            scale <1.1,.5,.75>                                
        }
        blob {threshold .5
            cylinder {<0,0,0><0,-12,0> 3,1 translate <2,0,0>}
            cylinder {<0,0,0><0,-12,0> 3,1 translate <1,0,0>}
            cylinder {<0,0,0><0,-12,0> 3,1 translate <0,0,0>}
            cylinder {<0,0,0><0,-12,0> 3,1 translate <-1,0,0>}
            cylinder {<0,0,0><0,-12,0> 3,1 translate <-2,0,0>}
            cylinder {<0,-1,-1><0,-12,0> 3,1 translate <2,0,2>}
            cylinder {<0,-1,-1><0,-12,0> 3,1 translate <1,0,2>}
            cylinder {<0,-1,-1><0,-12,0> 3,1 translate <0,0,2>}
            cylinder {<0,-1,-1><0,-12,0> 3,1 translate <-1,0,2>}
            cylinder {<0,-1,-1><0,-12,0> 3,1 translate <-2,0,2>}
            scale <1.1,.5,.75>                                
            clipped_by {plane {y,0 inverse rotate x*30 rotate z*15 translate y*-1 }}
            clipped_by {plane {y,0 inverse rotate x*30 rotate z*-15 translate y*-1 }}
            scale <1.1,1.05,1.1>
            rotate x*-5
       }  
       torus {.5,.25 translate <0,-1.2,2.75> texture {SpecFrames}}              
  }                        
/********************************************************
  Body Part Objects
********************************************************/

#declare BM_Head_Object= union {object{BM_Head_Object}
                                object {Specs
                                    rotate x*-30
                                    translate <0,-2,-4.5>
                                }
                         }
//#declare BM_Neck_Object=object {BM_Neck_Object}
                                                 
#declare BM_Torso_Object=union {
                            object{BM_Torso_Object}
                            union {
                                    object {Bag}
                                    object {Bag scale <.2,.5,.5> rotate y*90 translate <3.5,-3,1> }
                                    object {Bag scale <.6,.5,.5>  translate <0,-3,2.5> }
                                    object {Bag scale <.2,.5,.5> rotate y*-90 translate <-3.5,-3,1> }
                                    
                                torus {3,.5 scale <1.2,2,1> rotate y*-15 rotate z*80 rotate y*30 translate <-4.5,-2.5,-2>}
                                torus {3,.5 scale <1.2,2,1> rotate y*-15 rotate z*80 rotate y*30 translate <-4.5,-2.5,-2> scale <-1,1,1>}
                                translate <0,-8,4>
                                texture {BagTex}
                            }
                         }
#declare BM_Abdomen_Object=union {
                                object{BM_Abdomen_Object}
                                cone {<0,0,0>,5.3,<0,-2,0>5.5
                                    scale <1.1,1,.8>
                                    translate <0,-23.25,-.5>
                                    pigment { rgb <0.25, 0.10, 0.0> }
                                }
                                
                                difference {
                                    box {<-1.5,-1.5,0><1.5,1.5,.5>
                                         translate <0,-24.25,-5>
                                    texture {BuckleTex}
                                    }           
                                    box {<-1,-1,0><1,1,.25>
                                         translate <0,-24.25,-5>
                                    texture {BuckleTex
                                        finish {ambient -.15}}
                                    }          
                                }
                                box {<-.5,0,0><.5,-4,1>
                                     rotate x*-5
                                     translate <0,-24.25,-4.6>
                                }
                           }
//#declare BM_Upperarm_R_Object=object {BM_Upperarm_R_Object}
//#declare BM_Upperarm_L_Object=object {BM_Upperarm_L_Object}
//#declare BM_Forearm_R_Object=object {BM_Forearm_R_Object}
//#declare BM_Forearm_L_Object=object {BM_Forearm_L_Object}
//#declare BM_Hand_R_Object=object {BM_Hand_R_Object}
//#declare BM_Hand_L_Object=object {BM_Hand_L_Object}

#declare BM_Thigh_R_Object=union {
                                object {BM_Thigh_R_Object}
                                torus {3.5,.5 scale <1,2,1>
                                 translate <-2,-4,-.5>
                                }                   
                           }
#declare BM_Thigh_L_Object=union {
                                 object {BM_Thigh_L_Object}
                                torus {3.5,.5 scale <1,2,1>
                                 translate < 2,-4,-.5>
                                }
                           }

#declare BM_Calf_R_Object=union {
                                 object {BM_Calf_R_Object}
                                 blob {threshold .5
                                    cylinder {<0,1.5,0><0,-1.5,0>,4.2,1.1
                                        scale <1,.5,1.1>
                                        translate <-.05,-10,.4>
                                    }
                                    texture {SockTex}
                                 }
                                 cone {<0,0,.5>2.1,<0,-8,0>1.75
                                    scale <1,1,1>
                                    translate  <0,-11,0>
                                    texture {BootTex}
                                    //pigment {rgb x}     
                                 }
                                 #local Laces=0
                                 #while (Laces<7)
                                    torus {1,.2 
                                        texture {LaceTex}
                                        rotate z*30
                                        translate <0,-12-Laces,-1>
                                        rotate x*-1
                                    }  
                                    torus {1,.2 
                                        texture {LaceTex}
                                        rotate z*-30
                                        translate <0,-12-Laces,-1.1>
                                        rotate x*-1
                                    }  
                                    #declare Laces=Laces+1
                                #end
                                torus {2.2,.2                            
                                    texture {LaceTex}
                                    rotate z*10
                                    translate <0,-12,.25>
                                }
                                torus {2.2,.2                            
                                    texture {LaceTex}
                                    rotate z*-13
                                    translate <0,-12,.25>
                                }                                
                                    
                                 
                          }
#declare BM_Calf_L_Object=union {
                                object {BM_Calf_L_Object}
                                 blob {threshold .5
                                    cylinder {<0,1.5,0><0,-1.5,0>,4.2,1.1
                                        scale <1,.5,1.1>
                                        translate <-.05,-10,.4>
                                    }
                                    texture {SockTex}
                                 }
                                 cone {<0,0,.5>2.1,<0,-8,0>1.75
                                    scale <1,1,1>
                                    translate  <0,-11,0>
                                    texture {BootTex}
                                    //pigment {rgb x}     
                                 }
                                 #local Laces=0
                                 #while (Laces<7)
                                    torus {1,.2 
                                        texture {LaceTex}
                                        rotate z*30
                                        translate <0,-12-Laces,-1>
                                        rotate x*-1
                                    }  
                                    torus {1,.2 
                                        texture {LaceTex}
                                        rotate z*-30
                                        translate <0,-12-Laces,-1.1>
                                        rotate x*-1
                                    }  
                                    #declare Laces=Laces+1
                                #end
                                torus {2.2,.2                            
                                    texture {LaceTex}
                                    rotate z*10
                                    translate <0,-12,.25>
                                }
                                torus {2.2,.2                            
                                    texture {LaceTex}
                                    rotate z*-13
                                    translate <0,-12,.25>
                                }                                
                                scale <-1,1,1>
                        }                                 
                            
#declare BM_Foot_R_Object=union {
                                object {BM_Foot_R_Object}
                                difference {    
                                    union { // Sole
                                        cylinder {<0,0,0><0,-.75,0> 2.2 
                                                   translate <0,-2.5,0>
                                        }
                                        cylinder {<0,0,0><0,-.75,0> 2.9 
                                                   rotate x*BM_Toe_Angle.z
                                                   translate <-.3,-2.5,-5.7> 
                                                    
                                                    clipped_by {plane {z,-5.7}}
                                        }                              
                                        prism {   linear_sweep   linear_spline 
                                            0,-0.75,5,        
                                          <-2,0>,<2,0>,<2.5,-5.7>,<-3.4,-5.7>,<-2,0>
                                          translate <0,-2.5,0>
                                        }
                                   }        
                                   box {<-4,-8,0><4,0,-8>
                                        rotate x*-14
                                        rotate y*8
                                        translate <0,-2.6,-2>
                                   }
                                   texture {SoleTex}
                               }      
                               union { //Uppers
                                    union {sphere {<0,.5,0>,2.6}
                                           cylinder {<0,.5,0><0,0,0>2.6}
                                        
                                            clipped_by {plane{y,0 inverse}}
                                            clipped_by {plane {z,0 rotate x*45}}                                            
                                            rotate x*BM_Toe_Angle.z 
                                            translate <-.3,-2.5,-5.7>
                                            
                                    }
                                    
                                    cone {<0,0,0>1.75,<0,-2.5,0>1.9}
                                    sphere {0,1.75}
                                    cone {<0,-.5,0>1.75,<-.3,-2.5,-5.7>2.6
                                          clipped_by {plane {y,-2.5 inverse}}
                                    }
                                    cone {<0,-2,0>1.75,<-.3,-2.5,-5.7>2.6
                                          clipped_by {plane {y,-2.5 inverse}}
                                    }
                                    texture {BootTex}
                               }

                                 #local Laces=0
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
                                    #declare Laces=Laces+1
                                #end
                            }
    
                                            
                          
#declare BM_Foot_L_Object=union {
                                object {BM_Foot_R_Object}
                                difference {    
                                    union { // Sole
                                        cylinder {<0,0,0><0,-.75,0> 2.2 
                                                   translate <0,-2.5,0>
                                        }
                                        cylinder {<0,0,0><0,-.75,0> 2.9 
                                                   rotate x*BM_Toe_Angle.z
                                                   translate <-.3,-2.5,-5.7> 
                                                    
                                                    clipped_by {plane {z,-5.7}}
                                        }                              
                                        prism {   linear_sweep   linear_spline 
                                            0,-0.75,5,        
                                          <-2,0>,<2,0>,<2.5,-5.7>,<-3.4,-5.7>,<-2,0>
                                          translate <0,-2.5,0>
                                        }
                                   }        
                                   box {<-4,-8,0><4,0,-8>
                                        rotate x*-14
                                        rotate y*8
                                        translate <0,-2.6,-2>
                                   }
                                   texture {SoleTex}
                               }      
                               union { //Uppers
                                    union {sphere {<0,.5,0>,2.6}
                                           cylinder {<0,.5,0><0,0,0>2.6}
                                        
                                            clipped_by {plane{y,0 inverse}}
                                            clipped_by {plane {z,0 rotate x*45}}                                            
                                            rotate x*BM_Toe_Angle.z 
                                            translate <-.3,-2.5,-5.7>
                                            
                                    }
                                    
                                    cone {<0,0,0>1.75,<0,-2.5,0>1.9}
                                    sphere {0,1.75}
                                    cone {<0,-.5,0>1.75,<-.3,-2.5,-5.7>2.6
                                          clipped_by {plane {y,-2.5 inverse}}
                                    }
                                    cone {<0,-2,0>1.75,<-.3,-2.5,-5.7>2.6
                                          clipped_by {plane {y,-2.5 inverse}}
                                    }
                                    texture {BootTex}
                               }

                                 #local Laces=0
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
                                    #declare Laces=Laces+1
                                #end
                                scale <-1,1,1>
                            }    
    
// End of Costume Definition File