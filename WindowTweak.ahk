#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetBatchLines, -1
SetWinDelay, -1
SetControlDelay, -1


/*
*
 * Extended Window Styles
 *
#define WS_EX_DLGMODALFRAME     0x00000001L
#define WS_EX_NOPARENTNOTIFY    0x00000004L
#define WS_EX_TOPMOST           0x00000008L
#define WS_EX_ACCEPTFILES       0x00000010L
#define WS_EX_TRANSPARENT       0x00000020L
#if(WINVER >= 0x0400)
#define WS_EX_MDICHILD          0x00000040L
#define WS_EX_TOOLWINDOW        0x00000080L
#define WS_EX_WINDOWEDGE        0x00000100L
#define WS_EX_CLIENTEDGE        0x00000200L
#define WS_EX_CONTEXTHELP       0x00000400L

#endif * WINVER >= 0x0400 *
#if(WINVER >= 0x0400)

#define WS_EX_RIGHT             0x00001000L
#define WS_EX_LEFT              0x00000000L
#define WS_EX_RTLREADING        0x00002000L
#define WS_EX_LTRREADING        0x00000000L
#define WS_EX_LEFTSCROLLBAR     0x00004000L
#define WS_EX_RIGHTSCROLLBAR    0x00000000L

#define WS_EX_CONTROLPARENT     0x00010000L
#define WS_EX_STATICEDGE        0x00020000L
#define WS_EX_APPWINDOW         0x00040000L


#define WS_EX_OVERLAPPEDWINDOW  (WS_EX_WINDOWEDGE | WS_EX_CLIENTEDGE)
#define WS_EX_PALETTEWINDOW     (WS_EX_WINDOWEDGE | WS_EX_TOOLWINDOW | WS_EX_TOPMOST)

#endif * WINVER >= 0x0400 *

#if(_WIN32_WINNT >= 0x0500)
#define WS_EX_LAYERED           0x00080000

#endif * _WIN32_WINNT >= 0x0500 *


#if(WINVER >= 0x0500)
#define WS_EX_NOINHERITLAYOUT   0x00100000L // Disable inheritence of mirroring by children
#define WS_EX_LAYOUTRTL         0x00400000L // Right to left mirroring
#endif * WINVER >= 0x0500 *

#if(_WIN32_WINNT >= 0x0500)
#define WS_EX_COMPOSITED        0x02000000L
#define WS_EX_NOACTIVATE        0x08000000L
#endif * _WIN32_WINNT >= 0x0500 *
*/





	Menu, TweakTransColor, Add, Transparent Color, TweakTransColor100
	Menu, TweakTransColor, Add, Remaining portion 75`% transparent, TweakTransColor75
	Menu, TweakTransColor, Add, Remaining portion 50`% transparent, TweakTransColor50
	Menu, TweakTransColor, Add, Remaining portion 25`% transparent, TweakTransColor25
	Menu, TweakTransColor, Add, No Transparency, TweakTransColor0
Menu, Tweak, Add, Transparent Color, :TweakTransColor
	Menu, TweakResize, Add, Resize Custom, TweakResizeCustom
	Menu, TweakResize, Add, Resize 640x480, TweakResize640x480
	Menu, TweakResize, Add, Resize 800x600, TweakResize800x600
	Menu, TweakResize, Add, Resize 1024x768, TweakResize1024x768
	Menu, TweakResize, Add, Resize 1152x864, TweakResize1152x864
	Menu, TweakResize, Add, Resize 1280x720, TweakResize1280x720
	Menu, TweakResize, Add, Resize 1280x1024, TweakResize1280x1024
	Menu, TweakResize, Add, Resize 1600x900, TweakResize1600x900
	Menu, TweakResize, Add, Resize 1600x1200, TweakResize1600x1200
Menu, Tweak, Add, Resize, :TweakResize

TweakX = Add
TweakY = Add
Loop, 2
{
		Menu, TweakStyle%TweakX%, Add, Standard Title Bar (border + dialog frame), TweakStyle%TweakX%Caption
		Menu, TweakStyle%TweakX%, Add, Border, TweakStyle%TweakX%Border
		Menu, TweakStyle%TweakX%, Add, Dialog Box Frame, TweakStyle%TweakX%Dlgframe
		Menu, TweakStyle%TweakX%, Add, Maximize Button, TweakStyle%TweakX%Maximizebox
		Menu, TweakStyle%TweakX%, Add, Minimize Button, TweakStyle%TweakX%Minimizebox
		Menu, TweakStyle%TweakX%, Add, Resizable, TweakStyle%TweakX%Sizebox
		Menu, TweakStyle%TweakX%, Add, System Menu, TweakStyle%TweakX%Sysmenu
		Menu, TweakStyle%TweakX%, Add, Disabled, TweakStyle%TweakX%Disabled
		;Menu, TweakStyle%TweakX%, Add, , TweakStyle%TweakX%
	Menu, Tweak, Add, %TweakY% Styles, :TweakStyle%TweakX%
	TweakX = Del
	TweakY = Remove
}
Menu, Tweak, Add, &Fullscreen, TweakFullscreen
Menu, Tweak, Add, UnFullscreen, TweakUnFullscreen
Menu, Tweak, Add, Get Style, TweakGetStyle
Menu, Tweak, Add, Get ExStyle, TweakGetExStyle
Menu, Tweak, Add
Menu, Tweak, Add, &Close, TweakClose
	Menu, TweakKill, Add, Kill this Window, TweakKillWin
	Menu, TweakKill, Add, Kill this Window's Program, TweakKillApp
Menu, Tweak, Add, Kill, :TweakKill


return


^!#Space::
; +#Space::
	if TweakLastCommand =
	{
		SoundPlay, *16
		return
	}
	SoundPlay, %ProgramFiles%\DBN\hlwavpak\click.wav
	MouseGetPos, TweakX, TweakY, TweakWin, TweakControl, 2
	PixelGetColor, TweakColor, TweakX, TweakY, RGB
	Goto, %TweakLastCommand%
return

!#Space::
; #Space::
TweakShowMenu:
	MouseGetPos, TweakX, TweakY, TweakWin, TweakControl, 2
	PixelGetColor, TweakColor, TweakX, TweakY, RGB
	Menu, Tweak, Show
return


TweakTransColor100:
TweakLastCommand = %A_ThisLabel%
	WinSet, TransColor, %TweakColor%, ahk_id %TweakWin%
return

TweakTransColor75:
TweakLastCommand = %A_ThisLabel%
	WinSet, TransColor, %TweakColor% 191, ahk_id %TweakWin%
return

TweakTransColor50:
TweakLastCommand = %A_ThisLabel%
	WinSet, TransColor, %TweakColor% 128, ahk_id %TweakWin%
return

TweakTransColor25:
TweakLastCommand = %A_ThisLabel%
	WinSet, TransColor, %TweakColor% 61, ahk_id %TweakWin%
return

TweakTransColor0:
TweakLastCommand = %A_ThisLabel%
	WinSet, TransColor, OFF, ahk_id %TweakWin%
return

TweakResize640x480:
TweakLastCommand = %A_ThisLabel%
	WinMoveClientArea( TweakWin, 640, 480 )
return

TweakResize800x600:
TweakLastCommand = %A_ThisLabel%
	WinMoveClientArea( TweakWin, 800, 600 )
return

TweakResize1024x768:
TweakLastCommand = %A_ThisLabel%
	WinMoveClientArea( TweakWin, 1024, 768 )
return

TweakResize1152x864:
TweakLastCommand = %A_ThisLabel%
	WinMoveClientArea( TweakWin, 1152, 864 )
return

TweakResize1280x720:
TweakLastCommand = %A_ThisLabel%
	WinMoveClientArea( TweakWin, 1280, 720 )
return

TweakResize1280x1024:
TweakLastCommand = %A_ThisLabel%
	WinMoveClientArea( TweakWin, 1280, 1024 )
return

TweakResize1600x900:
TweakLastCommand = %A_ThisLabel%
	WinMoveClientArea( TweakWin, 1600, 900 )
return

TweakResize1600x1200:
TweakLastCommand = %A_ThisLabel%
	WinMoveClientArea( TweakWin, 1600, 1200 )
return

TweakResizeCustom:
TweakLastCommand = %A_ThisLabel%
	if TweakResizeCustom_Ok !=
		return

	Gui, 70:Add, Edit, x6 y10 w90 h20 vTweakResizeCustom_X, 
	Gui, 70:Add, Edit, x116 y10 w90 h20 vTweakResizeCustom_Y, 
	Gui, 70:Add, Text, x103 y12 w10 h15 , x
	Gui, 70:Add, Button, x216 y9 w75 h23 Default gTweakResizeCustom_Ok, &OK
	; Generated using SmartGUI Creator 4.0 :D
	Gui, 70:+LabelTweakResizeCustom +ToolWindow +AlwaysOnTop
	Gui, 70:Show, x%TweakX% y%TweakY% h43 w303, Resize
	
	TweakResizeCustom_Ok = 0
	While TweakResizeCustom_Ok == 0
		Sleep, 50
	
	Gui, 70:Destroy

	if TweakResizeCustom_Ok = 1
		WinMoveClientArea( TweakWin, TweakResizeCustom_X, TweakResizeCustom_Y )
	
	TweakResizeCustom_Ok =
return
TweakResizeCustomEscape:
TweakResizeCustomClose:
	TweakResizeCustom_Ok = -1
return
TweakResizeCustom_Ok:
	Gui, Submit, Nohide
	if TweakResizeCustom_X is integer
	{
		if TweakResizeCustom_Y is integer
		{
			TweakResizeCustom_Ok = 1
			return
		}
	}
	SoundPlay, *16
return


TweakStyleChange( Style )
{
	return ( SubStr( A_ThisLabel, 11, 3 ) = "Add" ? "+" : "-" ) . Style
}

TweakStyleAddCaption:
TweakStyleDelCaption:
TweakLastCommand = %A_ThisLabel%
	WinSet, Style, % TweakStyleChange(0xC00000), ahk_id %TweakWin%
return

TweakStyleAddBorder:
TweakStyleDelBorder:
TweakLastCommand = %A_ThisLabel%
	WinSet, Style, % TweakStyleChange(0x800000), ahk_id %TweakWin%
return

TweakStyleAddDlgframe:
TweakStyleDelDlgframe:
TweakLastCommand = %A_ThisLabel%
	WinSet, Style, % TweakStyleChange(0x400000), ahk_id %TweakWin%
return

TweakStyleAddMaximizebox:
TweakStyleDelMaximizebox:
TweakLastCommand = %A_ThisLabel%
	WinSet, Style, % TweakStyleChange(0x10000), ahk_id %TweakWin%
return

TweakStyleAddMinimizebox:
TweakStyleDelMinimizebox:
TweakLastCommand = %A_ThisLabel%
	WinSet, Style, % TweakStyleChange(0x20000), ahk_id %TweakWin%
return

TweakStyleAddSizebox:
TweakStyleDelSizebox:
TweakLastCommand = %A_ThisLabel%
	WinSet, Style, % TweakStyleChange(0x40000), ahk_id %TweakWin%
return

TweakStyleAddSysmenu:
TweakStyleDelSysmenu:
TweakLastCommand = %A_ThisLabel%
	WinSet, Style, % TweakStyleChange(0x80000), ahk_id %TweakWin%
return

TweakStyleAddDisabled:
TweakStyleDelDisabled:
TweakLastCommand = %A_ThisLabel%
	WinSet, Style, % TweakStyleChange(0x8000000), ahk_id %TweakWin%
return

TweakFullscreen:
WinSet, Style, -0xC00000, ahk_id %TweakWin%
WinSet, Style, -0x40000, ahk_id %TweakWin%
SysGet, Primary, Monitor
WinMoveClientArea( TweakWin, PrimaryRight - PrimaryLeft, PrimaryBottom - PrimaryTop, PrimaryLeft, PrimaryTop )
;WinMove, ahk_id %TweakWin%,, PrimaryLeft, PrimaryTop, 1920, 1200
PrimaryLeft =
PrimaryTop =
PrimaryRight =
PrimaryBottom =
return

TweakUnFullscreen:
WinSet, Style, +0xC00000, ahk_id %TweakWin%
WinSet, Style, +0x40000, ahk_id %TweakWin%
return



TweakGetStyle:
TweakGetExStyle:
TweakLastCommand = %A_ThisLabel%
	WinGet, TweakExStyle, ExStyle, ahk_id %TweakWin%
	;Loop
return



TweakClose:
TweakLastCommand = %A_ThisLabel%
	WinClose, ahk_id %TweakWin%
return

TweakKillWin:
TweakLastCommand = %A_ThisLabel%
	WinKill, ahk_id %TweakWin%
return

TweakKillApp:
TweakLastCommand = %A_ThisLabel%
/*
	TweakPID := ""

WinGetTitle, TweakWinTitle, ahk_id %TweakWin%

If ( RegExMatch( TweakWinTitle, "^.* \(Not Responding\)$" ) )
{
	SoundPlay, %ProgramFiles%\DBN\hlwavpak\remote_yes.wav
	Sleep, 300
	WinGetTitle, Title, A
	StringTrimRight, Title, Title, StrLen(" (Not Responding)")
	SetTitleMatchMode, 3
	DetectHiddenWindows, On
	IfWinExist, %Title%
		WinGet, TweakPID, PID, %Title%
	else
	{
		SoundPlay, %ProgramFiles%\DBN\hlwavpak\click1.wav
		Title := ""
		return
	}
	Title := ""
}

WinGet, TweakPID, PID, ahk_id %TweakWin%
if ( !TweakPID )
{
	Msgbox, 16, Error, Unable to determine what program this window belongs to.
	return
}

Process, Close, %TweakPID%
if ( errorlevel )
	SoundPlay, %ProgramFiles%\DBN\hlwavpak\die.wav
else
	SoundPlay, %ProgramFiles%\DBN\hlwavpak\alarm.wav
TweakPID := ""
*/
return



Prompt( Question, YesNo = true )
{
	;MsgBox, % YesNo ? 4 : 1, %Title%, %Question%

;	static 
;	Menu, DeleteAll, 
}

WinMoveClientArea(WindowID, W, H, X = "", Y = "")
{
	WinGetPos, WindowX, WindowY, WindowW, WindowH, ahk_id %WindowID%

	; used as a POINT for ClientToScreen and a RECT for GetClientRect
	if VarSetCapacity(STRUCT, 16, 0) < 16
		return

	DllCall("ClientToScreen", "Ptr", WindowID, "Ptr", &STRUCT) ; 0,0
	WindowFrameL := NumGet(STRUCT, 0, "Int") - WindowX
	WindowFrameT := NumGet(STRUCT, 4, "Int") - WindowY

	DllCall("GetClientRect", "Ptr", WindowID, "Ptr", &STRUCT)
	ClientW := NumGet(STRUCT,  8, "Int")
	ClientH := NumGet(STRUCT, 12, "Int")

	WindowFrameR := WindowW - ClientW - WindowFrameL
	WindowFrameB := WindowH - ClientH - WindowFrameT
	
	if X !=
		X -= WindowFrameL
	if Y !=
		Y -= WindowFrameT
	if W !=
		W += WindowFrameL + WindowFrameR
	if H !=
		H += WindowFrameT + WindowFrameB
	
	WinMove, ahk_id %WindowID%,, X, Y, W, H
}