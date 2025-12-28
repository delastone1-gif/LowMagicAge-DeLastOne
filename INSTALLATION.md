# DeLastOne Adventure - Installation Guide

## Quick Install (5 Minutes)

### What This Mod Does
Adds a 3-quest adventure chain "DeLastOne" to Low Magic Age's grid-based world map mode. Features a classic D&D undead plague storyline with 3000+ XP rewards.

### Requirements
- Low Magic Age (Steam version)
- Grid-based world map adventure mode
- **Complete Quest 103 first** (or the quests won't appear)

---

## Installation Steps

### Method 1: Manual Install (Recommended)

1. **Backup Your Game Files**
   ```
   Navigate to: C:\Program Files (x86)\Steam\steamapps\common\LowMagicAge\
   Create backups of:
   - data/advt_data.lua
   - data/story.lua (optional, we don't modify it anymore)
   - text/en/story_text.lua
   - wlds/wld_1_sites.txt
   ```

2. **Download the Mod Files**
   - Download this repository as ZIP
   - Extract to a temporary folder

3. **Copy Modified Files**
   Copy these files to your Low Magic Age installation:

   ```
   From mod folder → To game folder:

   data/advt_data.lua          → C:\Program Files (x86)\Steam\steamapps\common\LowMagicAge\data\
   text/en/story_text.lua      → C:\Program Files (x86)\Steam\steamapps\common\LowMagicAge\text\en\
   wlds/wld_1_sites.txt        → C:\Program Files (x86)\Steam\steamapps\common\LowMagicAge\wlds\
   ```

4. **Verify Installation**
   - Start Low Magic Age
   - Load or start a new adventure
   - Complete Quest 103 ("Dungeon Skills")
   - Check Adventurer's Guild for "DeLastOne - The Plague Begins"

---

### Method 2: Git Clone (For Developers)

```bash
# Clone to temporary location
git clone https://github.com/YOUR_USERNAME/LowMagicAge-DeLastOne.git

# Navigate to your Low Magic Age installation
cd "C:\Program Files (x86)\Steam\steamapps\common\LowMagicAge"

# Copy mod files (Windows)
copy /Y path\to\LowMagicAge-DeLastOne\data\advt_data.lua data\
copy /Y path\to\LowMagicAge-DeLastOne\text\en\story_text.lua text\en\
copy /Y path\to\LowMagicAge-DeLastOne\wlds\wld_1_sites.txt wlds\
```

---

## File Structure

```
LowMagicAge-DeLastOne/
├── README.md                    # Main documentation
├── INSTALLATION.md              # This file
├── DELASTONE_ADVENTURE_README.md # Quest details & lore
├── LICENSE                      # MIT License
├── screenshots/                 # Quest screenshots
│   ├── quest_delastone_1.png
│   ├── quest_delastone_2.png
│   └── quest_delastone_3.png
├── data/
│   └── advt_data.lua           # Quest definitions (MAIN FILE)
├── text/
│   └── en/
│       └── story_text.lua      # English translations
└── wlds/
    └── wld_1_sites.txt         # World map locations
```

---

## What Gets Modified

### ✅ Safe Modifications (Append-only)

1. **data/advt_data.lua** (Lines 828-831)
   - Adds 3 new quest entries at the end
   - Doesn't touch existing quests
   - Quest IDs: 2001, 2002, 2003

2. **text/en/story_text.lua** (Lines 144-206)
   - Adds English translations
   - Doesn't modify existing text

3. **wlds/wld_1_sites.txt** (Lines 330-332)
   - Updates site count: 329 → 332
   - Adds 3 location markers
   - **NOTE:** These are decorative only, not required for quests

### ⚠️ Important Notes

- **Save files are NOT modified** - Your saves remain untouched
- **Works with new adventures** - Start fresh or continue existing
- **No story.lua changes** - Previous crashes were fixed by removing story mode code
- **Compatible with vanilla** - Can be uninstalled by restoring backups

---

## Troubleshooting

### "Quests don't appear!"
- ✓ Complete Quest 103 first (`req=103`)
- ✓ Restart the game after installing
- ✓ Check Adventurer's Guild (not world map)
- ✓ Look for quest type "Adventure Monthly Quest"

### "Game crashes on startup!"
- ✗ Old issue, now fixed
- ✓ Make sure you're using the latest version
- ✓ Verify story.lua wasn't modified

### "Can't find Ashenvale Village!"
- ℹ️ The sites at (52,15) are decorative only
- ℹ️ Quests work without visiting those locations
- ℹ️ Just kill monsters/complete dungeons for objectives

### "Quest completed but next quest didn't appear!"
- ✓ Check if you fully completed the quest (not just objectives)
- ✓ Quest 2002 requires Quest 2001 fully finished (`pre=2001`)
- ✓ Quest 2003 requires Quest 2002 fully finished (`pre=2002`)

---

## Uninstallation

1. Restore backed-up files:
   ```
   Copy your backups back to:
   - data/advt_data.lua
   - text/en/story_text.lua
   - wlds/wld_1_sites.txt
   ```

2. Or verify game files through Steam:
   ```
   Steam → Library → Right-click Low Magic Age
   → Properties → Local Files → Verify Integrity of Game Files
   ```

---

## For New Adventures

**YES!** This mod works perfectly with new adventures:

1. Install the mod files
2. Start a new adventure in grid-based world map mode
3. Play through Quests 101 → 102 → 103
4. DeLastOne quests appear automatically after Quest 103!

**No special setup needed for new games!**

---

## Version History

### v2.0 (Current) - WORKING VERSION
- ✅ Fixed for grid-based world map mode
- ✅ Changed from `req=104` to `req=103` for immediate availability
- ✅ Removed problematic story mode code
- ✅ Quest type changed to `qt_aqst` (adventure monthly quest)
- ✅ Simplified objectives: kill monsters, complete dungeons

### v1.0 (Deprecated)
- ❌ Used story mode format (caused crashes)
- ❌ Required complex site creation (unstable)

---

## Credits

- **Mod Creator:** Claude + Boris
- **Game:** Low Magic Age by Low Magic Studios
- **Inspiration:** D&D 3.5 classic undead plague adventures
- **License:** MIT (see LICENSE file)

---

## Support & Feedback

- **Issues:** Report bugs via GitHub Issues
- **Screenshots:** Included in `screenshots/` folder
- **Questions:** Check DELASTONE_ADVENTURE_README.md for quest details

---

**Enjoy your adventure! May your dice roll high!** 🎲⚔️
