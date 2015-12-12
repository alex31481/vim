#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.



#IfWinActive ahk_exe mstsc.exe
Capslock::Ctrl

#IfWinActive



#IfWinActive ahk_exe gvim.exe
+Capslock::Capslock
Capslock::Ctrl
;Escape
;SetCapsLockState off
;send {Escape}
#IfWinActive


#IfWinActive ahk_exe sublime_text.exe
;Escape:
;SetCapsLockState off
;send {Escape}
+Capslock::Capslock
Capslock::Ctrl
#IfWinActive

#IfWinActive ahk_exe slack.exe
Capslock::Ctrl
#IfWinActive

#IfWinActive ahk_exe atom.exe
Capslock::Ctrl
#IfWinActive



#IfWinActive ahk_exe emacs.exe
;Escape:
;SetCapsLockState off
;send {Escape}
+Capslock::Capslock
Capslock::Ctrl
#IfWinActive


#IfWinActive ahk_exe idea64.exe
;Escape
;SetCapsLockState off
;send {Escape}
;return

Capslock::Ctrl

!j::sendInput {Down}
!k::sendInput {Up}
!h::sendInput {Left}
!l::sendInput {right}
!p::sendInput {Up}
!n::sendInput {Down}


#IfWinActive

#IfWinActive ahk_exe notepad.exe
Capslock::Ctrl

!j::sendInput {Down}
!k::sendInput {Up}
!h::sendInput {Left}
!l::sendInput {right}
!p::sendInput {Up}
!n::sendInput {Down}


#IfWinActive


#IfWinActive ahk_exe putty.exe
Capslock::Ctrl
#IfWinActive


#IfWinActive ahk_exe idea.exe
;Escape:
;SetCapsLockState off
;send {Escape}
;return
+Capslock::Capslock
Capslock::Ctrl
#IfWinActive

