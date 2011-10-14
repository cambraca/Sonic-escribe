/*******************************************************
    POV-Ray - BlobMan People Costume Definition File
 File Name : filename.cdf
 BM_Version: 4.1
 Desciption: Costume Definition File Layout
 Date      : 
 Author    : 
 Email     : 
 WWW       :             
 Note      :
 
********************************************************/
#declare CDF=true; //Used by Body_Part_Viewer.pov Can be removed. 
/********************************************************
  Image Maps & Textures
********************************************************/

//#declare BM_Skin_Tex       = texture {}                         
//#declare BM_Lip_Tex        = texture {}                         
//#declare BM_Hair_Tex       = texture {}                         
//#declare BM_Tooth_Tex      = texture {}
//#declare BM_Nail_Tex       = texture {}
                 
//If the following are undeclared Default Texture will be used instead.

//#declare BM_EyeShadow      = texture {}
//#declare BM_Nipple_Tex     = texture {}
//#declare BM_Head_Tex       = texture {} 
//#declare BM_Neck_Tex       = texture {} 
//#declare BM_Torso_Tex      = texture {}
//#declare BM_Abdomen_Tex    = texture {}
//#declare BM_Upperarm_R_Tex = texture {}
//#declare BM_Upperarm_L_Tex = texture {}
//#declare BM_Forearm_R_Tex  = texture {} 
//#declare BM_ForeArm_L_Tex  = texture {} 
//#declare BM_Hand_R_Tex     = texture {} 
//#declare BM_Hand_L_Tex     = texture {} 
//#declare BM_Thigh_R_Tex    = texture {}
//#declare BM_Thigh_L_Tex    = texture {}
//#declare BM_Calf_R_Tex     = texture {} 
//#declare BM_Calf_L_Tex     = texture {} 
//#declare BM_Foot_R_Tex     = texture {} 
//#declare BM_Foot_L_Tex     = texture {} 

//#declare BM_Map_Finish = finish {}
//#declare BM_Map_Normal = normal {}

//#declare BM_Bump_Map_Size = 0.25;

// PNG Image Maps for Body Parts these must be in your Library Path

//#declare Face_IMap       = "filename.png"
//#declare Neck_IMap       = "filename.png"
//#declare Torso_IMap      = "filename.png"
//#declare Abdomen_IMap    = "filename.png"
//#declare Upperarm_R_IMap = "filename.png"
//#declare Upperarm_L_IMap = "filename.png"
//#declare Forearm_R_IMap  = "filename.png"
//#declare Forearm_L_IMap  = "filename.png"
//#declare Hand_R_IMap     = "filename.png"
//#declare Hand_L_IMap     = "filename.png"
//#declare Thigh_R_IMap    = "filename.png"
//#declare Thigh_L_IMap    = "filename.png"
//#declare Calf_R_IMap     = "filename.png"
//#declare Calf_L_IMap     = "filename.png"
//#declare Foot_R_IMap     = "filename.png"
//#declare Foot_L_IMap     = "filename.png"

// PNG Bump Maps for Body Parts these must be in your Library Path     
     
//#declare Face_BMap       = "filename.png"
//#declare Neck_BMap       = "filename.png"
//#declare Torso_BMap      = "filename.png"
//#declare Abdomen_BMap    = "filename.png"
//#declare Upperarm_R_BMap = "filename.png"
//#declare Upperarm_L_BMap = "filename.png"
//#declare Forearm_R_BMap  = "filename.png"
//#declare Forearm_L_BMap  = "filename.png"
//#declare Hand_R_BMap     = "filename.png"
//#declare Hand_L_BMap     = "filename.png"
//#declare Thigh_R_BMap    = "filename.png"
//#declare Thigh_L_BMap    = "filename.png"
//#declare Calf_R_BMap     = "filename.png"
//#declare Calf_L_BMap     = "filename.png"
//#declare Foot_R_BMap     = "filename.png"
//#declare Foot_L_BMap     = "filename.png"


/********************************************************
  Body Part Options
********************************************************/

// Ears - 2 = Normal Ears, 1=Replace ears with small lumps as if under a swimming cap, 0 = No ears
//#declare BM_Ears=2;

// Eyes - 1=Normal 0=No Eyes
//#declare BM_Eyes=1;

