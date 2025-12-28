# GitHub Setup Guide for DeLastOne Mod

This guide explains how to publish the DeLastOne mod to GitHub for easy distribution.

---

## Option 1: Initialize Repository in Game Folder (Recommended)

### Step 1: Initialize Git Repository

```bash
cd "C:\Program Files (x86)\Steam\steamapps\common\LowMagicAge"
git init
```

### Step 2: Add Files

The `.gitignore` is already configured to only track mod files:

```bash
git add .
git status  # Verify only mod files are staged
```

You should see:
- ✅ README.md
- ✅ INSTALLATION.md
- ✅ DELASTONE_ADVENTURE_README.md
- ✅ LICENSE
- ✅ .gitignore
- ✅ data/advt_data.lua
- ✅ text/en/story_text.lua
- ✅ wlds/wld_1_sites.txt
- ✅ screenshots/*.png

You should NOT see game executables, saves, or other game files.

### Step 3: Create Initial Commit

```bash
git commit -m "Initial commit: DeLastOne Adventure v2.0

- Added 3-quest adventure chain for grid-based world map mode
- Quest IDs: 2001, 2002, 2003
- Total rewards: 3000 XP + 1500 AXP + 1800 Gold
- Unlocks after Quest 103
- Includes world map locations and full documentation"
```

### Step 4: Create GitHub Repository

1. Go to https://github.com/new
2. Repository name: `LowMagicAge-DeLastOne`
3. Description: `Custom 3-quest adventure chain for Low Magic Age - D&D inspired undead plague storyline`
4. Make it **Public** (so others can download)
5. **DON'T** initialize with README (we already have one)
6. Click "Create repository"

### Step 5: Push to GitHub

```bash
git remote add origin https://github.com/YOUR_USERNAME/LowMagicAge-DeLastOne.git
git branch -M main
git push -u origin main
```

---

## Option 2: Create Standalone Mod Folder

If you prefer to keep the mod separate from the game installation:

### Step 1: Create Mod Directory Structure

```bash
mkdir C:\LowMagicAge-DeLastOne-Mod
cd C:\LowMagicAge-DeLastOne-Mod
```

### Step 2: Copy Mod Files

```bash
# Create directory structure
mkdir -p data text/en wlds screenshots

# Copy mod files
copy "C:\Program Files (x86)\Steam\steamapps\common\LowMagicAge\data\advt_data.lua" data\
copy "C:\Program Files (x86)\Steam\steamapps\common\LowMagicAge\text\en\story_text.lua" text\en\
copy "C:\Program Files (x86)\Steam\steamapps\common\LowMagicAge\wlds\wld_1_sites.txt" wlds\
copy "C:\Program Files (x86)\Steam\steamapps\common\LowMagicAge\README.md" .
copy "C:\Program Files (x86)\Steam\steamapps\common\LowMagicAge\INSTALLATION.md" .
copy "C:\Program Files (x86)\Steam\steamapps\common\LowMagicAge\DELASTONE_ADVENTURE_README.md" .
copy "C:\Program Files (x86)\Steam\steamapps\common\LowMagicAge\LICENSE" .
copy "C:\Program Files (x86)\Steam\steamapps\common\LowMagicAge\screenshots\*" screenshots\
```

### Step 3: Initialize Git

```bash
git init
git add .
git commit -m "Initial commit: DeLastOne Adventure v2.0"
```

### Step 4: Push to GitHub (same as Option 1 Step 4-5)

---

## For Users: How to Download and Install

### Method 1: Download ZIP

1. Go to your GitHub repository
2. Click green "Code" button
3. Select "Download ZIP"
4. Extract ZIP file
5. Follow [INSTALLATION.md](INSTALLATION.md)

### Method 2: Git Clone

```bash
git clone https://github.com/YOUR_USERNAME/LowMagicAge-DeLastOne.git
cd LowMagicAge-DeLastOne
# Follow INSTALLATION.md
```

---

## Release Checklist

Before creating a release:

- [ ] All quest files tested and working
- [ ] Screenshots added to `screenshots/` folder
- [ ] README.md is complete
- [ ] INSTALLATION.md has clear steps
- [ ] LICENSE file included
- [ ] .gitignore excludes game files
- [ ] Version number updated (currently v2.0)

### Creating a Release

1. Go to repository on GitHub
2. Click "Releases" → "Create a new release"
3. Tag: `v2.0`
4. Title: `DeLastOne Adventure v2.0 - Working Release`
5. Description:
   ```
   # DeLastOne Adventure v2.0

   Custom 3-quest adventure chain for Low Magic Age's grid-based world map mode.

   ## What's New in v2.0
   - ✅ Fixed for grid-based world map mode
   - ✅ Changed requirement from Quest 104 to Quest 103
   - ✅ Removed problematic story mode code
   - ✅ Added comprehensive documentation
   - ✅ Includes screenshots

   ## Installation
   See [INSTALLATION.md](INSTALLATION.md) for complete setup guide.

   ## Quick Start
   1. Download ZIP
   2. Copy 3 files to your Low Magic Age installation
   3. Complete Quest 103
   4. Accept quest from Adventurer's Guild
   ```
6. Attach ZIP file (optional)
7. Click "Publish release"

---

## Updating the Mod

When you make changes:

```bash
# Stage changes
git add .

# Commit with descriptive message
git commit -m "Fix: Updated quest 2002 rewards

- Increased XP from 900 to 1200
- Added unique item drop"

# Push to GitHub
git push
```

---

## Repository Settings

### Topics (Tags)
Add these topics to your repository for discoverability:

- `low-magic-age`
- `mod`
- `quest-mod`
- `dnd`
- `rpg`
- `lua`
- `gaming`

### About Section
```
Custom 3-quest adventure chain for Low Magic Age - D&D inspired undead plague storyline. Kill monsters, explore dungeons, stop the necromancer!
```

### Website (Optional)
Link to your own documentation site or Steam Workshop page

---

## File Size Check

Your mod should be lightweight:

```bash
# Check total size
du -sh .

# Expected: < 5 MB (mostly screenshots)
```

Mod files:
- `data/advt_data.lua`: ~50 KB
- `text/en/story_text.lua`: ~30 KB
- `wlds/wld_1_sites.txt`: ~15 KB
- Screenshots: ~2-4 MB total
- Documentation: ~50 KB

**Total:** Less than 5 MB ✅

---

## Support Files

Consider adding these optional files:

### CHANGELOG.md
```markdown
# Changelog

## [2.0.0] - 2025-01-XX
### Fixed
- Changed from story mode to grid-based world map mode
- Removed site entry crashes
- Updated requirement to Quest 103

### Added
- Comprehensive documentation
- Screenshots
- Installation guide

## [1.0.0] - 2025-01-XX (Deprecated)
- Initial release (had crashes)
```

### CONTRIBUTING.md
```markdown
# Contributing

We welcome contributions! Here's how:

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test in-game
5. Submit a pull request

Please include screenshots of your changes working in-game.
```

---

## Next Steps

After publishing to GitHub:

1. ✅ Share on Low Magic Age Steam forums
2. ✅ Submit to Nexus Mods (if they support Low Magic Age)
3. ✅ Post on Reddit r/LowMagicAge (if exists)
4. ✅ Create YouTube tutorial video
5. ✅ Add to modding wiki

---

**Your mod is now ready for distribution!** 🎉
