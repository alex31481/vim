#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#IfWinActive ahk_exe gvim.exe
Capslock::Ctrl
#IfWinActive


#IfWinActive ahk_exe sublime_text.exe
Escape::
SetCapsLockState off

#IfWinActive

#IfWinActive ahk_exe idea64.exe
Escape::
SetCapsLockState off
send {Escape}
#IfWinActive


#IfWinActive ahk_exe idea.exe
Escape::
SetCapsLockState off
send {Escape}
#IfWinActive
