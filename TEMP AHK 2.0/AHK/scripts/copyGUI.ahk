#Persistent
;#NoTrayIcon
#SingleInstance, force 

DetectHiddenWindows, On
SetWorkingDir, %fpath%

FileRead, macro1, %A_ScriptDir%\auxillary\CopyMacros\macro1.txt 

;ROW 1
Gui, Add, Text, x15 y15, Macro 1
Gui, Add, Edit, x15 y30 r5 w200 ReadOnly vmacro1
Gui, Add, Text, x230 y15, Macro 2
Gui, Add, Edit, x230 y30 r5 w200 ReadOnly vmacro2

;ROW 2
Gui, Add, Text, x15 y115, Macro 3 
Gui, Add, Edit, x15 y130 r5 w200 ReadOnly vmacro3
Gui, Add, text, x230 y115, Macro 4
Gui, Add, Edit, x230 y130 r5 w200 ReadOnly vmacro4

;ROW 3
Gui, Add, Text, x15 y215, Macro 5
Gui, Add, Edit, x15 y230 r5 w200 ReadOnly vmacro5
Gui, Add, Text, x230 y215, Macro 6
Gui, Add, Edit, x230 y230 r5 w200 ReadOnly vmacro6

;ROW 4
Gui, Add, Text, x15 y315, Macro 7
Gui, Add, Edit, x15 y330 r5 w200 ReadOnly vmacro7
Gui, Add, Text, x230 y315, Macro 8
Gui, Add, Edit, x230 y330 r5 w200 ReadOnly vmacro8

;ROW 5
Gui, Add, Text, x15 y415, Macro 9
Gui, Add, Edit, x15 y430 r5 w200 ReadOnly vmacro9
Gui, Add, Text, x230 y415, Macro 0 
Gui, Add, Edit, x230 y430 r5 w200 ReadOnly vmacro0

macroArray := ["macro1", "macro2", "macro3", "macro4", "macro5", "macro6", "macro7", "macro8", "macro9", "macro0"]
CheckAllMacros(macroArray)

Gui, Show, w445 h600, Copy Macros

return 

GuiClose:
ExitApp

;----------------------------------- FUNCTIONS -------------------------------------------------------------------------------------------------------------
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;------------------------------------------------------------------------------------------------------------------------------------------------
CheckForMacro(Byref macroName) {
	file := A_ScriptDir . "\auxillary\CopyMacros\" . macroName . ".txt"
	FileRead, fileContents, %file%
	if FileExist(file)
	{
		GuiControl,, % macroName, % fileContents   
	}
	return 
}

CheckAllMacros(Byref array) {
	for index, mac in array
	{
		CheckForMacro(mac)
	}
	return 
}
