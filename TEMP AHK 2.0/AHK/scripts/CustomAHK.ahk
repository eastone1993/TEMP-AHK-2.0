#Persistent
#NoTrayIcon
#SingleInstance, force 

DetectHiddenWindows, On
SetWorkingDir, %fpath%

#include %A_WorkingDir%\lib\customhotkeys.ahk 

script_path := A_ScriptDir . "\mainscript.ahk"
viewVal := CustomHotkeyViewer(script_path)

Gui, Add, Button, x15 y50 w120 h30 vReloadButton gRELOAD, Reload 
Gui, Add, Edit, x15 y200 w120 h30 r1 vPhraseEdit
Gui, Add, Edit, x150 y50 w400 h30 r30 WantTab vStringEdit
Gui, Add, Button, x15 y230 w120 h30 vEnterAHKEdit gBUILD, Construct New AutoHotkey
Gui, Add, Button, x15 y270 w120 h30 vPhraseDelete gDELETE, Delete AutoHotkey 
Gui, Add, Edit, x570 y50 r30 w400 ReadOnly vCustomRef
GuiControl,, CustomRef, % ViewerSettings(setting, viewVal)

Gui, Add, Radio, x610 y470 Checked vSetting0 gBOTH_ON, Show phrase and message 
Gui, Add, Radio, x765 y470 vSetting1 gPHRASE_ONLY, Show phrase only 

Gui, +Resize
Gui, Show, w1000 h500, AHK Creator 

return 
;----------------------------------- BUILD AND DELETE BUTTONS -------------------------------------------------------------------------------------------------------------
BUILD:
{ 
	Gui, Submit, NoHide 
	phrase := PhraseEdit  
	message := StringEdit
	CreateHotkey(script_path, phrase, message)
	Reload
	return 
}

DELETE:
{
	Gui, Submit, NoHide 
	phrase := PhraseEdit
	DeleteHotkey(script_path, phrase)
	Reload 
	return 
}
;----------------------------------- RELOAD BUTTON -------------------------------------------------------------------------------------------------------------
RELOAD:
{
	Reload
	return 
}
;----------------------------------- RADIO SETTINGS -------------------------------------------------------------------------------------------------------------
BOTH_ON:
{
	setting := 0
	GuiControl,, CustomRef, % ViewerSettings(setting, viewVal)
	return 
}

PHRASE_ONLY:
{
	setting := 1
	GuiControl,, CustomRef, % ViewerSettings(setting, viewVal)
	return 
}

GuiClose:
ExitApp 