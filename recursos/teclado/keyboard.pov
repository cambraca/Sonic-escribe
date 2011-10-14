// Persistence of Vision Ray Tracer Scene Description File
// File: keyboard.pov
// Vers: 3.01 Watcom Win32
// Desc: Computer Keyboard
// Date: May 20, 1997
// Auth: Sonya Roberts
// Note: To use this file, just #include it in your scene then use object{Keyboard}
//       anyplace you desire.

#declare Keyboard=
object {
	union {
		union {
			difference {
				union {
					box {<-.75,0,-.25>,<.75,.1,.25>}		// Basic form of keyboard
					box {
						<-.75,0,-.25>,<.75,.1,.25>
						rotate x*5.5
						translate <0,-.025,0>
					}
					cylinder {					// Round off front edge of keyboard
						<-.75,.05,0>,<.75,.05,0>,.05
						translate <0,0,-.25>
					}
					cylinder {					// Round off back edge of keyboard
						<-.75,.025,0>,<.75,.025,0>,.075
						translate <0,0,.25>
					}
				}
				box {<-.74,.01,-.24>,<.74,.11,.24>}			// Hollow it out
				cylinder {<-.725,.05,-.3>,<.725,.05,-.3>,.005}		// Grooves around edge (seam marks)
				cylinder {<-.75,.05,-.31>,<-.75,.025,.36>,.0025}
				cylinder {<.75,.05,-.31>,<.75,.025,.36>,.0025}
			}
			height_field {
				tga "keyboard.tga"			// Height field of top of keyboard
				smooth
				texture {
					material_map {
						gif "keycolor.gif"
						texture {				// Raised Keys
							pigment {color Wheat*1.25}
						}
						texture {				// Lettering
							pigment {color Black}
						}
						texture {				// "Num Lock" Light
							pigment {color Green}
							finish {ambient 1}
						}
						texture {				// Caps and Scroll Lights (Unlit)
							pigment {color DarkGreen}
						}
						texture {				// Body of Keyboard
							pigment {color Wheat*1.5}
						}
					}
					rotate x*90
				}
				translate <-.5,-.5,-.5>			// translate and scale it to match top of box
				scale <1.5,.1,.5>
				translate <0,.1,0>
			}
			translate <0,0,.25>				// Position so origin along front edge
			rotate x*-10					// Tip slightly towards user
		}
		cone {
			<0,0,0>,.05,<0,.1,0>,.1				// Leg for Keyboard
			scale <1,1,.25>					// Flatten it front-to-back
			translate <-.65,0,.45>				// Move to back left of keyboard
		}
		cone {
			<0,0,0>,.05,<0,.1,0>,.1				// Leg for Keyboard
			scale <1,1,.25>					// Flatten it front-to-back
			translate <.65,0,.45>				// Move to back right of keyboard
		}
	pigment {color Wheat*1.5}
	}
}

