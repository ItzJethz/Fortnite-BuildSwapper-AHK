# Fortnite Build Switch Helper – AutoHotkey Script

This AutoHotkey v2 script remaps your mouse side buttons to keyboard keys and adds a fast, reliable switching system for Fortnite building. It lets you hold one build piece, temporarily switch to another, and automatically return to the original piece the moment the temporary one is released. Designed for consistent structure swapping with zero missed inputs.

---

## Features

- Converts mouse side buttons into keyboard keys  
  - XButton1 → Z  
  - XButton2 → X
- Hold one build piece and temporarily switch to another
- Automatic return to the originally held build when the temporary key is released
- Ensures Fortnite receives clean keyboard key events instead of raw mouse inputs
- Corrects inconsistent hardware behavior on some mice
- Prevents stuck keys and recursive input loops
- Zero-delay processing for maximum responsiveness

This script does not automate gameplay or work as a macro. Each physical press generates a single matching output.

---

## Setup Instructions

1. **Install AutoHotkey v2**  
   - Download and install AutoHotkey v2 from [AutoHotkey](https://www.autohotkey.com/).

2. **Configure Fortnite Keybinds**  
   - Set your Fortnite Build Binds from your side buttons to **Z** and **X** or whatever you modify it to inside the script
   > (don't worry you will still use your mouse sidebuttons for building.

3. **Save and Run the Script**  
   - Save the `.ahk` file anywhere convenient.  
   - Run it with AutoHotkey v2. Optionally, place it in `shell:startup` to start automatically on login.

---

## Configuration

Adjust the output keys to match your Fortnite build keybinds if needed:

```ahk
outKey1 := "z"
outKey2 := "x"
```

These values must match the keys assigned to your building pieces inside Fortnite.

---

## How It Works In-Game

1. Hold your primary build piece (for example, Wall).  
2. Press the temporary build (for example, Stair).  
3. When the temporary key is released, the script immediately returns to the original held build.

Useful for fast building sequences such as:

- Wall → Stair → Wall  
- Floor → Stair → Floor  
- Any quick temporary structure swap during fights or movement

---

## Notes

- Designed for players using mouse side buttons (XButton1 / XButton2) for building.  
- Improves input consistency by guaranteeing clean press and release events.  
- Zero-delay logic provides fast switching without artificial timing.  
- Works on any mouse with standard side buttons.
