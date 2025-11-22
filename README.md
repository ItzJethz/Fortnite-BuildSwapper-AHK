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

This script does not automate gameplay. Each physical press generates a single matching output.

---

## Setup Instructions

### A: For users without AutoHotkey (ready-to-use executable)

1. Download the compiled `.exe` if included in your repository.  
2. Save it anywhere convenient.  
3. Run the file. Optionally place it in `shell:startup` to launch automatically on system startup.

---

### B: For AutoHotkey v2 users (recommended for custom tweaks)

1. Install AutoHotkey v2.  
2. Download or clone this repository.  
3. Open `src/build_switch.ahk`.  
4. Run it with AutoHotkey v2. Optionally place it in `shell:startup` to start automatically.

---

## Configuration

Adjust the output keys to match your Fortnite build keybinds:

\`\`\`ahk
outKey1 := "z"
outKey2 := "x"
\`\`\`

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

## Hotkeys Overview

| Action                                 | Input                   |
| -------------------------------------- | ----------------------- |
| Hold primary build piece               | XButton1 (mapped to Z)  |
| Hold temporary build piece             | XButton2 (mapped to X)  |
| Automatic return to original build     | Release temporary key   |

---

## Notes

- Designed for players using mouse side buttons (XButton1 / XButton2) for building.  
- Improves input consistency by guaranteeing clean press and release events.  
- Zero-delay logic provides fast switching without artificial timing.  
- Works on any mouse with standard side buttons.
