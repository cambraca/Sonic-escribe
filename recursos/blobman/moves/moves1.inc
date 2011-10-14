/*/////// MOVES.INC /////////
By Chris Calef
June 2000  

For use with Blobman, by Peter Houston
  http://members.xoom.com/_XOOM/HoustonGraph/POV-Ray/index.htm

 
For a very unorganized and non-comprehensive examples page, try
        http://216.36.10.183/junk.html
until my boss finds out. :-)

Send comments or questions to: ccalef@orcasinc.com
Have fun!  Stay tuned for more moves!
 

Example of Use

#include "bmpeople.inc"
#include "bm_hands.inc"
#include "croft.cdf"
#include "moves.inc"

HorseStance(clock)  // clock not really necessary here, I just include it for consistency

#declare BM_Jaw = 0.1;

#switch (clock)
 #range (0,0.25)
  PunchLeft(clock*2)
  PunchRight((clock+0.25)*2)
 #break
 #range (0.25,0.5)
  PunchLeft(clock*2)
  PunchRight((clock-0.25)*2)
 #break
 #range (0.5,0.75)
  PunchLeft((clock-0.5)*2)
  PunchRight((clock-0.25)*2)
 #break
 #range (0.75,1.0)
  PunchLeft((clock-0.5)*2)
  PunchRight((clock-0.75)*2)
 #break
#end
#if (clock>0.95)
  Shout((clock-0.95)*10)
#end

Blob_Man(Female,2)
object {BlobMan
        transform BMO_Foot_L
        rotate y*150
        translate LauraPlace
}



*/

///////// PushKickRight  ///////////////
#macro PushKickRight(Clock)    
 #local positions = 3;    
 #local RightThigh = array[positions] {<8,0,-15>,<138,0,-15>,<94,0,-15>} 
 #local LeftThigh = array[positions] {<8,0,15>,<16,0,15>,<20,0,15>}
 #local RightLowerLeg = array[positions] {<-8,0,0>,<30,0,0>,<90,0,0>}
 #local LeftLowerLeg = array[positions] {<-8,0,0>,<-8,0,0>,<-8,0,0>}
 #local RightFoot = array[positions] {<8,0,0>,<8,0,0>,<8,0,0>}
 #local LeftFoot = array[positions] {<8,0,0>,<8,0,0>,<8,0,0>}


 #local steps = 4;  
 #switch (Clock)
  #range(0,1/steps)  
  #local ClockFactor = (steps)*Clock;
   #declare BM_RL_H2K = RightThigh[0] + ClockFactor*(RightThigh[1] - RightThigh[0]);
   #declare BM_RL_K2A = RightLowerLeg[0] + ClockFactor*(RightLowerLeg[1] - RightLowerLeg[0]);
   #declare BM_LL_H2K = LeftThigh[0] + ClockFactor*(LeftThigh[1] - LeftThigh[0]);
   #declare BM_LL_K2A = LeftLowerLeg[0] + ClockFactor*(LeftLowerLeg[1] - LeftLowerLeg[0]);
   #declare BM_RF_Rot = RightFoot[0] + ClockFactor*(RightFoot[1] - RightFoot[0]); 
   #declare BM_LF_Rot = LeftFoot[0] + ClockFactor*(LeftFoot[1] - LeftFoot[0]);
  #break         //  (steps*(clock-1/steps)*50)
  #range(1/steps,2/steps)  
   #local ClockFactor = (steps)*(Clock-1/steps);
   #declare BM_RL_H2K = RightThigh[1] + ClockFactor*(RightThigh[2] - RightThigh[1]);
   #declare BM_RL_K2A = RightLowerLeg[1] + ClockFactor*(RightLowerLeg[2] - RightLowerLeg[1]);
   #declare BM_LL_H2K = LeftThigh[1] + ClockFactor*(LeftThigh[2] - LeftThigh[1]);
   #declare BM_LL_K2A = LeftLowerLeg[1] + ClockFactor*(LeftLowerLeg[2] - LeftLowerLeg[1]);
   #declare BM_RF_Rot = RightFoot[1] + ClockFactor*(RightFoot[2] - RightFoot[1]); 
   #declare BM_LF_Rot = LeftFoot[1] + ClockFactor*(LeftFoot[2] - LeftFoot[1]);
  #break
  #range(2/steps,3/steps) 
   #local ClockFactor = (steps)*(Clock-2/steps);
   #declare BM_RL_H2K = RightThigh[2] + ClockFactor*(RightThigh[1] - RightThigh[2]);
   #declare BM_RL_K2A = RightLowerLeg[2] + ClockFactor*(RightLowerLeg[1] - RightLowerLeg[2]);
   #declare BM_LL_H2K = LeftThigh[2] + ClockFactor*(LeftThigh[1] - LeftThigh[2]);
   #declare BM_LL_K2A = LeftLowerLeg[2] + ClockFactor*(LeftLowerLeg[1] - LeftLowerLeg[2]);
   #declare BM_RF_Rot = RightFoot[2] + ClockFactor*(RightFoot[1] - RightFoot[2]); 
   #declare BM_LF_Rot = LeftFoot[2] + ClockFactor*(LeftFoot[1] - LeftFoot[2]);
  #break
  #range(3/steps,4/steps) 
   #local ClockFactor = (steps)*(Clock-3/steps);
   #declare BM_RL_H2K = RightThigh[1] + ClockFactor*(RightThigh[0] - RightThigh[1]);
   #declare BM_RL_K2A = RightLowerLeg[1] + ClockFactor*(RightLowerLeg[0] - RightLowerLeg[1]);
   #declare BM_LL_H2K = LeftThigh[1] + ClockFactor*(LeftThigh[0] - LeftThigh[1]);
   #declare BM_LL_K2A = LeftLowerLeg[1] + ClockFactor*(LeftLowerLeg[0] - LeftLowerLeg[1]);
   #declare BM_RF_Rot = RightFoot[1] + ClockFactor*(RightFoot[0] - RightFoot[1]); 
   #declare BM_LF_Rot = LeftFoot[1] + ClockFactor*(LeftFoot[0] - LeftFoot[1]);
  #break      
 #end                                
#end
///////// end PushKickRight  /////////////// 

