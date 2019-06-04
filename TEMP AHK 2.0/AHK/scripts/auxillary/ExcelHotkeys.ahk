#SingleInstance, force 
#NoTrayIcon

;----------------------------------- SCRIPT FUNCTIONS -------------------------------------------------------------------------------------------------------------

ActiveCheck() {
	if WinActive("ahk_class XLMAIN") {
		return   
	}
	else {
		MsgBox, MUST HAVE EXCEL OPEN 
		exit 
	}
}

ActivePaste() {
	if WinActive("Paste Special") {
		return
	}
	else {
		MsgBox, Stopped Script PASTE
		exit 
	}
}


ActiveSave() {
	if WinActive("Save As") {
		return
	}
	else {
		MsgBox, Stopped Script SAVE 
		exit 
	}
}


;----------------------------------- EXCEL FUNCTIONS -------------------------------------------------------------------------------------------------------------
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;----------------------------------- FILE SCRUBBING -------------------------------------------------------------------------------------------------------------
^+q::
;enables editing 
Send !f
sleep, 250
Send i
sleep, 250
Send e
sleep, 250

;resets to main window 
Send {Esc}{Esc}{Esc}
sleep, 500

;scrubbing block 
Send ^{Home}
sleep, 500
Send, ^+{End}
sleep, 250
Send ^c
sleep, 250
Send +{F11}
sleep, 250
Send ^!v
sleep, 250
Send v
Send {enter}
sleep, 250

;sorts file to eliminate blank lines 
Send ^{Home}
sleep, 250
Send, {down}
sleep, 250
Send ^+{End}
sleep, 250
Send {alt}
sleep, 250
Send a 
sleep, 250
send sa 
sleep, 500

Return

;----------------------------------- ALL IN ONE SCRUBBING AND SAVING -------------------------------------------------------------------------------------------------------------
^+l::

ActiveCheck()
;enables editing 
Send !f
sleep, 250
ActiveCheck()
Send i
sleep, 250
ActiveCheck()
Send e
sleep, 250

ActiveCheck()
;resets to main window 
Send {Esc}{Esc}{Esc}
sleep, 500

ActiveCheck()
;scrubbing block 
Send ^{Home}
sleep, 500
ActiveCheck()
Send, ^+{End}
sleep, 250
ActiveCheck()
Send ^c
sleep, 250
ActiveCheck()
Send +{F11}
sleep, 250
ActiveCheck()
Send ^!v
sleep, 250
Send v
Send {enter}
sleep, 250

;ActiveCheck()
;sorts file to eliminate blank lines 
Send ^{Home}
sleep, 250
ActiveCheck()
Send, {down}
sleep, 250
ActiveCheck()
Send ^+{End}
sleep, 250
ActiveCheck()
Send {alt}
sleep, 250
ActiveCheck()
Send a 
sleep, 250
ActiveCheck()
send sa 
sleep, 500

;ActiveCheck()
;saving block 
Send {F12}
sleep, 500
Send {Esc}
sleep, 250
Send {F12}
sleep, 500

Send {F4}
Send {F6}{F6}{F6}{F6}{F6}
sleep, 500
Send d ;resets file type
sleep 100
Send c ;sets file type to csv 
Send !d ;moves to address bar 
sleep, 250

Send ^a
sleep, 250

Send %A_Desktop%\Rosters ;file path
Send, {enter}
sleep, 250

Send {Tab}{Tab}{Tab}{Tab}{Tab}{Tab} ;navigates back to filename bar 
;MsgBox, Done
Return

^+i::
Send !f
sleep, 250
ActiveCheck()
Send i
sleep, 250
ActiveCheck()
Send e
sleep, 250

ActiveCheck()
;resets to main window 
Send {Esc}{Esc}{Esc}
sleep, 500


Send {F12}
sleep, 250

;saving block 
Send !d ;moves to address bar 
sleep, 250

Send ^a
sleep, 250

Send %A_Desktop%\Rosters ;file path
Send, {enter}
sleep, 250

Send {Tab}{Tab}{Tab}{Tab}{Tab}{Tab} ;navigates back to filename bar 
;MsgBox, Done
Return