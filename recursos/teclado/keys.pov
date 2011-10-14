// Persistence of Vision Ray Tracer Scene Description File
// File: keys.pov
// Vers: 3.01 Watcom Win32
// Desc: Sample Scene File for keyboard.pov
// Date: May 20, 1997
// Auth: Sonya Roberts
// Note: Send questions to sonya_roberts@geocities.com
//       Check out my homepages!  They're at:
//            http://webhome.idirect.com/~sonyar
//            http://www.geocities.com/SoHo/Lofts/1022

// ==== Standard Includes ====
#include "colors.inc"
               

/* c�maras:
0 - normal
1 - desde el lado izq
2 - mano derecha, desde la izquierda
3 - mano derecha, desde arriba
*/
#local camara = 3;












#switch (camara)
#case (1)
    camera {
	location	<-22.5, 6, 0>  //vista de lado
	look_at		<-3, 3, 0>
	up		<0,1,0>
	right		<1,0,0>
    }
#break
#case (2)
    camera {
	location	<-3.3, 4, 0.5>  //lado - mano derecha
	look_at		<0, 2, 1.5>
	up		<0,1,0>
	right		<1,0,0>
    }
#break
#case (22)
    camera {
	location	<3.3, 4, 0.5>  //lado derecho - mano derecha
	look_at		<0, 2, 1.5>
	up		<0,1,0>
	right		<1,0,0>
    }
#break
#case (3)
    camera {
	location	<-.1, 8.1, 0.7>  //mano derecha
	look_at		<-.1, 2, 0.7>
	up		<0,1,0>
	right		<1,0,0>
    }
#break
#else
    camera {
	location	<-3,22.5,-7.5> //vista normal
	look_at		<-3,3,0>
	up		<0,1,0>
	right		<1,0,0>
    }
#end

light_source {
	<50,50,-50>,
	color Gray30
	area_light
	<15,0,0>,<0,15,0>,6,6
	adaptive 2       shadowless
}
light_source {
	<50,50,-50>,
	color Gray20
	area_light
	<15,0,0>,<0,15,0>,6,6
	adaptive 2       
}

light_source {
	<-200,100,-20>,
	color Gray20    /* shadowless */
	
}
light_source {
	<0,130,100>,
	color Gray30    
}

global_settings { ambient_light 2.5 }






#include "keyboard.pov"

object {Keyboard scale 10}





/*
// MANOS
#include "bmhand.inc"

#local RThumb    = < 0, 0, 0, 0>; //<1st,2nd,3rd,Spread>
#local RIndex    = < 20, 50, 40, 0>; //<1st,2nd,3rd,Spread>
#local RMiddle   = < 10, 15, 5, 0>; //<1st,2nd,3rd,Spread>
#local RRing     = < 10, 15, 5, 0>; //<1st,2nd,3rd,Spread>
#local RPinky    = < 10, 15, 5, 0>; //<1st,2nd,3rd,Spread>
#local LThumb    = < 0, 0, 0, 0>; //<1st,2nd,3rd,Spread>
#local LIndex    = < 0, 0, 0, 0>; //<1st,2nd,3rd,Spread>
#local LMiddle   = < 0, 0, 0, 0>; //<1st,2nd,3rd,Spread>
#local LRing     = < 0, 0, 0, 0>; //<1st,2nd,3rd,Spread>
#local LPinky    = < 0, 0, 0, 0>; //<1st,2nd,3rd,Spread>

#declare BM_RFP_Pos=RPinky;
#declare BM_RFR_Pos=RRing;
#declare BM_RFM_Pos=RMiddle;
#declare BM_RFI_Pos=RIndex;
#declare BM_RFT_Pos=RThumb;
#declare BM_LFP_Pos=LPinky;
#declare BM_LFR_Pos=LRing;
#declare BM_LFM_Pos=LMiddle;
#declare BM_LFI_Pos=LIndex;
#declare BM_LFT_Pos=LThumb;
#declare BM_RA_S2E=<0,0,0>;
#declare BM_RA_E2W=<-90,0,0>;
#declare BM_RH_Rot=<0,-90,9>;
#declare BM_LA_S2E=<0,0,0>;
#declare BM_LA_E2W=<0,0,0>;
#declare BM_LH_Rot=<0,0,0>;

#declare BM_Skin_Tex= texture {
        pigment{rgb <.9,.7,.6> transmit .6}
        finish{phong .3 phong_size 40}
}

#declare BM_Nail_Tex = texture{
        BM_Skin_Tex
        finish{phong .7 phong_size 40}
	  } 
#declare BodyPart=
    union {
        bmhand(-1)
        scale .6     
        rotate <30,0,0>     
        translate <-5,-32,-1>
    }

object {BodyPart scale <-1,-1,1> translate <-10.3,-45.5,-1>}

*/