///////// FrontKickHighRight  ///////////////
#macro FrontKickHighRight(Clock)    
 #local positions = 3;    
 #local RightThigh = array[positions] {<8,0,-15>,<128,0,-15>,<134,0,-15>} 
 #local LeftThigh = array[positions] {<8,0,15>,<20,0,15>,<28,0,15>}
 #local RightLowerLeg = array[positions] {<-8,0,0>,<-8,0,0>,<120,0,0>}
 #local LeftLowerLeg = array[positions] {<-8,0,0>,<-8,0,0>,<-8,0,0>}
 #local RightFoot = array[positions] {<8,0,0>,<8,0,0>,<-37,0,0>}
 #local LeftFoot = array[positions] {<8,0,0>,<8,0,0>,<8,0,0>}


 #local steps = 4;  
 #switch (Clock)
  #range(0,1/steps)  
  #local ClockFactor = (steps)*Clock;
   #declare BM_RL_H2K = RightThigh[0] + ClockFactor*(RightThigh[1] - RightThigh[0]);
   #declare BM_RL_K2A = RightLowerLeg[0] + ClockFactor*(RightLowerLeg[1] - RightLowerLeg[0]);
   #declare BM_LL_H2K = LeftThigh[0] + ClockFactor*(LeftThigh[1] - LeftThigh[0]);
   #declare BM_LL_K2A = LeftLowerLeg[0] + ClockFactor*(LeftLowerLeg[1] - LeftLowerLeg[0]);
   #declare BM_RF_Rot = RightFoot[0] + ClockFactor*(RightFoot[1] - RightFoot[0]); 
   #declare BM_LF_Rot = LeftFoot[0] + ClockFactor*(LeftFoot[1] - LeftFoot[0]);
  #break         //  (steps*(clock-1/steps)*50)
  #range(1/steps,2/steps)  
   #local ClockFactor = (steps)*(Clock-1/steps);
   #declare BM_RL_H2K = RightThigh[1] + ClockFactor*(RightThigh[2] - RightThigh[1]);
   #declare BM_RL_K2A = RightLowerLeg[1] + ClockFactor*(RightLowerLeg[2] - RightLowerLeg[1]);
   #declare BM_LL_H2K = LeftThigh[1] + ClockFactor*(LeftThigh[2] - LeftThigh[1]);
   #declare BM_LL_K2A = LeftLowerLeg[1] + ClockFactor*(LeftLowerLeg[2] - LeftLowerLeg[1]);
   #declare BM_RF_Rot = RightFoot[1] + ClockFactor*(RightFoot[2] - RightFoot[1]); 
   #declare BM_LF_Rot = LeftFoot[1] + ClockFactor*(LeftFoot[2] - LeftFoot[1]);
  #break
  #range(2/steps,3/steps) 
   #local ClockFactor = (steps)*(Clock-2/steps);
   #declare BM_RL_H2K = RightThigh[2] + ClockFactor*(RightThigh[1] - RightThigh[2]);
   #declare BM_RL_K2A = RightLowerLeg[2] + ClockFactor*(RightLowerLeg[1] - RightLowerLeg[2]);
   #declare BM_LL_H2K = LeftThigh[2] + ClockFactor*(LeftThigh[1] - LeftThigh[2]);
   #declare BM_LL_K2A = LeftLowerLeg[2] + ClockFactor*(LeftLowerLeg[1] - LeftLowerLeg[2]);
   #declare BM_RF_Rot = RightFoot[2] + ClockFactor*(RightFoot[1] - RightFoot[2]); 
   #declare BM_LF_Rot = LeftFoot[2] + ClockFactor*(LeftFoot[1] - LeftFoot[2]);
  #break
  #range(3/steps,4/steps) 
   #local ClockFactor = (steps)*(Clock-3/steps);
   #declare BM_RL_H2K = RightThigh[1] + ClockFactor*(RightThigh[0] - RightThigh[1]);
   #declare BM_RL_K2A = RightLowerLeg[1] + ClockFactor*(RightLowerLeg[0] - RightLowerLeg[1]);
   #declare BM_LL_H2K = LeftThigh[1] + ClockFactor*(LeftThigh[0] - LeftThigh[1]);
   #declare BM_LL_K2A = LeftLowerLeg[1] + ClockFactor*(LeftLowerLeg[0] - LeftLowerLeg[1]);
   #declare BM_RF_Rot = RightFoot[1] + ClockFactor*(RightFoot[0] - RightFoot[1]); 
   #declare BM_LF_Rot = LeftFoot[1] + ClockFactor*(LeftFoot[0] - LeftFoot[1]);
  #break      
 #end                                
#end
///////// end FrontKickHighRight  /////////////// 

///////// FrontKickLowRight  ///////////////
#macro FrontKickLowRight(Clock)    
 #local positions = 3;    
 #local RightThigh = array[positions] {<8,0,-15>,<68,0,-15>,<118,0,-15>} 
 #local LeftThigh = array[positions] {<8,0,15>,<20,0,15>,<24,0,15>}
 #local RightLowerLeg = array[positions] {<-8,0,0>,<-8,0,0>,<110,0,0>}
 #local LeftLowerLeg = array[positions] {<-8,0,0>,<-8,0,0>,<-8,0,0>}
 #local RightFoot = array[positions] {<8,0,0>,<8,0,0>,<-37,0,0>}
 #local LeftFoot = array[positions] {<8,0,0>,<8,0,0>,<8,0,0>}


 #local steps = 6;  
 #switch (Clock)
  #range(0,2/steps)  
  #local ClockFactor = (steps/2)*Clock;
   #declare BM_RL_H2K = RightThigh[0] + ClockFactor*(RightThigh[1] - RightThigh[0]);
   #declare BM_RL_K2A = RightLowerLeg[0] + ClockFactor*(RightLowerLeg[1] - RightLowerLeg[0]);
   #declare BM_LL_H2K = LeftThigh[0] + ClockFactor*(LeftThigh[1] - LeftThigh[0]);
   #declare BM_LL_K2A = LeftLowerLeg[0] + ClockFactor*(LeftLowerLeg[1] - LeftLowerLeg[0]);
   #declare BM_RF_Rot = RightFoot[0] + ClockFactor*(RightFoot[1] - RightFoot[0]); 
   #declare BM_LF_Rot = LeftFoot[0] + ClockFactor*(LeftFoot[1] - LeftFoot[0]);
  #break         //  (steps*(clock-1/steps)*50)
  #range(2/steps,3/steps)  
   #local ClockFactor = (steps)*(Clock-2/steps);
   #declare BM_RL_H2K = RightThigh[1] + ClockFactor*(RightThigh[2] - RightThigh[1]);
   #declare BM_RL_K2A = RightLowerLeg[1] + ClockFactor*(RightLowerLeg[2] - RightLowerLeg[1]);
   #declare BM_LL_H2K = LeftThigh[1] + ClockFactor*(LeftThigh[2] - LeftThigh[1]);
   #declare BM_LL_K2A = LeftLowerLeg[1] + ClockFactor*(LeftLowerLeg[2] - LeftLowerLeg[1]);
   #declare BM_RF_Rot = RightFoot[1] + ClockFactor*(RightFoot[2] - RightFoot[1]); 
   #declare BM_LF_Rot = LeftFoot[1] + ClockFactor*(LeftFoot[2] - LeftFoot[1]);
  #break
  #range(3/steps,4/steps) 
   #local ClockFactor = (steps)*(Clock-3/steps);
   #declare BM_RL_H2K = RightThigh[2] + ClockFactor*(RightThigh[1] - RightThigh[2]);
   #declare BM_RL_K2A = RightLowerLeg[2] + ClockFactor*(RightLowerLeg[1] - RightLowerLeg[2]);
   #declare BM_LL_H2K = LeftThigh[2] + ClockFactor*(LeftThigh[1] - LeftThigh[2]);
   #declare BM_LL_K2A = LeftLowerLeg[2] + ClockFactor*(LeftLowerLeg[1] - LeftLowerLeg[2]);
   #declare BM_RF_Rot = RightFoot[2] + ClockFactor*(RightFoot[1] - RightFoot[2]); 
   #declare BM_LF_Rot = LeftFoot[2] + ClockFactor*(LeftFoot[1] - LeftFoot[2]);
  #break
  #range(4/steps,6/steps) 
   #local ClockFactor = (steps/2)*(Clock-4/steps);
   #declare BM_RL_H2K = RightThigh[1] + ClockFactor*(RightThigh[0] - RightThigh[1]);
   #declare BM_RL_K2A = RightLowerLeg[1] + ClockFactor*(RightLowerLeg[0] - RightLowerLeg[1]);
   #declare BM_LL_H2K = LeftThigh[1] + ClockFactor*(LeftThigh[0] - LeftThigh[1]);
   #declare BM_LL_K2A = LeftLowerLeg[1] + ClockFactor*(LeftLowerLeg[0] - LeftLowerLeg[1]);
   #declare BM_RF_Rot = RightFoot[1] + ClockFactor*(RightFoot[0] - RightFoot[1]); 
   #declare BM_LF_Rot = LeftFoot[1] + ClockFactor*(LeftFoot[0] - LeftFoot[1]);
  #break      
 #end                                
#end
///////// end FrontKickLowRight  ///////////////      
             
