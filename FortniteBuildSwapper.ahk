#Requires AutoHotkey v2.0
#SingleInstance Force
SendMode("Event")

; ============================================================
; CONFIG
; ============================================================
tapDelay  := 0
smallGap  := 0
outKey1   := "z"
outKey2   := "x"
fnExeName := "FortniteClient-Win64-Shipping.exe"

down1 := false
down2 := false
inCombo := false

; ============================================================
; FORTNITE WINDOW / PROCESS HANDLING
; ============================================================
isFNActive() {
    global fnExeName
    return WinActive("ahk_exe " fnExeName)
}

isFNRunning() {
    global fnExeName
    return ProcessExist(fnExeName)
}

; ============================================================
; SIMULATE REAL MOUSE BUTTONS
; ============================================================
sendNative(btn, state) {
    Send "{" btn " " state "}"
}

; ============================================================
; TAP / COMBO ENGINE
; ============================================================
safeTap(key, &isDown) {
    global tapDelay, smallGap, inCombo
    if inCombo
        return

    inCombo := true
    if isDown {
        Send "{" key " up}"
        Sleep smallGap
        Send "{" key " down}"
        isDown := true
    } else {
        Send "{" key " down}"
        Sleep tapDelay
        Send "{" key " up}"
    }
    inCombo := false
}

; ============================================================
; OUTPUT HANDLERS FOR FORTNITE CONTEXT
; ============================================================
handleFN_X1_Down(*) {
    global down1, outKey1
    down1 := true
    Send "{" outKey1 " down}"
}

handleFN_X1_Up(*) {
    global down1, down2, outKey1, outKey2

    if !down1
        down1 := true

    wasHeld2 := down2
    down1 := false

    Send "{" outKey1 " up}"

    if wasHeld2
        safeTap(outKey2, &down2)
}

handleFN_X2_Down(*) {
    global down2, outKey2
    down2 := true
    Send "{" outKey2 " down}"
}

handleFN_X2_Up(*) {
    global down1, down2, outKey1, outKey2

    if !down2
        down2 := true

    wasHeld1 := down1
    down2 := false

    Send "{" outKey2 " up}"

    if wasHeld1
        safeTap(outKey1, &down1)
}

; ============================================================
; ROUTER -> DECIDES BEHAVIOR BASED ON FORTNITE FOCUS
; ============================================================
X1_Down(*) {
    if isFNActive()
        return handleFN_X1_Down()
    sendNative("XButton1", "down")
}

X1_Up(*) {
    if isFNActive()
        return handleFN_X1_Up()
    sendNative("XButton1", "up")
}

X2_Down(*) {
    if isFNActive()
        return handleFN_X2_Down()
    sendNative("XButton2", "down")
}

X2_Up(*) {
    if isFNActive()
        return handleFN_X2_Up()
    sendNative("XButton2", "up")
}


; ============================================================
; HOTKEY BINDINGS
; ============================================================
Hotkey "*XButton1",    X1_Down
Hotkey "*XButton1 Up", X1_Up
Hotkey "*XButton2",    X2_Down
Hotkey "*XButton2 Up", X2_Up

; ============================================================
; AUTOEXIT HANDLER
; ============================================================
SetTimer(fnWaitLoop, 500)

fnWaitLoop() {
    if isFNRunning() {
        SetTimer fnWaitLoop, 0
        SetTimer fnCloseMonitor, 250
    }
}

fnCloseMonitor() {
    if !isFNRunning()
        ExitApp
}

; ============================================================
; TRAY MENU
; ============================================================
A_TrayMenu.Delete()
A_TrayMenu.Add("Edit",  (*) => Run(A_ComSpec ' /c code "' . A_ScriptFullPath . '"', , 'Hide'))
A_TrayMenu.Add("Reload", (*) => Reload())
A_TrayMenu.Add("Quit",   (*) => ExitApp())
