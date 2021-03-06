#NoEnv
SetBatchLines, -1
SendMode Input
SetWorkingDir %A_ScriptDir%
Menu, TRAY, Icon, %A_WinDir%\system32\shell32.dll, 166
SetWinDelay, -1
SetControlDelay, -1
CoordMode, ToolTip, Screen
CoordMode, Pixel, Screen
CoordMode, Mouse, Screen
CoordMode, Caret, Screen
CoordMode, Menu, Screen

hotkey_window = !#Space

; acts on an individual control rather than the whole window
hotkey_control = ^#Space

; re-runs the last selected menu item at the current cursor position
hotkey_repeat_window = ^!#Space

;hotkey_window = #Space
;hotkey_repeat_window = ^!#Space

; have to be high DPI aware to work with real window coordinates
EnvGet, __COMPAT_LAYER, __COMPAT_LAYER
IfNotInString, __COMPAT_LAYER, HIGHDPIAWARE
{
	__COMPAT_LAYER .= (__COMPAT_LAYER = "" ? "" : " ") "HIGHDPIAWARE"
	EnvSet, __COMPAT_LAYER, %__COMPAT_LAYER%
	Reload
}

if !A_IsAdmin
	Menu, TRAY, Add, Run as &administrator, RunAsAdmin
loop 0
{
RunAsAdmin:
    if A_IsCompiled
        Run *RunAs "%A_ScriptFullPath%" /restart
    else
        Run *RunAs "%A_AhkPath%" /restart "%A_ScriptFullPath%"
return
}


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
	Menu, TweakResize, Add, Copy Dimensions, TweakResizeCopy
	Menu, TweakResize, Add, Paste Dimensions, TweakResizePaste
	Menu, TweakResize, Add, Resize "Normal", TweakResizeNormal
	Menu, TweakResize, Add, Resize "Normal" (centered), TweakResizeNormalCentered
	Menu, TweakResize, Add, Resize 50`%, TweakResizeScale50
	Menu, TweakResize, Add, Resize 200`%, TweakResizeScale200
	Menu, TweakResize, Add, Resize 640x480, TweakResize640x480
	Menu, TweakResize, Add, Resize 800x600, TweakResize800x600
	Menu, TweakResize, Add, Resize 1024x768, TweakResize1024x768
	Menu, TweakResize, Add, Resize 1152x864, TweakResize1152x864
	Menu, TweakResize, Add, Resize 1280x720, TweakResize1280x720
	Menu, TweakResize, Add, Resize 1280x1024, TweakResize1280x1024
	Menu, TweakResize, Add, Resize 1600x900, TweakResize1600x900
	Menu, TweakResize, Add, Resize 1600x1200, TweakResize1600x1200
	Menu, TweakResize, Add, Resize 1920x1080, TweakResize1920x1080
	Menu, TweakResize, Add, Resize 1920x1200, TweakResize1920x1200
Menu, Tweak, Add, Resize, :TweakResize