///////// FrontKickLeft  ///////////////
#macro FrontKickLeft(Clock) 
 #local positions = 3;    
 #local RightThigh = array[positions] {<8,0,-15>,<20,0,-15>,<24,0,-15>} 
 #local LeftThigh = array[positions] {<8,0,15>,<68,0,15>,<118,0,15>}
 #local RightLowerLeg = array[positions] {<-8,0,0>,<-8,0,0>,<-8,0,0>}
 #local LeftLowerLeg = array[positions] {<-8,0,0>,<-8,0,0>,<72,0,0>}
 #local RightFoot = array[positions] {<8,0,0>,<8,0,0>,<8,0,0>}
 #local LeftFoot = array[positions] {<8,0,0>,<8,0,0>,<-37,0,0>}

 #local steps = 6;  
 #switch (Clock)
  #range(0,2/steps)  
  #local ClockFactor = (steps/2)*Clock;
   #declare BM_RL_H2K = RightThigh[0] + ClockFactor*(RightThigh[1] - RightThigh[0]);
   #declare BM_RL_K2A = RightLowerLeg[0] + ClockFactor*(RightLowerLeg[1] - RightLowerLeg[0]);
   #declare BM_LL_H2K = LeftThigh[0] + ClockFactor*(LeftThigh[1] - LeftThigh[0]);
   #declare BM_LL_K2A = LeftLowerLeg[0] + ClockFactor*(LeftLowerLeg[1] - LeftLowerLeg[0]);
   #declare BM_RF_Rot = RightFoot[0] + ClockFactor*(RightFoot[1] - RightFoot[0]); 
   #declare BM_LF_Rot = LeftFoot[0] + ClockFactor*(LeftFoot[1] - LeftFoot[0]);
  #break         //  (steps*(clock-1/steps)*50)
  #range(2/steps,3/steps)  
   #local ClockFactor = (steps)*(Clock-2/steps);
   #declare BM_RL_H2K = RightThigh[1] + ClockFactor*(RightThigh[2] - RightThigh[1]);
   #declare BM_RL_K2A = RightLowerLeg[1] + ClockFactor*(RightLowerLeg[2] - RightLowerLeg[1]);
   #declare BM_LL_H2K = LeftThigh[1] + ClockFactor*(LeftThigh[2] - LeftThigh[1]);
   #declare BM_LL_K2A = LeftLowerLeg[1] + ClockFactor*(LeftLowerLeg[2] - LeftLowerLeg[1]);
   #declare BM_RF_Rot = RightFoot[1] + ClockFactor*(RightFoot[2] - RightFoot[1]); 
   #declare BM_LF_Rot = LeftFoot[1] + ClockFactor*(LeftFoot[2] - LeftFoot[1]);
  #break
  #range(3/steps,4/steps) 
   #local ClockFactor = (steps)*(Clock-3/steps);
   #declare BM_RL_H2K = RightThigh[2] + ClockFactor*(RightThigh[1] - RightThigh[2]);
   #declare BM_RL_K2A = RightLowerLeg[2] + ClockFactor*(RightLowerLeg[1] - RightLowerLeg[2]);
   #declare BM_LL_H2K = LeftThigh[2] + ClockFactor*(LeftThigh[1] - LeftThigh[2]);
   #declare BM_LL_K2A = LeftLowerLeg[2] + ClockFactor*(LeftLowerLeg[1] - LeftLowerLeg[2]);
   #declare BM_RF_Rot = RightFoot[2] + ClockFactor*(RightFoot[1] - RightFoot[2]); 
   #declare BM_LF_Rot = LeftFoot[2] + ClockFactor*(LeftFoot[1] - LeftFoot[2]);
  #break
  #range(4/steps,6/steps) 
   #local ClockFactor = (steps/2)*(Clock-4/steps);
   #declare BM_RL_H2K = RightThigh[1] + ClockFactor*(RightThigh[0] - RightThigh[1]);
   #declare BM_RL_K2A = RightLowerLeg[1] + ClockFactor*(RightLowerLeg[0] - RightLowerLeg[1]);
   #declare BM_LL_H2K = LeftThigh[1] + ClockFactor*(LeftThigh[0] - LeftThigh[1]);
   #declare BM_LL_K2A = LeftLowerLeg[1] + ClockFactor*(LeftLowerLeg[0] - LeftLowerLeg[1]);
   #declare BM_RF_Rot = RightFoot[1] + ClockFactor*(RightFoot[0] - RightFoot[1]); 
   #declare BM_LF_Rot = LeftFoot[1] + ClockFactor*(LeftFoot[0] - LeftFoot[1]);
  #break      
 #end                                
#end
///////// end FrontKickLeft  /////////////// 

///////// RoundhouseKickRight ///////////////
/*
 #local positions = 3;    
 #local RightThigh = array[positions] {<>,<>,<>} 
 #local LeftThigh = array[positions] {<>,<>,<>}
 #local RightLowerLeg = array[positions] {<>,<>,<>}
 #local LeftLowerLeg = array[positions] {<>,<>,<>}
 #local RightFoot = array[positions] {<>,<>,<>}
 #local LeftFoot = array[positions] {<>,<>,<>}   */  

///////// end RoundhouseKickRight  ///////////////  

///////// RoundhouseKickLeft /////////////// 
         /*
 #local positions = 3;    
 #local RightThigh = array[positions] {<>,<>,<>} 
 #local LeftThigh = array[positions] {<>,<>,<>}
 #local RightLowerLeg = array[positions] {<>,<>,<>}
 #local LeftLowerLeg = array[positions] {<>,<>,<>}
 #local RightFoot = array[positions] {<>,<>,<>}
 #local LeftFoot = array[positions] {<>,<>,<>}     */

///////// end RoundhouseKickLeft  ///////////////    

///////// SideSnapKickRight ///////////////
         /*
 #local positions = 3;    
 #local RightThigh = array[positions] {<>,<>,<>} 
 #local LeftThigh = array[positions] {<>,<>,<>}
 #local RightLowerLeg = array[positions] {<>,<>,<>}
 #local LeftLowerLeg = array[positions] {<>,<>,<>}
 #local RightFoot = array[positions] {<>,<>,<>}
 #local LeftFoot = array[positions] {<>,<>,<>}    */ 

///////// end SideSnapKickRight  ///////////////  

///////// SideSnapKickLeft /////////////// 
         /*
 #local positions = 3;    
 #local RightThigh = array[positions] {<>,<>,<>} 
 #local LeftThigh = array[positions] {<>,<>,<>}
 #local RightLowerLeg = array[positions] {<>,<>,<>}
 #local LeftLowerLeg = array[positions] {<>,<>,<>}
 #local RightFoot = array[positions] {<>,<>,<>}
 #local LeftFoot = array[positions] {<>,<>,<>}   */                         

///////// end SideSnapKickLeft  /////////////// 
  
  
/////////  HandsRaiseALittle  ///////////////   
#macro HandsRaiseALittle(Clock)
                             
 #local positions = 2;    
 #local RightUpperArm = array[positions] {<-10,5,-35>,<-10,5,-35>} 
 #local LeftUpperArm = array[positions] {<-10,5,35>,<-10,5,35>}  
 #local RightForearm = array[positions] {<10,0,10>,<32,0,10>}    
 #local LeftForearm = array[positions] {<10,0,-10>,<32,0,-10>}
       
 #local steps = 2;  
 #switch (Clock)
  #range(0,1/steps) 
   #local ClockFactor = (steps*Clock);
   #declare BM_RA_S2E = RightUpperArm[0];//   Right Upper Arm
   #declare BM_RA_E2W = RightForearm[0] + ClockFactor*(RightForearm[1] - RightForearm[0]);//    Right Forearm 
   #declare BM_LA_S2E = LeftUpperArm[0];//    Left Upper Arm 
   #declare BM_LA_E2W = LeftForearm[0] + ClockFactor*(LeftForearm[1] - LeftForearm[0]);//     Left Forearm                                                            
  #break
  #range(1/steps,2/steps)  
   #local ClockFactor = (steps*(Clock-1/steps));
   #declare BM_RA_S2E = RightUpperArm[0];//   Right Upper Arm
   #declare BM_RA_E2W = RightForearm[1] + ClockFactor*(RightForearm[0] - RightForearm[1]);//    Right Forearm 
   #declare BM_LA_S2E = LeftUpperArm[0];//    Left Upper Arm 
   #declare BM_LA_E2W = LeftForearm[1] + ClockFactor*(LeftForearm[0] - LeftForearm[1]);//     Left Forearm   
  #break      
 #end        
#end              
///////// end HandsRaiseALittle  ///////////////     



