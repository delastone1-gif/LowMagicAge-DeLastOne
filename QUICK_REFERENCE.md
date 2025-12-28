# DeLastOne Adventure - Quick Reference Card

## 📦 What This Mod Adds

| Quest ID | Name | Objective | Rewards |
|----------|------|-----------|---------|
| 2001 | The Plague Begins | Kill 5 monsters | 600 XP + 400 AXP + 300g |
| 2002 | Temple of Shadows | Complete 1 dungeon | 900 XP + 500 AXP + 500g |
| 2003 | The Final Ritual | Kill 8 monsters | 1500 XP + 600 AXP + 1000g |

**Total:** 3000 XP + 1500 AXP + 1800 Gold + Equipment

---

## ⚡ Quick Install

1. **Backup** game files
2. **Copy** 3 files:
   - `data/advt_data.lua`
   - `text/en/story_text.lua`
   - `wlds/wld_1_sites.txt`
3. **Complete** Quest 103
4. **Accept** quest at Adventurer's Guild

---

## 🎯 Requirements

- ✅ Low Magic Age (Steam)
- ✅ Grid-based world map mode
- ✅ Quest 103 completed

---

## 📂 Mod Files

```
LowMagicAge-DeLastOne/
├── 📖 README.md                    (Main overview)
├── 📖 INSTALLATION.md              (Setup guide)
├── 📖 DELASTONE_ADVENTURE_README.md (Quest details)
├── 📖 QUICK_REFERENCE.md           (This file)
├── 📖 GITHUB_SETUP.md              (Publishing guide)
├── 📜 LICENSE                      (MIT)
├── 🖼️  screenshots/
│   ├── quest_delastone_1.png
│   ├── quest_delastone_2.png
│   └── quest_delastone_3.png
├── 💾 data/
│   └── advt_data.lua               (Quest definitions)
├── 💬 text/en/
│   └── story_text.lua              (English text)
└── 🗺️  wlds/
    └── wld_1_sites.txt             (Map locations)
```

---

## 🔧 Modified Code Sections

### data/advt_data.lua (Lines 828-831)
```lua
[2001]={z="DeLastOne - 瘟疫开始", t=qt_aqst, req=103, ...}
[2002]={z="DeLastOne - 暗影神殿", t=qt_aqst, req=103, pre=2001, ...}
[2003]={z="DeLastOne - 最终仪式", t=qt_aqst, req=103, pre=2002, ...}
```

### wlds/wld_1_sites.txt (Lines 330-332)
```
329  1  0 0  52  15  // Ashenvale Village
330 40  0 0  54  18  // Temple of Shadows
331  6  0 0  56  20  // Ritual Site
```

---

## 🎮 Quest Parameters

| Parameter | Quest 2001 | Quest 2002 | Quest 2003 |
|-----------|------------|------------|------------|
| Type | qt_aqst | qt_aqst | qt_aqst |
| Requirement | req=103 | req=103 | req=103 |
| Prerequisite | - | pre=2001 | pre=2002 |
| Objective | do_wmons=5 | do_dgns=1 | do_wmons=8 |
| XP | 600 | 900 | 1500 |
| AXP | 400 | 500 | 600 |
| Gold | 300 | 500 | 1000 |
| Items | eqp_rd_1 | eqp_rd_1 | eqp_rd_1 |
| Begin/End | sf_adv | sf_adv | sf_adv |

---

## 🗺️ Map Locations

| Site ID | Type | Name | Coords | Notes |
|---------|------|------|--------|-------|
| 329 | Village (1) | Ashenvale Village | 52, 15 | Decorative |
| 330 | Dungeon (40) | Temple of Shadows | 54, 18 | Decorative |
| 331 | Ruins (6) | Ritual Site | 56, 20 | Decorative |

⚠️ **Sites are visual only** - Cannot be entered, not required for quests

---

## 🐛 Common Issues

