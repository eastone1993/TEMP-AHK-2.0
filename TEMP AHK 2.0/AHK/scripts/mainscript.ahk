#Persistent
#SingleInstance, force 
#Include %A_WorkingDir%\lib\ixlsearch.ahk 
#IfWinNotExist, `%A_ScriptDir`%\auxillary\CopyMacros.ahk
{
	Run, %A_ScriptDir%\auxillary\CopyMacros.ahk  ;launches the Copy Macros script found in the auxillary folder 
}
#IfWinNotExist, `%A_ScriptDir`%\auxillary\ExcelHotkeys.ahk 
{
	Run, %A_ScriptDir%\auxillary\ExcelHotkeys.ahk ;launches the Excel Hotkeys script found in the auxillary folder 
}
#IfWinNotExist, `%A_ScriptDir`%\auxillary\searchkey.ahk 
{
	Run, %A_ScriptDir%\auxillary\searchkey.ahk ;launches the searchkey script found in the auxillary folder 
}

OnExit("ExitFunc")

ExitFunc() { ;this will close the 3 previously launched script upon script launch 
	DetectHiddenWindows, On 
	WinClose, %A_ScriptDir%\auxillary\CopyMacros.ahk ahk_class AutoHotkey
	WinClose, %A_ScriptDir%\auxillary\ExcelHotkeys.ahk ahk_class AutoHotkey 
 	WinClose, %A_ScriptDir%\auxillary\searchkey.ahk ahk_class AutoHotkey
	return 
}

;this will allow the temps to enter in their own initials upon initial AHK startup 
Iniread, user_initials, settings.ini, Settings, initials
;MsgBox % user_initials 

if (user_initials=0)
{
	InitialsLabel: 
	InputBox, user_initials, User Initials, Please enter in your initials!
	if ErrorLevel 
		Goto, InitialsLabel ;this forces the user to enter in their initials. 
	IniWrite, %user_initials%, settings.ini, Settings, initials
}

;MsgBox, New Window: %nw%   sr:%sendr%   sm:%subm%   sf:%sfor%

;----------------------------------- SPELL CORRECT -------------------------------------------------------------------------------------------------------------
::signin::sign-in
:*?:sign in::sign-in 
:*?:recieve::receive 
::setup::set-up
::checkin::check-in
:*?:email::e-mail
:*?:seperate::separate
:*?:reccommend::recommend 
::ixl::IXL 
::teh::the 
::id::ID 
::ok::okay 
::managment::management 
:*?:neccessary::necessary
:*:alot::a lot 
::can not::cannot 
::math::Math 
::ela::ELA
::science::Science 
::social studies::Social Studies 
::spanish::Spanish 
:?*:login::sign-in
::Thanks::Thank you
::i::I
::HI::Hi

;----------------------------------- DATE FUNCTION -------------------------------------------------------------------------------------------------------------
:R*?:ddd::
FormatTime, CurrentDateTime,, MM/dd/yyyy
SendInput %CurrentDateTime% + %user_initials%--------------------------------------------------------------------------{enter}{enter}{enter}{enter}{Up}{Up}
Return
;----------------------------------- SEARCH FUNCTIONS -------------------------------------------------------------------------------------------------------------
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;----------------------------------- PHONE NUMBER SEARCH -------------------------------------------------------------------------------------------------------------
/*
^+p::
Clipboard := 
Send ^c 
ClipWait 
contents := Clipboard 
contentsTrimmed = %contents%
winactivate ahk_exe chrome.exe 
SFSearch(contentsTrimmed, nw)
return 
*/
;----------------------------------- TRIFORCE SEARCH -------------------------------------------------------------------------------------------------------------
;Triforce search was moved to an outside script to allow the reloading of itself 
;----------------------------------- GOOGLE SEARCH -------------------------------------------------------------------------------------------------------------
^+f::
Clipboard = 
Send ^c
ClipWait
contents := Clipboard
winactivate ahk_exe chrome.exe
Send ^t
sleep, 250
Send, ^v
Send, {enter}
Return
;----------------------------------- SHORTCUT SEARCH -------------------------------------------------------------------------------------------------------------
^+d::
; Identifies selected text as username or e-mail and searches for account
; Start off empty to allow ClipWait to detect when the text has arrived.
Clipboard =
Send ^c
; Wait for the clipboard to contain text.
ClipWait
contents := Clipboard
contentsTrimmed = %contents%
winactivate ahk_exe chrome.exe
Send, ^t
Variable := "https://secure.quia.com/servlets/quia.internal.userInfo.UserInfo?logicModule=1&email=" . contentsTrimmed
Clipboard := Variable
Send, ^v
Send, {enter}
Clipboard := email
Return

;-----------------------------------EOH-------------------------------------------------------------------------------------------------------------
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;-----------------------------------EOH-------------------------------------------------------------------------------------------------------------
;END_OF_HEADER
