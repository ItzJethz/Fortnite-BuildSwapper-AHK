#Requires AutoHotkey v2.0
#SingleInstance Force
SendMode("Event")

tapDelay := 0        ; length of the tap (ms)
smallGap := 0        ; tiny gap between synthetic events (ms)
outKey1 := "z"
outKey2 := "x"

down1 := false
down2 := false
inCombo := false     ; reentrancy guard

; ---------------------------
; Tray setup
; ---------------------------
A_TrayMenu.Delete()
A_TrayMenu.Add("Edit", EditScript)
A_TrayMenu.Add("Reload", ReloadScript)
A_TrayMenu.Add("Quit", QuitScript)

EditScript(*) {
    Run(A_ComSpec ' /c code "' . A_ScriptFullPath . '"', , 'Hide')
}

ReloadScript(*) {
    Reload
}

QuitScript(*) {
    ExitApp
}

; --- helper: safeTap(key, isCurrentlyDownVarRef) ---
; Performs a visible tap even if the key is already down:
; - if keyDown true: release it, do tap, then reapply down
; - else: just do down/tap/up
safeTap(key, &isDown) {
    global tapDelay, smallGap, inCombo
    ; prevent recursive entry
    if inCombo
        return
    inCombo := true

    if isDown {                      ; currently held: need to release first
        Send "{" key " up}"
        Sleep smallGap

        Send "{" key " down}"
        Sleep tapDelay
        Send "{" key " up}"
        Sleep smallGap

        ; restore held state so the other button still behaves as held
        Send "{" key " down}"
        isDown := true
    } else {
        Send "{" key " down}"
        Sleep tapDelay
        Send "{" key " up}"
    }

    inCombo := false
}

; ------------------------
; XBUTTON1 → Z
; ------------------------
X1_Down(*) {
    global down1, outKey1
    down1 := true
    Send "{" outKey1 " down}"
}

X1_Up(*) {
    global down1, down2, outKey1, outKey2

    ; if we never saw Down, assume it happened (compatibility with flaky hardware)
    if !down1
        down1 := true

    wasHeld2 := down2
    down1 := false

    Send "{" outKey1 " up}"

    if wasHeld2 {
        ; perform a safe tap of outKey2 even though outKey2 is currently down
        safeTap(outKey2, &down2)
    }
}

; ------------------------
; XBUTTON2 → X
; ------------------------
X2_Down(*) {
    global down2, outKey2
    down2 := true
    Send "{" outKey2 " down}"
}

X2_Up(*) {
    global down1, down2, outKey1, outKey2

    ; if we never saw Down, assume it happened
    if !down2
        down2 := true

    wasHeld1 := down1
    down2 := false

    Send "{" outKey2 " up}"

    if wasHeld1 {
        safeTap(outKey1, &down1)
    }
}

Hotkey "*XButton1", X1_Down
Hotkey "*XButton1 Up", X1_Up
Hotkey "*XButton2", X2_Down
Hotkey "*XButton2 Up", X2_Up