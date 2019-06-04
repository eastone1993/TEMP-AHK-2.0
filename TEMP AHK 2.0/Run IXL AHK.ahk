#SingleInstance, force 
#NoTrayIcon

#IfWinNotExist, `%A_WorkingDir`%\AHK\IXLmainGui.ahk 
{
    Run, %A_WorkingDir%\AHK\IXLmainGui.ahk 
    ExitApp
} 

#IfWinExist, `%A_WorkingDir`%\AHK\IXLmainGui.ahk  
{
	ExitApp 
}