///////// PunchRight ///////////////
#macro PunchRight(Clock)    
                
  #local positions = 2;    
  #local RightUpperArm = array[positions] {<-50,0,-20>,<90,0,-20>} 
  #local RightForearm = array[positions] {<60,0,20>,<90,0,-20>}
  #local RightHand = array[positions] {<0,90,0>,<0,-90,0>}
              
  #local steps=6;  
  #switch(Clock) 
   #range(0,1/steps) // pause at ready
    #declare BM_RA_S2E = RightUpperArm[0];//  Right Upper Arm
    #declare BM_RA_E2W = RightForearm[0];//     Right Forearm
    #declare BM_RH_Rot = RightHand[0];//     Right Hand   
   #break
   #range(1/steps,3/steps) // punch 
    #local ClockFactor = ((steps/2)*(Clock-1/steps));
    #declare BM_RA_S2E = RightUpperArm[0] + ClockFactor*(RightUpperArm[1] - RightUpperArm[0]);
    #declare BM_RA_E2W = RightForearm[0] + ClockFactor*(RightForearm[1] - RightForearm[0]);
    #declare BM_RH_Rot = RightHand[0] + ClockFactor*(RightHand[1] - RightHand[0]);
   #break 
   #range(3/steps,4/steps) // pause at full extension  
    #declare BM_RA_S2E = RightUpperArm[1];
    #declare BM_RA_E2W = RightForearm[1];
    #declare BM_RH_Rot = RightHand[1];    
   #break    
   #range(4/steps,6/steps) // pull back 
    #local ClockFactor = ((steps/2)*(Clock-4/steps));   
    #declare BM_RA_S2E = RightUpperArm[1] + ClockFactor*(RightUpperArm[0] - RightUpperArm[1]);
    #declare BM_RA_E2W = RightForearm[1] + ClockFactor*(RightForearm[0] - RightForearm[1]);
    #declare BM_RH_Rot = RightHand[1] + ClockFactor*(RightHand[0] - RightHand[1]);    
   #break    
  #end
#end                                        
///////// end PunchRight  ///////////////  
            
            
///////// PunchLeft ///////////////
#macro PunchLeft(Clock)    
   
   
  #local positions = 2;    
  #local LeftUpperArm = array[positions] {<-50,0,20>,<90,0,-20>} 
  #local LeftForearm = array[positions] {<60,0,-20>,<90,0,-20>}
  #local LeftHand = array[positions] {<0,-90,0>,<0,90,0>}

  #local steps=6;  
  #switch(Clock) 
   #range(0,1/steps) // pause at ready
    #declare BM_LA_S2E = LeftUpperArm[0];
    #declare BM_LA_E2W = LeftForearm[0];
    #declare BM_LH_Rot = LeftHand[0]; 
   #break
   #range(1/steps,3/steps) // punch   
    #local ClockFactor = ((steps/2)*(Clock-1/steps));
    #declare BM_LA_S2E = LeftUpperArm[0] + ClockFactor*(LeftUpperArm[1] - LeftUpperArm[0]);
    #declare BM_LA_E2W = LeftForearm[0] + ClockFactor*(LeftForearm[1] - LeftForearm[0]);
    #declare BM_LH_Rot = LeftHand[0] + ClockFactor*(LeftHand[1] - LeftHand[0]);
   #break 
   #range(3/steps,4/steps) // pause at full extension  
    #declare BM_LA_S2E = LeftUpperArm[1];
    #declare BM_LA_E2W = LeftForearm[1];
    #declare BM_LH_Rot = LeftHand[1];    
   #break    
   #range(4/steps,6/steps) // pull back
    #local ClockFactor = ((steps/2)*(Clock-4/steps));
    #declare BM_LA_S2E = LeftUpperArm[1] + ClockFactor*(LeftUpperArm[0] - LeftUpperArm[1]);
    #declare BM_LA_E2W = LeftForearm[1] + ClockFactor*(LeftForearm[0] - LeftForearm[1]);
    #declare BM_LH_Rot = LeftHand[1] + ClockFactor*(LeftHand[0] - LeftHand[1]);    
   #break    
  #end
#end                                        
///////// end PunchLeft  /////////////// 

 
///////// KnifeHandRight ///////////////

///////// end KnifeHandRight  ///////////////  

///////// KnifeHandLeft /////////////// 

///////// end KnifeHandLeft  ///////////////  

                                     
///////// LauraStand  /////////////// 
#macro LauraStand(Clock)
  #declare BM_RA_S2E = <-10,5,-35>;// <-10,5,-35>  Right Upper Arm
  #declare BM_RA_E2W = <10,0,10>;// <10,0,10>   Right Forearm  
  #declare BM_RH_Rot = <0,0,10>;//     Right Hand
  #declare BM_LA_S2E = <-10,-5,35>;//    Left Upper Arm 
  #declare BM_LA_E2W = <10,0,-10>;//     Left Forearm   
  #declare BM_LH_Rot = <0,0,-10>;//     Left Hand     
  
  #declare BM_RL_H2K = <8,0,-6>;//    Right Thigh 
  #declare BM_RL_K2A = <-8,0,0>;//    Right Lower Leg 
  #declare BM_LL_H2K = <8,0,6>;//     Left Thigh 
  #declare BM_LL_K2A = <-8,0,0>;//   Left Lower Leg 
  #declare BM_RF_Rot = <8,0,0>;//    Right Foot 
  #declare BM_LF_Rot = <8,0,0>;//     Left Foot   
  #declare BM_Toe_Angle = <45,0,0>;//  Toes    

#end  
///////// end LauraStand  ///////////////                                         
                                          
                                          
                                          
///////// Gunfighter  /////////////// 
#macro Gunfighter(Clock)
  #declare BM_RA_S2E = <-10,5,-35>;// <-10,5,-35>  Right Upper Arm
  #declare BM_RA_E2W = <10,0,10>;// <10,0,10>   Right Forearm  
  #declare BM_RH_Rot = <0,0,10>;//     Right Hand
  #declare BM_LA_S2E = <-10,-5,35>;//    Left Upper Arm 
  #declare BM_LA_E2W = <10,0,-10>;//     Left Forearm   
  #declare BM_LH_Rot = <0,0,-10>;//     Left Hand     
  
  #declare BM_RL_H2K = <8,0,-15>;//    Right Thigh 
  #declare BM_RL_K2A = <-8,0,0>;//    Right Lower Leg 
  #declare BM_LL_H2K = <8,0,15>;//     Left Thigh 
  #declare BM_LL_K2A = <-8,0,0>;//   Left Lower Leg 
  #declare BM_RF_Rot = <8,0,0>;//    Right Foot 
  #declare BM_LF_Rot = <8,0,0>;//     Left Foot 

#end  
///////// end Gunfighter  ///////////////
              
//////// PointingLeftArm ////////   
#macro PointingLeftArm(Clock)
  #local HandPos = 6;
  #declare BM_LFP_Pos=BM_Hands[HandPos][0];
  #declare BM_LFR_Pos=BM_Hands[HandPos][1];
  #declare BM_LFM_Pos=BM_Hands[HandPos][2];
  #declare BM_LFI_Pos=BM_Hands[HandPos][3];
  #declare BM_LFT_Pos=BM_Hands[HandPos][4];
 
  #local positions = 2;    
  #local LeftUpperArm = array[positions] {<-10,-5,35>,<90,0,0>} 
  #local LeftForearm = array[positions] {<10,0,-10>,<90,0,0>}
  #local LeftHand = array[positions] {<0,0,-10>,<0,80,-10>}                             

 
  #local steps=3;   
  #switch (Clock)    
   #range (0,1/steps) 
    #local ClockFactor = (steps*Clock);
    #declare BM_LA_S2E = LeftUpperArm[0] + ClockFactor * (LeftUpperArm[1] - LeftUpperArm[0]));//    Left Upper Arm 
    #declare BM_LA_E2W = LeftForearm[0] + ClockFactor *(LeftForearm[1] - LeftForearm[0]));//     Left Forearm   
    #declare BM_LH_Rot = LeftHand[0] + ClockFactor *(LeftHand[1] - LeftHand[0]));//     Left Hand  
   #break
   #range (1/steps,2/steps)
    #declare BM_LA_S2E = LeftUpperArm[1];//    Left Upper Arm 
    #declare BM_LA_E2W = LeftForearm[1];//     Left Forearm   
    #declare BM_LH_Rot = LeftHand[1];//     Left Hand    
   #break
   #range (2/steps,3/steps)  
    #local ClockFactor = (steps*(Clock-2/steps));
    #declare BM_LA_S2E = LeftUpperArm[1]  + ClockFactor * (LeftUpperArm[0] - LeftUpperArm[1]); 
    #declare BM_LA_E2W = LeftForearm[1]  + ClockFactor *(LeftForearm[0] - LeftForearm[1]);   
    #declare BM_LH_Rot = LeftHand[1]  + ClockFactor *(LeftHand[0] - LeftHand[1]);   
   #break        
  #end
