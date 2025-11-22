# Fortnite Build Switch Helper (AutoHotkey v2)

This AutoHotkey v2 script converts your mouse side buttons into keyboard keys and adds a rapid switching mechanic designed for fast and consistent building in Fortnite. It ensures that temporary structure swaps instantly return to your original build piece without missed or stuck inputs.

---

## What This Script Does
- Converts XButton1 → Z  
- Converts XButton2 → X  
- Allows you to hold one build piece and temporarily switch to another  
- Automatically returns to the original build when the temporary key is released  
- Ensures Fortnite receives clean keyboard events instead of mouse button inputs  
- Corrects missing or inconsistent hardware signals  
- Prevents stuck keys and recursive input loops  
- Uses zero-delay timing for maximum responsiveness

This is not a macro. Each physical input produces one matching output.  
The script only guarantees that Fortnite receives your inputs cleanly and predictably.

---

## Installation
1. Install AutoHotkey v2.
2. Download or clone this repository.
3. Open `src/build_switch.ahk`.
4. Start the script by double-clicking it.

---

## Configuration
You can adjust the output keyboard keys here:

```ahk
outKey1 := "z"
outKey2 := "x"
```

These values must match your Fortnite build keybinds.

---

## How It Works In-Game

1. Hold your main build piece (for example, Wall).  
2. Press the temporary build (for example, Stair).  
3. When you release the temporary build, the script immediately returns to the original held build.

This behavior is ideal for quick structure swaps such as:

- Wall → Stair → Wall  
- Floor → Stair → Floor  
- Any fast temporary build change during fights or movement
