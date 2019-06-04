#SingleInstance, force 
#NoTrayIcon

ChromeActive() {
    if WinActive("ahk_class Chrome_WidgetWin_1")
    {
        return 
    }
    else 
    {
        ;MsgBox, Chrome Not Active.
        winactivate ahk_exe chrome.exe  
        ;exit
        return  
    }
}

OpenNewWindow() { ;ensures that new window is created properly when called 
	run, "chrome.exe" ;opens new window
	;sleep 500 ;give time to open window
	WinWait, New Tab,, 1 ;waits 2 seconds to see if new window is opened
	if ErrorLevel { ;if 2 seconds passes and no window has been opened, retry 
		i := i+1 ;iteration
		if (i<=5) { ;iterates no more than 5 times
			OpenNewWindow() ;try again 
		}
		else {
			MsgBox, Search unexpectedly failed. Try again. 
			exit ;after 5 times exit thread  
		}
	}
	else { ;continue 
		return 
	}
}

NewWindowSetting(Byref new_window) {
    if(new_window = true)
    { 
        OpenNewWindow()
        ;MsgBox, New window opened 
        winactivate ahk_exe chrome.exe
        sleep 500
        new_window := false 
        return    
    }
    else if(new_window = false)
    {
        ;MsgBox, Not opened 
        winactivate ahk_exe chrome.exe 
        ChromeActive()
        Send, ^t
        ChromeActive()
        sleep 100
        return 
    }
    else 
    {
        ;MsgBox, DERP 
    }
}

SendRightSearchSetting(Byref sr) {
    if (sr = true)
    {
        ChromeActive()
        sleep 250
        ChromeActive()
        Send, #+{Right} 
    }
    return 
}

SFSearch(Byref contents, Byref new_window) {
    NewWindowSetting(new_window)
    ChromeActive()
    var1 := "https://ixl.my.salesforce.com/_ui/search/ui/UnifiedSearchResults?searchType=2&sen=0JZ&sen=001&sen=02s&sen=068&sen=003&sen=00T&sen=00U&sen=005&sen=500&sen=00O&str=" . contents
    var2 := var1 . "&isdtp=vw&isWsVw=true&nonce=02541659de9dde0d96e44d154840e14be6f2bb3fcc1022859c569e3e55629581&sfdcIFrameOrigin=https%3A%2F%2Fixl.my.salesforce.com"
    ClipWait
    ChromeActive()
    Clipboard := var2
    sleep, 500 ;wait for page to load
    ChromeActive()
    Send, ^v
    ChromeActive()
    Send, {enter}
    Clipboard := contents 
    return 
}

SubmanSearch(Byref contents, Byref new_window) {
    NewWindowSetting(new_window)
    ChromeActive()
    sleep 150
    ChromeActive()
    Clipboard := "https://secure.quia.com/actions/subManager/search/sub"
    ChromeActive()
    Send, ^v
    Send, {enter}
    ChromeActive()
    Clipboard :=
    sleep, 1500 ;wait for page to load
    ChromeActive()
    Clipboard := contents
    clipwait 
    ChromeActive()
    Send {Tab 10} ;tab down for the win
    sleep 100
    ChromeActive()
    Send, ^v
    ChromeActive()
    Send, {enter}
    return 
}

SubmanAccountSearch(Byref contents, Byref new_window) {
    NewWindowSetting(new_window)
    ChromeActive()
    Variable := "https://secure.quia.com/actions/subManager/account/view/" . contents
    ClipWait    
    Clipboard := Variable
    sleep, 500
    ChromeActive()
    Send, ^v
    ChromeActive()
    Send, {enter}
    return 
}

QuiaSearch(Byref contents, Byref new_window) {
    NewWindowSetting(new_window)
    Variable := "https://secure.quia.com/servlets/quia.internal.userInfo.UserInfo?logicModule=1&email=" . contents
    ClipWait
    Clipboard := Variable
    ChromeActive()
    Send, ^v
    Send, {enter}
    Clipboard := contents
    return 
}

UserSearch(Byref contents, Byref new_window) {
    NewWindowSetting(new_window)
    page := "https://secure.quia.com/servlets/quia.internal.userInfo.UserInfo?logicModule=1&username=" . contents
    Clipboard := page
    Clipwait 
    ChromeActive()
    Send, ^v
    Send, {enter}
    return
}

IXLSearchSetting(Byref thing, Byref new_window, Byref sr, Byref sm, Byref sf, Byref q) {
    thing := Trim(thing)
    new_window_setting := new_window ;saves new_window's mode 
    if RegExMatch(thing, "[\w-_.]+@(?:\w+(?::\d+)?\.){1,3}(?:\w+\.?){1,2}", contents) {
        QuiaSearch(contents, new_window)
        SFSearch(contents, new_window)
        ;MsgBox, subman 
        if(q = true)
        {
            SFSearch(contents, new_window)
        }
        if(sm = true)
        {
            ;MsgBox, subman runs 
            SubmanSearch(contents, new_window)
        }
        ;MsgBox, No subman 
        ;send right setting 
        ;SendRightSearchSetting(sr)
    }
    else if RegExMatch(thing, "[A]\d{2}[-]", needle) ;account number with prefix
    {
        if(sf = true)
        {
           Loop, Parse, thing, -
            {
                if(A_Index=2)
                    anum := A_LoopField
            }
            SFSearch(anum, new_window) 
        }
        SubmanAccountSearch(thing, new_window)
    }
    else if RegExMatch(thing, "\b[0-9]+") ;account or case number
    {
        Length := StrLen(thing)
        ;MsgBox, %thing% %Length%
        if (Length=8) ;CASE NUMBERS ARE 8 DIGITS ALWAYS
            SFSearch(thing, new_window)
        else                            ;account number without prefix 
        {
            if(sf = true)
                SFSearch(thing, new_window)
            SubmanAccountSearch(thing, new_window)
        }   
    }
    else if RegExMatch(thing, "\w+[@]\w+|\w+", needle)  ;username 
    {
        userSearch(needle, new_window)
    }
    else 
    {
        MsgBox, Not a searchable item!
        return 
    }

    SendRightSearchSetting(sr)
    new_window := new_window_setting ;sets new_window to original mode 

    return 

}

/*
IXLSearchSetting(Byref thing, Byref new_window, Byref sr, Byref sm, Byref sf, Byref q) {
    
    new_window_setting := new_window ;saves new_window's mode 
    if RegExMatch(thing, "[\w-_.]+@(?:\w+(?::\d+)?\.){1,3}(?:\w+\.?){1,2}", contents) {
        QuiaSearch(contents, new_window)
        
        if(q = true)
        {
            SFSearch(contents, new_window)
        }
        ;MsgBox, subman 
        if(sm = true)
        {
            ;MsgBox, subman runs 
            SubmanSearch(contents, new_window)

        }
        ;MsgBox, No subman 
        ;send right setting 
        SendRightSearchSetting(sr)
    }
    else 
    {
        Length := StrLen(thing)
        ;MsgBox, %thing% %Length%
        if (Length=8) ;CASE NUMBERS ARE 8 DIGITS ALWAYS
        {
            SFSearch(thing, new_window)
            ;MsgBox, case number 
        }
        else ;ACCOUNT NUMBER WITHOUT PREFIX
        {
            if(sf = true)
            { 
                SFSearch(thing, new_window)
            }
            SubmanAccountSearch(thing, new_window)
        }

        ;send right setting 
        SendRightSearchSetting(sr)
    }

    new_window := new_window_setting ;sets new_window to original mode 

    return 

}

*/