#end
///////// end PointingLeftArm ////////         

//////// PointingRightArm ////////   
#macro PointingRightArm(Clock)
  #local HandNo = 6;
  #declare BM_RFP_Pos=BM_Hands[HandNo][0];
  #declare BM_RFR_Pos=BM_Hands[HandNo][1];
  #declare BM_RFM_Pos=BM_Hands[HandNo][2];
  #declare BM_RFI_Pos=BM_Hands[HandNo][3];
  #declare BM_RFT_Pos=BM_Hands[HandNo][4];        
                            
  #local positions = 2;    
  #local RightUpperArm = array[positions] {<-10,-5,-35>,<90,0,0>} 
  #local RightForearm = array[positions] {<10,0,10>,<90,0,0>}
  #local RightHand = array[positions] {<0,0,10>,<0,80,10>} 
  
               
  #local steps = 3;                    
  #switch(Clock)
   #range (0,1/steps) 
    #local ClockFactor = (steps*Clock);
    #declare BM_RA_S2E = RightUpperArm[0] + ClockFactor * (RightUpperArm[1] - RightUpperArm[0]); 
    #declare BM_RA_E2W = RightForearm[0] + ClockFactor *(RightForearm[1] - RightForearm[0]);   
    #declare BM_RH_Rot = RightHand[0] + ClockFactor *(RightHand[1] - RightHand[0]);  
   #break
   #range (1/steps,2/steps)
    #declare BM_RA_S2E = RightUpperArm[1];
    #declare BM_RA_E2W = RightForearm[1];  
    #declare BM_RH_Rot = RightHand[1];   
   #break
   #range (2/steps,3/steps)  
    #local ClockFactor = (steps*(Clock-2/steps));
    #declare BM_RA_S2E = RightUpperArm[1]  + ClockFactor * (RightUpperArm[0] - RightUpperArm[1]); 
    #declare BM_RA_E2W = RightForearm[1]  + ClockFactor *(RightForearm[0] - RightForearm[1]);   
    #declare BM_RH_Rot = RightHand[1]  + ClockFactor *(RightHand[0] - RightHand[1]);  
   #break        
  #end
#end      
//////// end PointingRightArm ////////           



//////// SwordSlashInsideRight ////////   
#macro SwordSlashInsideRight(Clock)
  #local HandNo = 10;
  #declare BM_RFP_Pos=BM_Hands[HandNo][0];
  #declare BM_RFR_Pos=BM_Hands[HandNo][1];
  #declare BM_RFM_Pos=BM_Hands[HandNo][2];
  #declare BM_RFI_Pos=BM_Hands[HandNo][3];
  #declare BM_RFT_Pos=BM_Hands[HandNo][4];        
  

  #declare BM_Hand_R_Object=    
    union { 
      object{BM_Hand_R_Object}
        object{
          Sword 
          scale 3 
          scale y*1.6
          rotate y*95
          rotate x*-90
          translate <1,-2.5,6>
         }      // scale z*1.6 translate <0,-0.2,0.8> rotate <0,0,-60> scale 3
    } 
  
  #local positions = 3;   
  #local RightUpperArm = array[positions] {<-10,5,-35>,<50,8,0>,<40,8,0>} 
  #local RightForearm = array[positions] {<10,0,-10>,<70,0,0>,<50,0,0> }  
  #local RightHand = array[positions] {<0,0,10>,<0,70,0>,<-50,70,0>}

              
  #local steps = 3;                    
  #switch(Clock)
   #range(0,1/steps)                    
    #declare BM_RA_S2E = RightUpperArm[0] + (Clock*(RightUpperArm[1]-RightUpperArm[0])); 
    #declare BM_RA_E2W = RightForearm[0] + (Clock*(RightForearm[1]-RightForearm[0])); 
    #declare BM_RH_Rot =  RightHand[0] + (Clock*(RightHand[1]-RightHand[0]));      
   #break
   #range(1/steps,2/steps) 
    #declare BM_RA_S2E = RightUpperArm[1] + (Clock*(RightUpperArm[2]-RightUpperArm[1]));//    Right Upper Arm 
    #declare BM_RA_E2W = RightForearm[1] + (Clock*(RightForearm[2]-RightForearm[1]));//     Right Forearm 
    #declare BM_RH_Rot = RightHand[1] + (Clock*(RightHand[2]-RightHand[1]));//     Right Hand      
   #break
   #range(2/steps,3/steps)
    #declare BM_RA_S2E = RightUpperArm[1] + ((Clock-2/steps)*(RightUpperArm[0] - RightUpperArm[1])); 
    #declare BM_RA_E2W = RightForearm[1] + ((Clock-2/steps)*(RightForearm[0] - RightForearm[1])); 
    #declare BM_RH_Rot = RightHand[1] + ((Clock-2/steps)*(RightHand[0] - RightHand[1]));      
   #break
  #end
#end      
//////// end SwordSlashInsideRight ////////     

//////// SwordSlashOutsideRight ////////   
#macro SwordSlashOutsideRight(Clock)
  #local HandNo = 10;
  #declare BM_RFP_Pos=BM_Hands[HandNo][0];
  #declare BM_RFR_Pos=BM_Hands[HandNo][1];
  #declare BM_RFM_Pos=BM_Hands[HandNo][2];
  #declare BM_RFI_Pos=BM_Hands[HandNo][3];
  #declare BM_RFT_Pos=BM_Hands[HandNo][4];        
  

  #declare BM_Hand_R_Object=    
    union { 
      object{BM_Hand_R_Object}
        object{
          Sword 
          scale 3 
          scale y*1.6
          rotate y*95
          rotate x*-90
          translate <1,-2.5,6>
         }      // scale z*1.6 translate <0,-0.2,0.8> rotate <0,0,-60> scale 3
    } 
  
  #local positions = 3;   
  #local RightUpperArm = array[positions] {<-10,5,-35>,<50,8,0>,<40,8,0>} 
  #local RightForearm = array[positions] {<10,0,-10>,<70,0,0>,<50,0,0> }  
  #local RightHand = array[positions] {<0,0,10>,<0,70,0>,<-50,70,0>}

              
  #local steps = 3;                    
  #switch(Clock)
   #range(0,1/steps)                    
    #declare BM_RA_S2E = RightUpperArm[0] + (Clock*(RightUpperArm[1]-RightUpperArm[0])); 
    #declare BM_RA_E2W = RightForearm[0] + (Clock*(RightForearm[1]-RightForearm[0])); 
    #declare BM_RH_Rot =  RightHand[0] + (Clock*(RightHand[1]-RightHand[0]));      
   #break
   #range(1/steps,2/steps) 
    #declare BM_RA_S2E = RightUpperArm[1] + (Clock*(RightUpperArm[2]-RightUpperArm[1]));//    Right Upper Arm 
    #declare BM_RA_E2W = RightForearm[1] + (Clock*(RightForearm[2]-RightForearm[1]));//     Right Forearm 
    #declare BM_RH_Rot = RightHand[1] + (Clock*(RightHand[2]-RightHand[1]));//     Right Hand      
   #break
   #range(2/steps,3/steps)
    #declare BM_RA_S2E = RightUpperArm[1] + ((Clock-2/steps)*(RightUpperArm[0] - RightUpperArm[1])); 
    #declare BM_RA_E2W = RightForearm[1] + ((Clock-2/steps)*(RightForearm[0] - RightForearm[1])); 
    #declare BM_RH_Rot = RightHand[1] + ((Clock-2/steps)*(RightHand[0] - RightHand[1]));      
   #break
  #end
#end      
//////// end SwordSlashOutsideRight ////////       
                              
                                                           
                              
