; Playing Dungeon Rampage with Joystick

; BUTTONS
; Joy1 = L1
; Joy2 = B
; Joy3 = A
; Joy4 = R1
; Joy5 = L2
; Joy6 = Y
; Joy7 = X
; Joy8 = R2
; Joy9 = START
; joy10 = SELECT

; AXIS
; Neutral = 49.6
; Up or Left = 0
; Down or Right = 100

#Persistent
#SingleInstance, Force
SetTimer, WatchJoystick, 10
SetTimer, WatchShift, 10
SetTimer, WatchAttack, 10
return



; WASD or Arrow Key - Movement and Mouse Move
WatchJoystick:
JoyX := GetKeyState("JoyX", "P") ; X-axis
JoyY := GetKeyState("joyY", "P") ; Y-axis
MouseMode := GetKeyState("Joy10", "P") ; SELECT

; MOUSE MOVEMENT
if (MouseMode)
{
	if (RightHeld)
	{
		Send, {Right up}
		RightHeld := false
	}
	if (LeftHeld) 
	{
	    Send, {Left up}
	    LeftHeld := false
	}
	if (L_Held) 
	{
	    Send, {Down up}
	    L_Held := false
	}
	if (UpHeld) 
	{
	    Send, {Up up}
	    UpHeld := false
	}

	MouseX := (JoyX - 50) * 0.5
	MouseY := (JoyY - 50) * 0.5
	MouseMove, MouseX, MouseY, 0, R
	return
}

; CHARACTER MOVEMENT

; RIGHT
if (JoyX > 55) 
{
    if (!RightHeld) 
    {
        Send, {Right down}
        RightHeld := true
    }
} 
else if (RightHeld) 
{
    Send, {Right up}
    RightHeld := false
}

; LEFT
if (JoyX < 45) 
{
    if (!LeftHeld) 
    {
        Send, {Left down}
        LeftHeld := true
    }
} 
else if (LeftHeld) 
{
    Send, {Left up}
    LeftHeld := false
}

; DOWN
if (JoyY > 55) 
{
    if (!DownHeld) 
    {
        Send, {Down down}
        DownHeld := true
    }
} 
else if (DownHeld) 
{
    Send, {Down up}
    DownHeld := false
}

; UP
if (JoyY < 45) 
{
    if (!UpHeld) 
    {
        Send, {Up down}
        UpHeld := true
    }
} 
else if (UpHeld) 
{
    Send, {Up up}
    UpHeld := false
}
return


 
; JKL or ZXC - Weapon Slot 
WatchAttack:
Joy2 := GetKeyState("Joy2", "P") ; B
Joy3 := GetKeyState("Joy3", "P") ; A
Joy4 := GetKeyState("Joy4", "P") ; R1
	 
; J
if (Joy2) 
{
    if (!J_Held) 
    {
        Send, {J down}
        J_Held := true
    }
} 
else if (J_Held) 
{
    Send, {J up}
    J_Held := false
}

; K
if (Joy3) 
{
    if (!K_Held) 
    {
        Send, {K down}
        K_Held := true
    }
} 
else if (K_Held) 
{
    Send, {K up}
    K_Held := false
}

; L
if (Joy4) 
{
    if (!L_Held) 
    {
        Send, {L down}
        L_Held := true
    }
} 
else if (L_Held) 
{
    Send, {L up}
    L_Held := false
}
return



; B - DUNGEON BUSTER
Joy1::Send, {B} ; L1



; 1 2 - Consummables
Joy6::Send, {1} ; Y
Joy7::Send, {2} ; X



; \ - Chat Log
Joy5::Send, {\} ; L2



; SHIFT
WatchShift:
Joy8 := GetKeyState("Joy8", "P") ; R2

if (Joy8) 
{
    if (!Shift_Held) 
    {
        Send, {Shift down}
        Shift_Held := true
    }
} 
else if (Shift_Held) 
{
    Send, {Shift up}
    Shift_Held := false
}
return




; LEFT MOUSE BUTTON
Joy9::Send, {LButton} ; SELECT