// Nose - Range : 0 - 1.25 Size of Nose
//#declare BM_Nose=.5;

// Face - 1 = Normal Face Structure, 0 = Removes Nose and Lips
//#declare BM_Face=2;

// Teeth - 0 = No Teeth, 1 = Teeth
//#declare BM_Teeth=1;

// Jowls - Range : 0 - 3 Mass added to side of jaw.
//#declare BM_Jowls=0;

// Navel - -1 = Inverted Navel, 0 = No Navel, 1 = Protruding Navel
// #declare BM_Navel=0;

// Nipples - : 0 = No Nipples, 1=Nipples
// #declare BM_Nipples=0;

// Head - 1 = Normal Head, 0 = No Head, -1 = Guides
//#declare BM_Head_Mass=1;

// Torso - 1 = Normal Torso, 0 = No Torso, -1 = Guides
//#declare BM_Torso_Mass=1;

// Right Upperarm - 1 = Normal, 0 = Amputated, -1=Guide
//#declare BM_R_Upperarm_Mass=1;

// Right Forearm - 1 = Normal, 0 = Amputated, -1=Guide
//#declare BM_R_Forearm_Mass=1;

// Right Hand - 1 = Normal, 0 = Amputated
//#declare BM_R_Hand=1;

// Left Upperarm - 1 = Normal, 0 = Amputated, -1=Guide
//#declare BM_L_Upperarm_Mass=1;

// Left Forearm - 1 = Normal, 0 = Amputated, -1=Guide
//#declare BM_L_Forearm_Mass=1;

// Left Hand  - 1 = Normal, 0 = Amputated
//#declare BM_L_Hand=1;

// Right Thigh - 1 = Normal, 0 = Amputated, -1=Guide
//#declare BM_R_Thigh_Mass=1;

// Right Calf - 1 = Normal, 0 = Amputated, -1=Guide
//#declare BM_R_Calf_Mass=1;

// Right Foot - 1 = Normal, 0 = Amputated
//#declare BM_R_Foot=1;

// Left Thigh - 1 = Normal, 0 = Amputated, -1=Guide
//#declare BM_L_Thigh_Mass=1;

// Left Calf - 1 = Normal, 0 = Amputated, -1=Guide
//#declare BM_L_Calf_Mass=1;

// Left Foot - 1 = Normal, 0 = Amputated
//#declare BM_L_Foot=1;

// Male Abdomen Muscle Flexing - 1 = On, 0 = off
//#declare BM_Flex=1;

// Female T-Shirt - 1 = On, 0 = Off
//#declare BM_TShirt=0;

// Finger Nails - 1 = On, 0 = Off
// #declare BM_Nails=1;

// Apply Iamge Maps to Right Hand Fingers - 1=On, 0=Off
//#declare BM_Map_R_Finger=1;

// Apply Iamge Maps to Left Hand Fingers - 1=On, 0=Off
//#declare BM_Map_L_Finger=1;

/********************************************************
  Body Part Objects
********************************************************/

//#declare BM_Head_Object=object{BM_Head_Object}
//#declare BM_Neck_Object=object{BM_Neck_Object}
//#declare BM_Torso_Object=object{BM_Torso_Object}
//#declare BM_Abdomen_Object=object{BM_Abdomen_Object}
//#declare BM_Upperarm_R_Object=object {BM_Upperarm_R_Object}
//#declare BM_Upperarm_L_Object=object {BM_Upperarm_L_Object}
//#declare BM_Forearm_R_Object=object {BM_Forearm_R_Object}
//#declare BM_Forearm_L_Object=object {BM_Forearm_L_Object}
//#declare BM_Hand_R_Object=object {BM_Hand_R_Object}
//#declare BM_Hand_L_Object=object {BM_Hand_L_Object}
//#declare BM_Thigh_R_Object=object {BM_Thigh_R_Object}
//#declare BM_Thigh_L_Object=object {BM_Thigh_L_Object}
//#declare BM_Calf_R_Object=object {BM_Calf_R_Object}
//#declare BM_Calf_L_Object=object {BM_Calf_L_Object}
//#declare BM_Foot_R_Object=object {BM_Foot_R_Object}
//#declare BM_Foot_L_Object=object {BM_Foot_R_Object}

// End of Costume Definition File