//////// SwordRightArmStep ////////   
#macro SwordRightArmStep(Clock)
  #local HandNo = 10;
  #declare BM_RFP_Pos=BM_Hands[HandNo][0];
  #declare BM_RFR_Pos=BM_Hands[HandNo][1];
  #declare BM_RFM_Pos=BM_Hands[HandNo][2];
  #declare BM_RFI_Pos=BM_Hands[HandNo][3];
  #declare BM_RFT_Pos=BM_Hands[HandNo][4];        
  
   
  #declare BM_Hand_R_Object=    
    union { 
      object{BM_Hand_R_Object}
        object{
          Sword 
          scale 3 
          scale y*1.6
          rotate y*95
          rotate x*-90
          translate <1,-2.5,6>
         }      // scale z*1.6 translate <0,-0.2,0.8> rotate <0,0,-60> scale 3
    } 
    
  #local positions = 2;     
  #local RightUpperArm = array[positions] {<-10,5,-35>,<50,8,0>}   
  #local RightForearm = array[positions]  {<10,0,-10>,<70,-6,0>}
  #local RightHand = array[positions]     {<0,0,10>,<-50,0,0>}
    
     
              
  #local steps = 3;                    
  #switch(Clock)
   #range(0,1/steps)                    
    #declare BM_RA_S2E = RightUpperArm[0] + (Clock*(RightUpperArm[1]-RightUpperArm[0]));//    Right Upper Arm 
    #declare BM_RA_E2W = RightForearm[0] + (Clock*(RightForearm[1]-RightForearm[0]));//     Right Forearm 
    #declare BM_RH_Rot =  RightHand[0] + (Clock*(RightHand[1]-<0,0,10>));//     Right Hand      
   #break
   #range(1/steps,2/steps) 
    #declare BM_RA_S2E = RightUpperArm[1];//    Right Upper Arm 
    #declare BM_RA_E2W = RightForearm[1];//     Right Forearm 
    #declare BM_RH_Rot = RightHand[1];//     Right Hand      
   #break
   #range(2/steps,3/steps)
    #declare BM_RA_S2E = RightUpperArm[1] + ((Clock-2/steps)*(RightUpperArm[0] - RightUpperArm[1]));//    Right Upper Arm 
    #declare BM_RA_E2W = RightForearm[1] + ((Clock-2/steps)*(RightForearm[0] - RightForearm[1]));//     Right Forearm 
    #declare BM_RH_Rot = RightHand[1] + ((Clock-2/steps)*(RightHand[0] - RightHand[1]));//     Right Hand      
   #break
  #end
#end      
//////// end SwordRightArmStep ////////   

///////// KarateKid //////// 
#macro KarateKid(Clock)
 #if (clock<0.5)          
   #declare BM_RA_S2E = <-10,5,-35-(2*Clock*40)>;//   Right Upper Arm
   #declare BM_RA_E2W = <10,0,10-(2*Clock*45)>;//    Right Forearm 
   #declare BM_LA_S2E = <-10,-5,35+(2*Clock*40)>;//    Left Upper Arm 
   #declare BM_LA_E2W = <10,0,-10+(2*Clock*45)>;//     Left Forearm 
   #declare BM_RL_H2K = <8+(2*Clock*50),0,-15>;//    Right Thigh 
   #declare BM_RL_K2A = <-8,0,0>;//    Right Lower Leg 
   #declare BM_LL_H2K = <8+(2*Clock*16),0,15>;//     Left Thigh 
   #declare BM_LL_K2A = <-8,0,0>;//   Left Lower Leg 
   #declare BM_RF_Rot = <8,0,0>;//    Right Foot 
   #declare BM_LF_Rot = <8,0,0>;//     Left Foot 
   #declare BM_RH_Rot = <0,0,10>;//     Right Hand
   #declare BM_LH_Rot = <0,0,-10>;//     Left Hand             
   #declare BM_Toe_Angle = <0+(2*Clock*60),0,0>;                                                                                                    
 #else                                             
   #declare BM_RA_S2E = <-10,5,-75+(2*(Clock-0.5)*40)>;//   Right Upper Arm
   #declare BM_RA_E2W = <10,0,-35+(2*(Clock-0.5)*45)>;//    Right Forearm 
   #declare BM_RH_Rot = <0,0,10>;//     Right Hand
   #declare BM_LA_S2E = <-10,-5,75-(2*(Clock-0.5)*40)>;//    Left Upper Arm 
   #declare BM_LA_E2W = <10,0,35-(2*(Clock-0.5)*45)>;//     Left Forearm  
   #declare BM_LH_Rot = <0,0,-10>;//     Left Hand 
   
   #declare BM_RL_H2K = <58-(2*(Clock-0.5)*50),0,-15>;//    Right Thigh 
   #declare BM_RL_K2A = <-8,0,0>;//    Right Lower Leg  
   #declare BM_RF_Rot = <8,0,0>;//    Right Foot 
   #declare BM_LL_H2K = <24-(2*(Clock-0.5)*16),0,15>;//     Left Thigh 
   #declare BM_LL_K2A = <-8,0,0>;//   Left Lower Leg 
   #declare BM_LF_Rot = <8,0,0>;//     Left Foot 

   #declare BM_LH_Rot = <0,0,-10>;//     Left Hand 
   #declare BM_Toe_Angle = <60-(2*(Clock-0.5)*60),0,0>;    
 #end
#end                                                       
////////  end KarateKid ////////   

////////  Shout ////////
#macro Shout(Clock)     
  #local steps = 3;                    
  #switch(Clock)
   #range(0,1/steps)                    
    #declare BM_Jaw=0.1+(steps*(Clock)*0.9);   
   #break
   #range(1/steps,2/steps) 
    #declare BM_Jaw=1;
   #break
   #range(2/steps,3/steps)
    #declare BM_Jaw=1-(steps*(Clock-2/steps)*0.9);
   #break
  #end 
#end   
////////  end Shout ////////   

///////// HorseStance  /////////////// 
#macro HorseStance(Clock)     
  #local HandPos = 3;
  #declare BM_LFP_Pos=BM_Hands[HandPos][0];
  #declare BM_LFR_Pos=BM_Hands[HandPos][1];
  #declare BM_LFM_Pos=BM_Hands[HandPos][2];
  #declare BM_LFI_Pos=BM_Hands[HandPos][3];
  #declare BM_LFT_Pos=BM_Hands[HandPos][4];   
  
  #declare BM_RFP_Pos=BM_Hands[HandPos][0];
  #declare BM_RFR_Pos=BM_Hands[HandPos][1];
  #declare BM_RFM_Pos=BM_Hands[HandPos][2];
  #declare BM_RFI_Pos=BM_Hands[HandPos][3];
  #declare BM_RFT_Pos=BM_Hands[HandPos][4];

  #declare BM_RA_S2E = <-50,0,-20>;//    Right Upper Arm
  #declare BM_RA_E2W = <60,0,20>;//    Right Forearm
  #declare BM_RH_Rot = <0,90,0>;//     Right Hand       
  
  #declare BM_LA_S2E = <-50,0,20>;//    Left Upper Arm 
  #declare BM_LA_E2W = <60,0,-20>;//     Left Forearm 
  #declare BM_LH_Rot = <0,-90,0>;//     Left Hand
  
  #declare BM_RL_H2K = <48,30,-70>;//    Right Thigh 
  #declare BM_RL_K2A = <-18,0,-20>;//    Right Lower Leg
  #declare BM_RF_Rot = <18,0,20>;//    Right Foot     
  
  #declare BM_LL_H2K = <48,-30,70>;//     Left Thigh 
  #declare BM_LL_K2A = <-18,0,20>;//   Left Lower Leg 
  #declare BM_LF_Rot = <18,0,-20>;//     Left Foot 
#end
///////// end HorseStance  ///////////////       

  
  