| Problem | Solution |
|---------|----------|
| Quest won't appear | Complete Quest 103, restart game |
| Game crashes | Use v2.0 (removes story.lua changes) |
| Can't enter sites | Normal - sites are decorative markers |
| Quest 2002 won't unlock | Fully complete Quest 2001 first |

---

## 📝 Quest Progression

```
Start Game
    ↓
Complete Quest 101 ("Welcome")
    ↓
Complete Quest 102 ("Prove Your Strength")
    ↓
Complete Quest 103 ("Dungeon Skills")
    ↓
✨ Quest 2001 APPEARS at Adventurer's Guild ✨
    ↓
Kill 5 monsters anywhere on map
    ↓
Complete Quest 2001
    ↓
✨ Quest 2002 APPEARS ✨
    ↓
Complete 1 dungeon anywhere
    ↓
Complete Quest 2002
    ↓
✨ Quest 2003 APPEARS ✨
    ↓
Kill 8 monsters anywhere on map
    ↓
Complete Quest 2003
    ↓
🎉 ADVENTURE COMPLETE! 🎉
```

---

## 💾 Installation Paths

### Windows (Steam Default)
```
C:\Program Files (x86)\Steam\steamapps\common\LowMagicAge\
```

### Custom Steam Library
```
[DRIVE]:\SteamLibrary\steamapps\common\LowMagicAge\
```

### Files to Copy
```
[MOD]/data/advt_data.lua     → [GAME]/data/
[MOD]/text/en/story_text.lua → [GAME]/text/en/
[MOD]/wlds/wld_1_sites.txt   → [GAME]/wlds/
```

---

## 🔄 Uninstall

### Option 1: Restore Backups
```
Copy your backup files back to:
- data/advt_data.lua
- text/en/story_text.lua
- wlds/wld_1_sites.txt
```

### Option 2: Steam Verify
```
Steam → Library → Low Magic Age
→ Properties → Local Files
→ Verify Integrity of Game Files
```

---

## 🌐 GitHub Commands

### Download
```bash
git clone https://github.com/YOUR_USERNAME/LowMagicAge-DeLastOne.git
```

### Update
```bash
cd LowMagicAge-DeLastOne
git pull
```

---

## 📊 Mod Statistics

- **Files Modified:** 3
- **Quest IDs:** 2001-2003
- **Map Sites:** 3 (decorative)
- **Total Rewards:** 3000 XP, 1500 AXP, 1800 Gold
- **Mod Size:** < 5 MB
- **Compatibility:** New & existing saves
- **Quest Type:** Adventure Monthly (qt_aqst)

---

## 📚 Documentation Index

- **[README.md](README.md)** - Overview and features
- **[INSTALLATION.md](INSTALLATION.md)** - Complete setup guide
- **[DELASTONE_ADVENTURE_README.md](DELASTONE_ADVENTURE_README.md)** - Quest lore and details
- **[GITHUB_SETUP.md](GITHUB_SETUP.md)** - Publishing to GitHub
- **[LICENSE](LICENSE)** - MIT License terms

---

## 🎲 Lore Summary

**Act 1:** Mysterious undead plague strikes near Yvesland. Defeat corrupted creatures and investigate the source.

**Act 2:** Trail leads to Temple of Shadows. Necromancer Malachar is using "The Last One" artifact. Enter the temple and stop him.

**Act 3:** Malachar escapes to complete his ritual. Hunt down his followers and destroy The Last One before he raises an undead army.

---

## ✅ Testing Checklist

- [ ] Game starts without crashes
- [ ] Quest 2001 appears after Quest 103
- [ ] Can kill monsters for Quest 2001
- [ ] Quest 2001 completes properly
- [ ] Quest 2002 appears after Quest 2001
- [ ] Can complete dungeon for Quest 2002
- [ ] Quest 2002 completes properly
- [ ] Quest 2003 appears after Quest 2002
- [ ] Can kill monsters for Quest 2003
- [ ] Quest 2003 completes properly
- [ ] Rewards granted correctly

---

**Version:** 2.0 (Grid-Based Mode - WORKING!)
**Last Updated:** 2025
**License:** MIT
