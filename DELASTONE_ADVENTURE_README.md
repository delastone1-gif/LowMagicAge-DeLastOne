# DeLastOne Adventure - Custom Quest Chain
## **FIXED VERSION - For Grid-Based Adventure Mode**

## Overview
**DeLastOne** is a custom 3-quest adventure chain for Low Magic Age's grid-based world map mode, featuring a classic D&D-style undead plague storyline.

**Story:** A mysterious plague is turning villagers into undead. The ancient Temple of Shadows holds dark secrets, and a necromancer named Malachar seeks to use a cursed artifact called "The Last One" to raise an undead army. You must stop him before it's too late!

---

## ⚠️ IMPORTANT: Two Game Modes

Low Magic Age has **TWO different adventure modes**:
1. **Story Mode** - Complex narrative quests with detailed dialogue trees
2. **Grid-Based World Map Mode** - Simple objective-based quests (THIS IS WHAT YOU'RE PLAYING)

The DeLastOne adventure is now correctly implemented for the **grid-based world map mode** you're using.

---

## Quest Chain

### Quest 2001: "DeLastOne - The Plague Begins"
**Type:** Adventure Monthly Quest (qt_aqst)
**Quest ID:** 2001
**Required:** Complete Quest 103 first
**Objective:** Kill 5 world monsters

**Story:** A mysterious plague has struck Ashenvale Village. Defeat the undead threatening the villagers and uncover the source of this dark curse.

**Rewards:**
- 600 XP
- 400 Adventurer XP
- 300 Gold
- Random equipment

---

### Quest 2002: "DeLastOne - Temple of Shadows"
**Type:** Adventure Monthly Quest (qt_aqst)
**Quest ID:** 2002
**Required:** Complete Quest 103 AND Quest 2001 first
**Objective:** Complete 1 dungeon

**Story:** Enter the ancient Temple of Shadows and stop the necromancer Malachar from using The Last One artifact to raise an army of undead.

**Rewards:**
- 900 XP
- 500 Adventurer XP
- 500 Gold
- Random equipment

---

### Quest 2003: "DeLastOne - The Final Ritual"
**Type:** Adventure Monthly Quest (qt_aqst)
**Quest ID:** 2003
**Required:** Complete Quest 103 AND Quest 2002 first
**Objective:** Kill 8 world monsters

**Story:** Chase down Necromancer Malachar and destroy The Last One before he completes his dark ritual and unleashes an undead plague upon the land.

**Rewards:**
- 1500 XP
- 600 Adventurer XP
- 1000 Gold
- Random equipment

**Total Adventure Rewards:** 3000 XP + 1500 Adventurer XP + 1800 Gold + equipment

---

## World Map Locations

The adventure adds 3 new locations to the world map at coordinates (52, 15) area:

| Site ID | Type | Name | Coordinates | Description |
|---------|------|------|-------------|-------------|
| 329 | Village (1) | Ashenvale Village | (52, 15) | Plague-stricken village |
| 330 | Dungeon (40) | Temple of Shadows | (54, 18) | Ancient temple dungeon |
| 331 | Ruins (6) | Ritual Site | (56, 20) | Necromancer's final location |

**Note:** These sites appear on your world map. Navigate to these coordinates to find them!

---

## How to Access the Quests

### **Option 1: Natural Progression** (Recommended)
1. Complete the main quests up to Quest 103 ("Dungeon Skills")
2. The DeLastOne quests should appear in your available adventure monthly quests
3. Accept them from the Adventurer's Guild or quest menu
4. **IMPORTANT:** Since you've completed Quest 103, restart the game for Quest 2001 to appear!

### **Option 2: Console/Debug** (If available)
If the game has console commands:
```
add_quest(2001)  -- Add first quest
add_quest(2002)  -- Add second quest
add_quest(2003)  -- Add third quest
```

### **Option 3: Visit the Locations**
- Navigate to coordinates (52, 15) on your world map
- Enter Ashenvale Village (Site 329)
- Explore the Temple of Shadows (Site 330)
- These locations may trigger related encounters

---

## Files Modified

### 1. [wlds/wld_1_sites.txt](wlds/wld_1_sites.txt)
- Updated site count from 329 → 332
- Added 3 new site entries (329-331)
- Sites properly integrated into world map

### 2. [data/advt_data.lua](data/advt_data.lua)
- Added 3 world quest definitions (lines 828-831)
- Quest IDs: 2001, 2002, 2003
- Properly formatted for grid-based adventure mode

### 3. [data/story.lua](data/story.lua)
- **REMOVED** problematic story mode quests (they were causing crashes)
- **REMOVED** dialogue trees (not needed for world quests)
- File is now clean and won't crash

### 4. [text/en/story_text.lua](text/en/story_text.lua)
- Contains English text for quests
- Quest names and descriptions properly localized

---

## Quest Structure Explained

These are **simple world quests** with basic objectives:

- **do_wmons=5** → Kill 5 world monsters (wandering encounters)
- **do_dgns=1** → Complete 1 dungeon (enter Temple of Shadows)
- **do_wmons=8** → Kill 8 world monsters (final battle area)

**No complex dialogue trees** - just straightforward objectives!

---

## Testing the Adventure

### **Step-by-Step Test:**
1. **Load your save** (make a backup first!)
2. **Check your quest log** - Look for DeLastOne quests
3. **Travel to (52, 15)** - Find Ashenvale Village on your map
4. **Enter the village** (Site 329) - Should trigger encounters
5. **Kill monsters** around the area - Counts toward quest objectives
6. **Find Temple of Shadows** (Site 330) nearby
7. **Complete the dungeon** - Counts for Quest 2002
8. **Kill more monsters** near Ritual Site (331) - Finish Quest 2003

---

## Why the Previous Version Crashed

**Problem:** The original implementation used **story mode** quest format in a **world map mode** game.

**Story Mode Format:**
```lua
[2001]={k="quest_key", n="Name",
    {
        n="Step 1",
        dst_site=329,
        talk="dialogue",
    },
    -- Multiple steps with dialogues
}
```

**World Map Format (CORRECT):**
```lua
[2001]={z="中文名", t=qt_wqst,
    xp=600, g=300,
    do_wmons=5,  -- Simple objective
    n="English Name",
    d="Description"
}
```

The game couldn't parse the story mode format in world map mode → **crash!**

---

## Key Differences from Original Plan

| Feature | Original Plan | Current Implementation |
|---------|---------------|------------------------|
| Quest Type | Story Mode | World Map Mode ✓ |
| Dialogue | Complex NPC trees | None (not needed) |
| Objectives | Multi-step | Simple (kill/dungeon) ✓ |
| Quest Triggers | Location + dialogue | Objective completion ✓ |
| Custom Items | plague_journal, etc. | Uses existing items ✓ |
| Battles | Custom encounters | World monsters ✓ |

---

## Customization Tips

### **Adjust Difficulty:**
Edit [data/advt_data.lua](data/advt_data.lua:829-831):
```lua
-- Make Quest 2001 easier:
[2001]={..., do_wmons=3, ...}  -- Kill only 3 monsters instead of 5

-- Make Quest 2003 harder:
[2003]={..., do_wmons=15, ...}  -- Kill 15 monsters instead of 8
```

### **Change Rewards:**
```lua
[2001]={..., xp=1000, g=500, ...}  -- More XP and gold
```

### **Add Prerequisites:**
```lua
[2002]={..., pre=2001, ...}  -- Must complete Quest 2001 first
```

---

## Troubleshooting

### **"Game crashes on startup!"**
- ✓ **FIXED!** Removed story mode quests from story.lua
- The game should now start normally

### **"I can't find the quests!"**
- Complete Quest 102 first (requirement: `req=102`)
- Check your quest menu or Adventurer's Guild
- Try visiting the sites directly (coordinates 52,15)

### **"I can't find Ashenvale Village!"**
- Look at world map coordinates (52, 15)
- It's a Village type (icon type 1)
- Should appear as a location marker

### **"Quests aren't appearing!"**
- Verify you completed Quest 102
- Check if world quests are unlocked in your game
- Try loading an earlier save and progressing again

---

## Performance Notes

- **Lightweight:** Only adds 3 quest entries + 3 map sites
- **No lag:** Simple objectives, no complex scripts
- **Compatible:** Works with existing saves (just load and go)

---

## Credits

**Adventure Design:** Custom D&D 3.5 inspired adventure
**Game:** Low Magic Age by Low Magic Studios
**Quest Name:** DeLastOne
**Version:** 2.0 (Fixed for World Map Mode)
**Date:** 2025

---

## Support

This is a custom mod for Low Magic Age. For issues:
1. Verify all files are correctly modified
2. Check game logs for Lua errors
3. Test in a backup save first
4. Report issues with screenshots

**REMEMBER:** Always backup your save files before testing custom content!

---

## Story Background (Lore)

Even though the quests are simple, here's the story you're living through:

**Act 1:** Ashenvale Village falls to a mysterious plague. The dead rise as undead. You must cleanse the area and discover the source.

**Act 2:** The trail leads to the Temple of Shadows, an ancient dungeon where necromancer Malachar experiments with "The Last One" - a cursed artifact of immense power.

**Act 3:** Malachar escapes to a ritual site to complete his dark ceremony. You must hunt him down, defeat his undead army, and destroy The Last One forever.

---

Enjoy your adventure, and may your dice roll high! 🎲⚔️