//////// SwordStepStabRight ////////   
#macro SwordStepStabRight(Clock)
  #local HandNo = 10;
  #declare BM_RFP_Pos=BM_Hands[HandNo][0];
  #declare BM_RFR_Pos=BM_Hands[HandNo][1];
  #declare BM_RFM_Pos=BM_Hands[HandNo][2];
  #declare BM_RFI_Pos=BM_Hands[HandNo][3];
  #declare BM_RFT_Pos=BM_Hands[HandNo][4];        
  
   
  #declare BM_Hand_R_Object=    
    union { 
      object{BM_Hand_R_Object}
        object{
          Sword 
          scale 3 
          scale y*1.6
          rotate y*95
          rotate x*-90
          translate <1,-2.5,6>
         }      // scale z*1.6 translate <0,-0.2,0.8> rotate <0,0,-60> scale 3
    } 
    
 #local positions = 3; 
 #local Torso = array[positions]          {<0,0,0>,<-18,0,0>,<-28,0,0>}  
 #local RightUpperArm = array[positions]  {<-10,-5,-35>,<20+18,0,-25>,<80+28,8,0>} 
 #local RightForearm = array[positions]   {<10,0,-10>,<40+18,-2,-7>,<90+28,-6,0>}
 #local RightHand = array[positions]      {<0,0,10>,<-19,0,7>,<-48,-100,0>} 
 #local RightThigh = array[positions]     {<8,0,-6>,<58,0,-6>,<38,0,0>} 
 #local LeftThigh = array[positions]      {<8,0,6>,<-8,0,6>,<-23,0,6>}
 #local RightLowerLeg = array[positions]  {<-8,0,0>,<-18,0,0>,<18,0,0>}
 #local LeftLowerLeg = array[positions]   {<-8,0,0>,<-23,0,0>,<-38,0,0>}
 #local RightFoot = array[positions]      {<8,0,0>,<-10,0,0>,<28,0,0>}
 #local LeftFoot = array[positions]       {<8,0,0>,<8,-25,0>,<8,-50,0>}
 #local RightToe = array[positions]       {0,30,-30}
 #local LeftToe = array[positions]        {0,15,30} 
 
  #local steps = 2;  
 #switch (Clock)
  #range(0,1/steps)  
   #local ClockFactor = steps * Clock;   
   #declare BM_Torso_Rot = Torso[0] + ClockFactor*(Torso[1] - Torso[0]); 
   #declare BM_RA_S2E = RightUpperArm[0] + ClockFactor*(RightUpperArm[1] - RightUpperArm[0]);//    Right Upper Arm 
   #declare BM_RA_E2W = RightForearm[0] + ClockFactor*(RightForearm[1] - RightForearm[0]);//     Right Forearm 
   #declare BM_RH_Rot =  RightHand[0] + ClockFactor*(RightHand[1] - RightHand[0]);//     Right Hand 
   #declare BM_RL_H2K = RightThigh[0] + ClockFactor*(RightThigh[1] - RightThigh[0]);
   #declare BM_RL_K2A = RightLowerLeg[0] + ClockFactor*(RightLowerLeg[1] - RightLowerLeg[0]);
   #declare BM_LL_H2K = LeftThigh[0] + ClockFactor*(LeftThigh[1] - LeftThigh[0]);
   #declare BM_LL_K2A = LeftLowerLeg[0] + ClockFactor*(LeftLowerLeg[1] - LeftLowerLeg[0]);
   #declare BM_RF_Rot = RightFoot[0] + ClockFactor*(RightFoot[1] - RightFoot[0]); 
   #declare BM_LF_Rot = LeftFoot[0] + ClockFactor*(LeftFoot[1] - LeftFoot[0]);  
   #local R_Toe = RightToe[0] + ClockFactor*(RightToe[1] - RightToe[0]);   
   #local L_Toe = LeftToe[0] + ClockFactor*(LeftToe[1] - LeftToe[0]);
   #declare BM_Toe_Angle = <L_Toe,0,R_Toe>;
   #declare BaseFoot = 1;
  #break         
  #range(1/steps,2/steps+0.001)  
   #local ClockFactor = steps*(Clock-1/steps); 
   #declare BM_Torso_Rot = Torso[1] + ClockFactor*(Torso[2] - Torso[1]);      
   #declare BM_RA_S2E = RightUpperArm[1] + ClockFactor*(RightUpperArm[2] - RightUpperArm[1]);//    Right Upper Arm 
   #declare BM_RA_E2W = RightForearm[1] + ClockFactor*(RightForearm[2] - RightForearm[1]);//     Right Forearm 
   #declare BM_RH_Rot = RightHand[1] + ClockFactor*(RightHand[2] - RightHand[1]);//     Right Hand    
   #declare BM_RL_H2K = RightThigh[1] + ClockFactor*(RightThigh[2] - RightThigh[1]);
   #declare BM_RL_K2A = RightLowerLeg[1] + ClockFactor*(RightLowerLeg[2] - RightLowerLeg[1]);
   #declare BM_LL_H2K = LeftThigh[1] + ClockFactor*(LeftThigh[2] - LeftThigh[1]);
   #declare BM_LL_K2A = LeftLowerLeg[1] + ClockFactor*(LeftLowerLeg[2] - LeftLowerLeg[1]);
   #declare BM_RF_Rot = RightFoot[1] + ClockFactor*(RightFoot[2] - RightFoot[1]); 
   #declare BM_LF_Rot = LeftFoot[1] + ClockFactor*(LeftFoot[2] - LeftFoot[1]);
   #local R_Toe = RightToe[1] + ClockFactor*(RightToe[2] - RightToe[1]);   
   #local L_Toe = LeftToe[1] + ClockFactor*(LeftToe[2] - LeftToe[1]);
   #declare BM_Toe_Angle = <L_Toe,0,R_Toe>;
   #declare BaseFoot = 1;
  #break
 #end
#end      
//////// end SwordStepStabRight ////////
  