TweakX = Add
TweakY = Add
Loop, 2
{
		Menu, TweakStyle%TweakX%, Add, Always On Top, TweakStyle%TweakX%AlwaysOnTop
		Menu, TweakStyle%TweakX%, Add, Disabled, TweakStyle%TweakX%Disabled
		Menu, TweakStyle%TweakX%, Add, Standard Title Bar (border + dialog frame), TweakStyle%TweakX%Caption
		Menu, TweakStyle%TweakX%, Add, Border, TweakStyle%TweakX%Border
		Menu, TweakStyle%TweakX%, Add, Dialog Box Frame, TweakStyle%TweakX%Dlgframe
		Menu, TweakStyle%TweakX%, Add, Maximize Button, TweakStyle%TweakX%Maximizebox
		Menu, TweakStyle%TweakX%, Add, Minimize Button, TweakStyle%TweakX%Minimizebox
		Menu, TweakStyle%TweakX%, Add, Resizable, TweakStyle%TweakX%Sizebox
		Menu, TweakStyle%TweakX%, Add, System Menu, TweakStyle%TweakX%Sysmenu
		;Menu, TweakStyle%TweakX%, Add, , TweakStyle%TweakX%
	Menu, Tweak, Add, %TweakY% Styles, :TweakStyle%TweakX%
	TweakX = Del
	TweakY = Remove
}
Menu, Tweak, Add, Set Text, TweakText
Menu, Tweak, Add, Enable and Click, TweakClick
Menu, Tweak, Add, &Fullscreen, TweakFullscreen
Menu, Tweak, Add, UnFullscreen, TweakUnFullscreen
Menu, Tweak, Add, Center, TweakCenter
Menu, Tweak, Add, Move To 0`,0, TweakMove00
Menu, Tweak, Add, Maximum &Width, TweakMaxWidth
Menu, Tweak, Add, Get Style, TweakGetStyle
Menu, Tweak, Add, Get ExStyle, TweakGetExStyle
Menu, Tweak, Add, Get Controls, TweakGetControls
Menu, Tweak, Add
Menu, Tweak, Add, &Close, TweakClose
	Menu, TweakKill, Add, Yes I'm sure, TweakKillWin
Menu, Tweak, Add, Kill Process, :TweakKill
Menu, Tweak, Add
	Menu, TweakHelp, Add, Window: %hotkey_window%, HotkeyWindow
	Menu, TweakHelp, Add, Control: %hotkey_control%, HotkeyControl
	Menu, TweakHelp, Add, Repeat Window: %hotkey_repeat_window%, HotkeyRepeatWindow
Menu, Tweak, Add, Help, :TweakHelp
Menu, TRAY, Add, Help, :TweakHelp


; set a default so we don't have to check whether it's set
TweakLastCommand = TweakGetStyle

click_sound = %ProgramFiles%\DBN\hlwavpak\click.wav
IfNotExist %click_sound%
	click_sound = *64

Hotkey, %hotkey_window%, HotkeyWindow
Hotkey, %hotkey_control%, HotkeyControl
Hotkey, %hotkey_repeat_window%, HotkeyRepeatWindow

return ; ---------------------------------------------------------------------------------


HotkeyWindow:
	MouseGetPos, TweakX, TweakY, TweakWin, TweakControl, 2
	PixelGetColor, TweakColor, TweakX, TweakY, RGB
	Menu, Tweak, Show
return

; acts on an individual control rather than the whole window
HotkeyControl:
	TweakControl =
	MouseGetPos, TweakX, TweakY,, TweakWin, 2
	PixelGetColor, TweakColor, TweakX, TweakY, RGB
	Menu, Tweak, Show
return

; re-runs the last selected menu item at the current cursor position
HotkeyRepeatWindow:
	SoundPlay %click_sound%
	MouseGetPos, TweakX, TweakY, TweakWin, TweakControl, 2
	PixelGetColor, TweakColor, TweakX, TweakY, RGB
	Goto %TweakLastCommand%
return

TweakInvoked()
{
	global
	TweakLastCommand := A_ThisLabel
	IfWinNotExist ahk_id %TweakWin% ; set the last found window
	{
		SoundPlay *16
		Exit
	}
}


TweakTransColor100:
	TweakInvoked()
	WinSet, TransColor, %TweakColor%
return

TweakTransColor75:
TweakTransColor50:
TweakTransColor25:
	TweakInvoked()
	WinSet, TransColor, % TweakColor " " round(SubStr(A_ThisLabel,16)/100*255)
return

TweakTransColor0:
	TweakInvoked()
	WinSet, TransColor, OFF
return

TweakResizeScale50:
TweakResizeScale200:
	TweakInvoked()
	scale := SubStr(A_ThisLabel,17) / 100
	WinGetClientPos(TweakWin, 0+0, 0+0, w, h)
	WinMoveClientArea(w * scale, h * scale)
return

TweakResize640x480:
TweakResize800x600:
TweakResize1024x768:
TweakResize1152x864:
TweakResize1280x720:
TweakResize1280x1024:
TweakResize1600x900:
TweakResize1600x1200:
TweakResize1920x1080:
TweakResize1920x1200:
	TweakInvoked()
	WinMoveClientArea( bisect(SubStr(A_ThisLabel,12), "x", h)
	                 , h)
return

TweakResizeCopy:
	TweakInvoked()
	Clipboard := TweakResizeRead(TweakWin)
return

TweakResizePaste:
	TweakInvoked()
	if TweakResizeParse(Clipboard, TweakResizeCustom_X, TweakResizeCustom_Y, TweakWin)
		WinMoveClientArea(TweakResizeCustom_X, TweakResizeCustom_Y)
	else
		SoundPlay *16
return

TweakResizeCustom:
	TweakInvoked()
	if TweakResizeCustom_Ok !=
		return

	WinGetClientPos(TweakWin, 0+0, 0+0, TweakResizeCustom_X, TweakResizeCustom_Y)

	Gui, 70:Add, Edit, x6 y10 w200 h20 vTweakResizeCustom_Size, %TweakResizeCustom_X% x %TweakResizeCustom_Y%
	Gui, 70:Add, Button, x216 y9 w75 h23 Default gTweakResizeCustom_Ok, &OK
	; Generated using SmartGUI Creator 4.0 :D
	Gui, 70:+LabelTweakResizeCustom +ToolWindow +AlwaysOnTop
	Gui, 70:Show, x%TweakX% y%TweakY% h43 w303, Resize
	
	TweakResizeCustom_Ok = 0
	While TweakResizeCustom_Ok == 0
		Sleep, 50
	
	Gui, 70:Destroy

	if TweakResizeCustom_Ok = 1
		WinMoveClientArea(TweakResizeCustom_X, TweakResizeCustom_Y)
	
	TweakResizeCustom_Ok =
return
TweakResizeCustomEscape:
TweakResizeCustomClose:
	TweakResizeCustom_Ok = -1
return
TweakResizeCustom_Ok:
	Gui, Submit, Nohide
	if TweakResizeParse(TweakResizeCustom_Size, TweakResizeCustom_X, TweakResizeCustom_Y, TweakWin)
	{
		TweakResizeCustom_Ok = 1
		return
	}
	SoundPlay *16
return

TweakResizeRead(TweakWin)
{
	WinGetClientPos(TweakWin, 0+0, 0+0, w, h)
	return w " x " h
}
TweakResizeParse(input, ByRef w, ByRef h, TweakWin)
{
	if !RegExMatch(input, "^\s*[a-zA-Z]*\s*(?P<w>\d+)(?P<wp>%?)(?:\s*|\s*[a-zA-Z]+\s*|\s*,\s*)(?P<h>\d+)(?P<hp>%?)\s*$", match_)
		return false
	w := match_w
	h := match_h
	if (match_wp != "" && match_hp != "")
	{
		WinGetClientPos(TweakWin, 0+0, 0+0, current_w, current_h)
		if (match_wp != "")
			w := w / 100 * current_w
		if (match_hp != "")
			h := h / 100 * current_h
	}
	return true
}

TweakResizeNormal:
TweakResizeNormalCentered:
	TweakInvoked()
	m := GetMonitorInfo(MonitorFromPoint(TweakX, TweakY, 1))
	m.w := m.work_right - m.work_left
	m.h := m.work_bottom - m.work_top
	w := {w: m.w * 0.75, h: m.h * 0.75}
	if A_ThisLabel = TweakResizeNormalCentered
	{
		w.x := m.work_left + m.w * 0.125
		w.y := m.work_top + m.h * 0.125
	}
	WinMove,,, w.x, w.y, w.w, w.h
return

TweakStyleChange(num, attribute = "Style") {
	WinSet, %attribute%, % (TweakStyleIsAdd() ? "+" : "-") num
}
TweakStyleIsAdd() {
	return SubStr(A_ThisLabel,11,3) == "Add"
}

TweakStyleAddCaption:
TweakStyleDelCaption:
	TweakInvoked()
	TweakStyleChange(0xC00000)
return

TweakStyleAddBorder:
TweakStyleDelBorder:
	TweakInvoked()
	TweakStyleChange(0x800000)
return

TweakStyleAddDlgframe:
TweakStyleDelDlgframe:
	TweakInvoked()
	TweakStyleChange(0x400000)
return

TweakStyleAddMaximizebox:
TweakStyleDelMaximizebox:
	TweakInvoked()
	TweakStyleChange(0x10000)
return

TweakStyleAddMinimizebox:
TweakStyleDelMinimizebox:
	TweakInvoked()
	TweakStyleChange(0x20000)
return

TweakStyleAddSizebox:
TweakStyleDelSizebox:
	TweakInvoked()
	TweakStyleChange(0x40000)
return

TweakStyleAddSysmenu:
TweakStyleDelSysmenu:
	TweakInvoked()
	TweakStyleChange(0x80000)
return

TweakStyleAddDisabled:
TweakStyleDelDisabled:
	TweakInvoked()
	TweakStyleChange(0x8000000)
return
TweakStyleAddAlwaysOnTop:
TweakStyleDelAlwaysOnTop:
	TweakInvoked()
	Loop 4
	{
		WinSet, AlwaysOnTop, % TweakStyleIsAdd() ? "On" : "Off"
		if ErrorLevel
			SoundPlay *16
		Sleep 200
	}
return


TweakText:
	TweakInvoked()
	_TweakText()
return
_TweakText()
{
	WinGetTitle text
	InputBox, text, Set Text, Change the "text" attribute:,,,,,,,, %text%
	if ErrorLevel
		return
	WinSetTitle %text%
}


TweakClick:
	TweakInvoked()
	WinSet, Style, -0x8000000
	ControlClick,, ahk_id %TweakWin%,,,, NA
return


TweakFullscreen:
	TweakInvoked()
	_TweakFullscreen()
return
_TweakFullscreen()
{
	WinMaximize
	WinSet, Style, -0xC00000
	WinSet, Style, -0x40000
	SysGet, m, Monitor
	WinGetClass, TweakWinClass
	if TweakWinClass = Photo_Lightweight_Viewer
	{
		mTop -= 30
		mBottom += 157 - 130
	}
	WinMoveClientArea(mRight - mLeft, mBottom - mTop, mLeft, mTop)
	Sleep 250
	WinMoveClientArea(mRight - mLeft, mBottom - mTop, mLeft, mTop)
}

TweakUnFullscreen:
	TweakInvoked()
	WinSet, Style, +0xC00000
	WinSet, Style, +0x40000
	WinRestore
return

TweakMove00:
	TweakInvoked()
	WinMoveClientArea("", "", 0, 0)
return

TweakCenter:
	TweakInvoked()
	_TweakCenter()
return
_TweakCenter()
{
	global TweakWin
	monitor := MonitorIndexFromWindow(TweakWin)
	if monitor =
	{
		SoundPlay *16
		return
	}
	SysGet, m, Monitor, %monitor%
	WinMoveClientCenter(mLeft + (mRight-mLeft)//2, mTop + (mBottom-mTop)//2)
}

TweakMaxWidth:
	TweakInvoked()
	_TweakMaxWidth()
return
_TweakMaxWidth()
{
	global TweakWin
	monitor := MonitorIndexFromWindow(TweakWin)
	if monitor =
	{
		SoundPlay *16
		return
	}
	SysGet, m, Monitor, %monitor%
	WinMoveClientArea(mRight - mLeft, "", mLeft, "")
}


TweakGetStyle:
TweakGetExStyle:
	TweakInvoked()
	WinGet, TweakExStyle, ExStyle
	;Loop
return

TweakGetControls:
	WinGet, tmp, ControlList
	MsgBox, 0, %A_ScriptName%, %tmp%
	tmp=
return



TweakClose:
	TweakInvoked()
	WinClose
return

TweakKillWin:
	TweakInvoked()
	killApp(TweakWin)
return

killApp(hwnd)
{
	IfWinExist ahk_id %hwnd%
	{
		WinGetClass class
		if !(class == "Ghost")
			WinGet, pid, PID
		else
		{
			hwnd := HungWindowFromGhostWindow(WinExist())
			if hwnd
				WinGet, pid, PID, ahk_id %hwnd%
		}
	}
	if !pid
		return false

	Process, Close, %pid%
	return ErrorLevel ? false : true
}
; these two functions are undocumented
HungWindowFromGhostWindow(hwnd) {
	return DllCall("HungWindowFromGhostWindow", "Ptr", hwnd, "Ptr")
}
;GhostWindowFromHungWindow(hwnd) {
;	return DllCall("GhostWindowFromHungWindow", "Ptr", hwnd, "Ptr")
;}


WinMoveClientArea(W, H, X = "", Y = "")
{
	WinGetPos, WindowX, WindowY, WindowW, WindowH
	if (WindowX == "" || !WinGetClientPos(WinExist(), FrameL, FrameT, ClientW, ClientH))
	{
		SoundPlay *64
		return
	}
	FrameL -= WindowX
	FrameT -= WindowY
	FrameR := WindowW - ClientW - FrameL
	FrameB := WindowH - ClientH - FrameT
	
	if X !=
		X -= FrameL
	if Y !=
		Y -= FrameT
	if W !=
		W += FrameL + FrameR
	if H !=
		H += FrameT + FrameB

	WinMove,,, X, Y, W, H
}
WinMoveClientCenter(X, Y)
{
	WinGetPos, WindowX, WindowY, WindowW, WindowH
	if (WindowX == "" || !WinGetClientPos(WinExist(), FrameL, FrameT, ClientW, ClientH))
	{
		SoundPlay *64
		return
	}
	FrameL -= WindowX
	FrameT -= WindowY
	
	if X !=
		X -= FrameL + ClientW//2
	if Y !=
		Y -= FrameT + ClientH//2
	
	WinMove,,, X, Y
}

WinGetClientPos(hwnd, ByRef x, ByRef y, ByRef w, ByRef h)
{
	; STRUCT is used as a POINT for ClientToScreen and a RECT for GetClientRect
	if VarSetCapacity(STRUCT, 16, 0) < 16
	|| !DllCall("ClientToScreen", "Ptr", hwnd, "Ptr", &STRUCT) ; 0,0
	{
		x=
		y=
		w=
		h=
		return false
	}
	x := NumGet(STRUCT, 0, "Int")
	y := NumGet(STRUCT, 4, "Int")

	if !DllCall("GetClientRect", "Ptr", hwnd, "Ptr", &STRUCT)
	{
		w=
		h=
		return false
	}
	w := NumGet(STRUCT,  8, "Int")
	h := NumGet(STRUCT, 12, "Int")
	return true
}


; 0 = MONITOR_DEFAULTTONULL, 1 = MONITOR_DEFAULTTOPRIMARY, 2 = MONITOR_DEFAULTTONEAREST
MonitorFromWindow(hwnd, dwFlags = 2) {
	return DllCall("User32\MonitorFromWindow", "Ptr", hwnd, "UInt", dwFlags, "Ptr")
}
MonitorFromPoint(x, y, dwFlags = 2) {
	return DllCall("User32\MonitorFromPoint", "Int64", ((y & 0xFFFFFFFF) << 32) | (x & 0xFFFFFFFF), "UInt", dwFlags, "Ptr")
}

MonitorIndexFromWindow(hwnd, option = 2)
{
	hmonitor := MonitorFromWindow(hwnd, option)
	if (hmonitor == 0)
		return ""
	return MonitorHandleToIndex(hmonitor)
}

; converts a WinAPI HMONITOR to a monitor index acceptable by AHK's SysGet
MonitorHandleToIndex(hmonitor)
{
	global MonitorHandleToIndex__counter
	static callback
	Critical
	if callback =
	{
		callback := RegisterCallback("MonitorHandleToIndex__callback", "F")
		if callback =
			goto %crash%
	}

	; AHK's monitor indices are based on the order monitors are returned from EnumDisplayMonitors
	MonitorHandleToIndex__counter := 0
	success := DllCall("EnumDisplayMonitors", "Ptr", 0, "Ptr", 0, "Ptr", callback, "Ptr", hmonitor)
	if success =
		goto %crash%
	result := MonitorHandleToIndex__counter
	MonitorHandleToIndex__counter =
	Critical Off
	; EnumDisplayMonitors returns failure if the callback aborted the enumeration, which our callback does when it finds the right monitor
	if (success || result == 0)
		return ""
	return result
}
MonitorHandleToIndex__callback(hMonitor, hdcMonitor, lprcMonitor, dwData)
{
	global MonitorHandleToIndex__counter
	++MonitorHandleToIndex__counter
	; dwData is the 4th argument supplied to EnumDisplayMonitors, "hmonitor" 
	return dwData != hMonitor ; abort enumeration if it's the one we're looking for
}

GetMonitorInfo(hMonitor)
{
	;MONITORINFO:
	/* 
		4 UInt cbSize

		4 Int rcMonitor.left
		4 Int rcMonitor.top
		4 Int rcMonitor.right
		4 Int rcMonitor.bottom

		4 Int rcWork.left
		4 Int rcWork.top
		4 Int rcWork.right
		4 Int rcWork.bottom

		4 UInt dwFlags
	*/
	if VarSetCapacity(MONITORINFO, 40) < 40
		throw "out of memory"
	NumPut(40, MONITORINFO, 0, "UInt") ; set cbSize

	if !DllCall("User32\GetMonitorInfo", "Ptr", hMonitor, "Ptr", &MONITORINFO)
	{
		if ErrorLevel
			throw "GetMonitorInfo DllCall failed: " ErrorLevel
		throw LastErrorException("GetMonitorInfo failed: ")
	}

	out := {}
	static names = ["left", "top", "right", "bottom", "work_left", "work_top", "work_right", "work_bottom"]
	for i,name in names
		out[name] := NumGet(MONITORINFO, i*4, "Int")
	out.flags := NumGet(MONITORINFO, 36, "UInt")
	return out
}

bisect(string, delimiter, ByRef out_second_half, occurence = "L1", offset = 0)
{
	StringGetPos, pos, string, %delimiter%, %occurence%, offset
	if ErrorLevel
	{
		out_second_half := ""
		return string
	}
	; pos is 0-based, StringMid and SubStr are 1-based
	StringMid, out_second_half, string, pos + 1 + StrLen(delimiter)
	ErrorLevel := 0
	return SubStr(string, 1, pos)
}

LastErrorException(prefix = "", what = -2, extra = "") {
	return Exception(prefix LastErrorString(), what, extra)
}
LastErrorString(number = "")
{
	; probably x64 and unicode compatible
	if number =
		number := A_LastError

	; The importance of the IGNORE_INSERTS flag: http://blogs.msdn.com/b/oldnewthing/archive/2007/11/28/6564257.aspx
	if VarSetCapacity(string, 1024) >= 1024
	ret := DllCall("FormatMessage"
		, "UInt", 0x00001200 ; DWORD    dwFlags: FORMAT_MESSAGE_FROM_SYSTEM 0x00001000 | FORMAT_MESSAGE_IGNORE_INSERTS 0x00000200
		, "Ptr",  0          ; void*    lpSource
		, "UInt", number     ; DWORD    dwMessageId
		, "UInt", 0          ; DWORD    dwLanguageId: auto
		, "Str",  string     ; TSTR*    lpBuffer
		, "UInt", 1024       ; DWORD    nSize
		, "Ptr",  0)         ; va_list* Arguments
	
	StringReplace, string, string, `r`n, %A_Space%, All
	
	return string " (#" number ")"
}