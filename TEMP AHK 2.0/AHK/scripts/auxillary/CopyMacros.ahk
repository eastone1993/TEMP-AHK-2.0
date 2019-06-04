#SingleInstance, force 
#NoTrayIcon

if !FileExist("%A_ScriptDir%\scripts\auxillary\CopyMacros")
{
	FileCreateDir, %A_ScriptDir%\CopyMacros
}

OnExit("ExitFunc")

ExitFunc() {
	FileRemoveDir, %A_ScriptDir%\CopyMacros, 1
	return 
}

CopyMacroFunc(ByRef macroVar) {
	macro := A_ScriptDir . "\CopyMacros\" . macroVar . ".txt"
	if FileExist(macro)
	{
		;MsgBox, It exists!
		FileDelete, %macro%
	}
	return 
}
;----------------------------------- COPY MACROS -------------------------------------------------------------------------------------------------------------
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;----------------------------------- 1 --------------------------------------------------------------------------------------------------------------
^+1::
global copy1, copy1x
Clipboard := 
Send ^c 
clipwait
copy1 := ClipboardAll 
copy1x := Clipboard 
CopyMacroFunc("macro1")
FileAppend, %copy1x%, %A_ScriptDir%\CopyMacros\macro1.txt 
return 

^!1::
global copy1
Clipboard := 
Clipboard := copy1
clipwait
Send, ^v
return 
;----------------------------------- 2 -------------------------------------------------------------------------------------------------------------
^+2::
global copy2
Clipboard := 
Send ^c 
clipwait
copy2 := ClipboardAll 
copy2x := Clipboard 
CopyMacroFunc("macro2")
FileAppend, %copy2x%, %A_ScriptDir%\CopyMacros\macro2.txt 
return 

^!2::
global copy2
Clipboard :=
Clipboard := copy2
clipwait 
Send, ^v 
return 
;----------------------------------- 3 -------------------------------------------------------------------------------------------------------------
^+3::
global copy3
Clipboard := 
Send ^c 
clipwait
copy3 := ClipboardAll 
copy3x := Clipboard 
CopyMacroFunc("macro3")
FileAppend, %copy3x%, %A_ScriptDir%\CopyMacros\macro3.txt 
return 

^!3::
global copy3
Clipboard := 
Clipboard := copy3
clipwait
Send, ^v
return 
;----------------------------------- 4 -------------------------------------------------------------------------------------------------------------
^+4::
global copy4
Clipboard := 
Send ^c 
clipwait
copy4 := ClipboardAll 
copy4x := Clipboard 
CopyMacroFunc("macro4")
FileAppend, %copy4x%, %A_ScriptDir%\CopyMacros\macro4.txt 
return 

^!4::
global copy4
Clipboard := 
Clipboard := copy4
clipwait
Send, ^v
return 
;----------------------------------- 5 -------------------------------------------------------------------------------------------------------------
^+5::
global copy5
Clipboard := 
Send ^c 
clipwait
copy5 := ClipboardAll 
copy5x := Clipboard 
CopyMacroFunc("macro5")
FileAppend, %copy5x%, %A_ScriptDir%\CopyMacros\macro5.txt 
return 

^!5::
global copy5
Clipboard := 
Clipboard := copy5
clipwait
Send, ^v
return 
;----------------------------------- 6 -------------------------------------------------------------------------------------------------------------
^+6::
global copy6
Clipboard := 
Send ^c 
clipwait
copy6 := ClipboardAll 
copy6x := Clipboard 
CopyMacroFunc("macro6")
FileAppend, %copy6x%, %A_ScriptDir%\CopyMacros\macro6.txt 
return 

^!6::
global copy6
Clipboard := 
Clipboard := copy6
clipwait
Send, ^v
return 
;----------------------------------- 7 -------------------------------------------------------------------------------------------------------------
^+7::
global copy7
Clipboard := 
Send ^c 
clipwait
copy7 := ClipboardAll 
copy7x := Clipboard 
CopyMacroFunc("macro7")
FileAppend, %copy7x%, %A_ScriptDir%\CopyMacros\macro7.txt 
return 

^!7::
global copy7
Clipboard := 
Clipboard := copy7
clipwait
Send, ^v
return 
;----------------------------------- 8 -------------------------------------------------------------------------------------------------------------
^+8::
global copy8
Clipboard := 
Send ^c 
clipwait
copy8 := ClipboardAll
copy8x := Clipboard  
CopyMacroFunc("macro8")
FileAppend, %copy8x%, %A_ScriptDir%\CopyMacros\macro8.txt 
return 

^!8::
global copy8
Clipboard := 
Clipboard := copy8
clipwait
Send, ^v
return 
;----------------------------------- 9 -------------------------------------------------------------------------------------------------------------
^+9::
global copy9
Clipboard := 
Send ^c 
clipwait
copy9 := ClipboardAll 
copy9x := Clipboard 
CopyMacroFunc("macro9")
FileAppend, %copy9x%, %A_ScriptDir%\CopyMacros\macro9.txt 
return 

^!9::
global copy9
Clipboard := 
Clipboard := copy9
clipwait
Send, ^v
return 
;----------------------------------- 0 -------------------------------------------------------------------------------------------------------------
^+0::
global copy0
Clipboard := 
Send ^c 
clipwait
copy0 := ClipboardAll
copy0x := Clipboard  
CopyMacroFunc("macro0")
FileAppend, %copy0x%, %A_ScriptDir%\CopyMacros\macro0.txt 
return 

^!0::
global copy0
Clipboard := 
Clipboard := copy0
clipwait
Send, ^v
return 