///////// StepRight  ///////////////
#macro StepRight(Clock)                 
 #local positions = 5;    
 #local Torso = array[positions]         {<-5,0,0>,<-5,0,0>,<-5,0,0>,<-5,0,0>,<-5,0,0>}   
 #local RightThigh = array[positions]    {<8,0,-6>,<58,0,-6>,<38,0,-6>,<8,0,-6>,<-8,0,-6>} 
 #local LeftThigh = array[positions]     {<8,0,6>,<-8,0,6>,<8,0,6>,<58,0,0>,<38,0,6>}
 #local RightLowerLeg = array[positions] {<-38,0,0>,<-18,0,0>,<18,0,0>,<-8,0,0>,<-23,0,0>}
 #local LeftLowerLeg = array[positions]  {<-8,0,0>,<-23,0,0>,<-38,0,0>,<-18,0,0>,<18,0,0>}
 #local RightFoot = array[positions]     {<8,0,0>,<-10,0,0>,<8,0,0>,<8,0,0>,<8,0,0>}
 #local LeftFoot = array[positions]      {<8,0,0>,<8,0,0>,<8,0,0>,<-10,0,0>,<8,0,0>}
 #local RightToe = array[positions]      {30,0,15,30,0}
 #local LeftToe = array[positions]       {0,15,30,0,30}  

 #local steps = 4;  
 #switch (Clock)
  #range(0,1/steps)  
   #local ClockFactor = steps * Clock;   
   #declare BM_Torso_Rot = Torso[0] + ClockFactor*(Torso[1] - Torso[0]);
   #declare BM_RL_H2K = RightThigh[0] + ClockFactor*(RightThigh[1] - RightThigh[0]);
   #declare BM_RL_K2A = RightLowerLeg[0] + ClockFactor*(RightLowerLeg[1] - RightLowerLeg[0]);
   #declare BM_LL_H2K = LeftThigh[0] + ClockFactor*(LeftThigh[1] - LeftThigh[0]);
   #declare BM_LL_K2A = LeftLowerLeg[0] + ClockFactor*(LeftLowerLeg[1] - LeftLowerLeg[0]);
   #declare BM_RF_Rot = RightFoot[0] + ClockFactor*(RightFoot[1] - RightFoot[0]); 
   #declare BM_LF_Rot = LeftFoot[0] + ClockFactor*(LeftFoot[1] - LeftFoot[0]);  
   #local R_Toe = RightToe[0] + ClockFactor*(RightToe[1] - RightToe[0]);   
   #local L_Toe = LeftToe[0] + ClockFactor*(LeftToe[1] - LeftToe[0]);
   #declare BM_Toe_Angle = <L_Toe,0,R_Toe>;
   #declare BaseFoot = 1;
  #break         
  #range(1/steps,2/steps)  
   #local ClockFactor = steps*(Clock-1/steps); 
   #declare BM_Torso_Rot = Torso[1] + ClockFactor*(Torso[2] - Torso[1]);
   #declare BM_RL_H2K = RightThigh[1] + ClockFactor*(RightThigh[2] - RightThigh[1]);
   #declare BM_RL_K2A = RightLowerLeg[1] + ClockFactor*(RightLowerLeg[2] - RightLowerLeg[1]);
   #declare BM_LL_H2K = LeftThigh[1] + ClockFactor*(LeftThigh[2] - LeftThigh[1]);
   #declare BM_LL_K2A = LeftLowerLeg[1] + ClockFactor*(LeftLowerLeg[2] - LeftLowerLeg[1]);
   #declare BM_RF_Rot = RightFoot[1] + ClockFactor*(RightFoot[2] - RightFoot[1]); 
   #declare BM_LF_Rot = LeftFoot[1] + ClockFactor*(LeftFoot[2] - LeftFoot[1]);
   #local R_Toe = RightToe[1] + ClockFactor*(RightToe[2] - RightToe[1]);   
   #local L_Toe = LeftToe[1] + ClockFactor*(LeftToe[2] - LeftToe[1]);
   #declare BM_Toe_Angle = <L_Toe,0,R_Toe>;
   #declare BaseFoot = 1;
  #break
  #range(2/steps,3/steps) 
   #local ClockFactor = steps*(Clock-2/steps);
   #declare BM_RL_H2K = RightThigh[2] + ClockFactor*(RightThigh[3] - RightThigh[2]);
   #declare BM_RL_K2A = RightLowerLeg[2] + ClockFactor*(RightLowerLeg[3] - RightLowerLeg[2]);
   #declare BM_LL_H2K = LeftThigh[2] + ClockFactor*(LeftThigh[3] - LeftThigh[2]);
   #declare BM_LL_K2A = LeftLowerLeg[2] + ClockFactor*(LeftLowerLeg[3] - LeftLowerLeg[2]);
   #declare BM_RF_Rot = RightFoot[2] + ClockFactor*(RightFoot[3] - RightFoot[2]); 
   #declare BM_LF_Rot = LeftFoot[2] + ClockFactor*(LeftFoot[3] - LeftFoot[2]);
   #local R_Toe = RightToe[2] + ClockFactor*(RightToe[3] - RightToe[2]);   
   #local L_Toe = LeftToe[2] + ClockFactor*(LeftToe[3] - LeftToe[2]);
   #declare BM_Toe_Angle = <L_Toe,0,R_Toe>;
   #declare BaseFoot = 2;
  #break
  #range(3/steps,4/steps) 
   #local ClockFactor = steps*(Clock-3/steps);
   #declare BM_RL_H2K = RightThigh[3] + ClockFactor*(RightThigh[4] - RightThigh[3]);
   #declare BM_RL_K2A = RightLowerLeg[3] + ClockFactor*(RightLowerLeg[4] - RightLowerLeg[3]);
   #declare BM_LL_H2K = LeftThigh[3] + ClockFactor*(LeftThigh[4] - LeftThigh[3]);
   #declare BM_LL_K2A = LeftLowerLeg[3] + ClockFactor*(LeftLowerLeg[4] - LeftLowerLeg[3]);
   #declare BM_RF_Rot = RightFoot[3] + ClockFactor*(RightFoot[4] - RightFoot[3]); 
   #declare BM_LF_Rot = LeftFoot[3] + ClockFactor*(LeftFoot[4] - LeftFoot[3]);
   #local R_Toe = RightToe[3] + ClockFactor*(RightToe[4] - RightToe[3]);   
   #local L_Toe = LeftToe[3] + ClockFactor*(LeftToe[4] - LeftToe[3]);
   #declare BM_Toe_Angle = <L_Toe,0,R_Toe>; 
   #declare BaseFoot = 2;
  #break       
 #end             
#end
///////// End StepRight  ///////////////

///////// StepLeft  ///////////////
         /*
 #local positions = 3;    
 #local RightThigh = array[positions] {<8,0,-15>,<68,0,-15>,<118,0,-15>} 
 #local LeftThigh = array[positions] {<8,0,15>,<20,0,15>,<24,0,15>}
 #local RightLowerLeg = array[positions] {<-8,0,0>,<-8,0,0>,<110,0,0>}
 #local LeftLowerLeg = array[positions] {<-8,0,0>,<-8,0,0>,<-8,0,0>}
 #local RightFoot = array[positions] {<8,0,0>,<8,0,0>,<-37,0,0>}
 #local LeftFoot = array[positions] {<8,0,0>,<8,0,0>,<8,0,0>}


 #local steps = 6;  
 #switch (Clock)
  #range(0,2/steps)  
  #local ClockFactor = (steps/2)*Clock;
   #declare BM_RL_H2K = RightThigh[0] + ClockFactor*(RightThigh[1] - RightThigh[0]);
   #declare BM_RL_K2A = RightLowerLeg[0] + ClockFactor*(RightLowerLeg[1] - RightLowerLeg[0]);
   #declare BM_LL_H2K = LeftThigh[0] + ClockFactor*(LeftThigh[1] - LeftThigh[0]);
   #declare BM_LL_K2A = LeftLowerLeg[0] + ClockFactor*(LeftLowerLeg[1] - LeftLowerLeg[0]);
   #declare BM_RF_Rot = RightFoot[0] + ClockFactor*(RightFoot[1] - RightFoot[0]); 
   #declare BM_LF_Rot = LeftFoot[0] + ClockFactor*(LeftFoot[1] - LeftFoot[0]);
  #break         //  (steps*(clock-1/steps)*50)
  #range(2/steps,3/steps)  
   #local ClockFactor = (steps)*(Clock-2/steps);
   #declare BM_RL_H2K = RightThigh[1] + ClockFactor*(RightThigh[2] - RightThigh[1]);
   #declare BM_RL_K2A = RightLowerLeg[1] + ClockFactor*(RightLowerLeg[2] - RightLowerLeg[1]);
   #declare BM_LL_H2K = LeftThigh[1] + ClockFactor*(LeftThigh[2] - LeftThigh[1]);
   #declare BM_LL_K2A = LeftLowerLeg[1] + ClockFactor*(LeftLowerLeg[2] - LeftLowerLeg[1]);
   #declare BM_RF_Rot = RightFoot[1] + ClockFactor*(RightFoot[2] - RightFoot[1]); 
   #declare BM_LF_Rot = LeftFoot[1] + ClockFactor*(LeftFoot[2] - LeftFoot[1]);
  #break
  #range(3/steps,4/steps) 
   #local ClockFactor = (steps)*(Clock-3/steps);
   #declare BM_RL_H2K = RightThigh[2] + ClockFactor*(RightThigh[1] - RightThigh[2]);
   #declare BM_RL_K2A = RightLowerLeg[2] + ClockFactor*(RightLowerLeg[1] - RightLowerLeg[2]);
   #declare BM_LL_H2K = LeftThigh[2] + ClockFactor*(LeftThigh[1] - LeftThigh[2]);
   #declare BM_LL_K2A = LeftLowerLeg[2] + ClockFactor*(LeftLowerLeg[1] - LeftLowerLeg[2]);
   #declare BM_RF_Rot = RightFoot[2] + ClockFactor*(RightFoot[1] - RightFoot[2]); 
   #declare BM_LF_Rot = LeftFoot[2] + ClockFactor*(LeftFoot[1] - LeftFoot[2]);
  #break
  #range(4/steps,6/steps) 
   #local ClockFactor = (steps/2)*(Clock-4/steps);
   #declare BM_RL_H2K = RightThigh[1] + ClockFactor*(RightThigh[0] - RightThigh[1]);
   #declare BM_RL_K2A = RightLowerLeg[1] + ClockFactor*(RightLowerLeg[0] - RightLowerLeg[1]);
   #declare BM_LL_H2K = LeftThigh[1] + ClockFactor*(LeftThigh[0] - LeftThigh[1]);
   #declare BM_LL_K2A = LeftLowerLeg[1] + ClockFactor*(LeftLowerLeg[0] - LeftLowerLeg[1]);
   #declare BM_RF_Rot = RightFoot[1] + ClockFactor*(RightFoot[0] - RightFoot[1]); 
   #declare BM_LF_Rot = LeftFoot[1] + ClockFactor*(LeftFoot[0] - LeftFoot[1]);
  #break      
 #end                  */    
  
///////// End StepLeft  ///////////////