# 🤝 Contributing to DeLastOne Adventure

Thank you for your interest in contributing! This mod is open source and community contributions are welcome.

---

## 🎯 Ways to Contribute

### 1. 🐛 **Bug Reports**

Found a bug? Please report it!

**Before reporting:**
- Check [STATUS.md](STATUS.md) - it might be a known limitation
- Make sure you're using v2.0+
- Try with a clean game installation

**How to report:**
1. Go to [Issues](https://github.com/delastone1-gif/LowMagicAge-DeLastOne/issues)
2. Click "New Issue"
3. Include:
   - Your game version (Low Magic Age version number)
   - Which quest (2001, 2002, or 2003)
   - What you expected to happen
   - What actually happened
   - Screenshots (if applicable)
   - Save file (if relevant)

---

### 2. 📝 **Quest Ideas**

Have an idea for a new quest chain? We'd love to hear it!

**Good quest ideas include:**
- Clear storyline (beginning, middle, end)
- Achievable objectives (kill X monsters, complete Y dungeons, etc.)
- Appropriate rewards
- Connection to D&D or fantasy themes

**Submit via:**
- GitHub Issues with "Quest Idea" label
- Detailed description of story, objectives, and rewards

**Example:**
```
Quest Chain: "The Vampire's Curse"

Quest 1: Investigate Reports (Kill 3 undead)
Quest 2: Find the Vampire's Lair (Complete 1 dungeon)
Quest 3: Destroy the Master Vampire (Kill 10 undead)

Rewards: 2500 XP total, vampire-themed equipment
```

---

### 3. 🔧 **Code Contributions**

Want to add features or fix bugs?

**Getting Started:**
1. Fork the repository
2. Create a feature branch: `git checkout -b feature/my-new-quest`
3. Make your changes
4. Test in-game thoroughly
5. Commit with clear messages: `git commit -m "Add vampire quest chain"`
6. Push to your fork: `git push origin feature/my-new-quest`
7. Open a Pull Request

**Coding Guidelines:**
- Follow existing Lua formatting in advt_data.lua
- Add English translations to story_text.lua
- Test with both new and existing saves
- Update documentation (README, STATUS.md)
- Include screenshots if adding visual content

---

### 4. 📖 **Documentation**

Help improve the documentation!

**Areas that need help:**
- More detailed troubleshooting guides
- Video tutorials
- Translation to other languages
- Quest walkthroughs
- Modding tutorials

**How to contribute:**
1. Edit the relevant .md file
2. Submit a Pull Request
3. Or open an Issue with your suggestion

---

### 5. 🎨 **Creative Contributions**

**Lore & Writing:**
- Expand quest descriptions
- Write backstories for characters
- Create world-building content
- Design new adventure storylines

**Art & Screenshots:**
- Take better in-game screenshots
- Create promotional images
- Design a mod logo
- Make tutorial videos

**Submit via:**
- Pull Request (for text)
- Issues with links (for images/videos)

---

## 🔬 Technical Contributions

### **Research Projects** (Advanced)

If you figure out how to do any of these, please share!

| Research Area | Difficulty | Value |
|---------------|------------|-------|
| Custom map creation | Very Hard | Very High |
| NPC spawning | Hard | High |
| Custom items | Medium | High |
| Custom encounters | Hard | High |
| Story mode quests | Medium | Medium |
| Dungeon generation | Very Hard | Very High |

**How to share findings:**
1. Create a GitHub Issue: "Research: [Topic]"
2. Document what you tried
3. Share code snippets or file examples
4. Explain what worked and what didn't

---

## 🧪 Testing

Help test new features!

**What to test:**
- Quest progression (do all 3 quests complete?)
- Rewards (do you get XP, gold, items?)
- Compatibility (works with your save?)
- Installation (is it easy to install?)

**Testing Checklist:**
```
[ ] Fresh install on clean game
[ ] Quest 2001 appears after Quest 103
[ ] Kill 5 monsters completes Quest 2001
[ ] Quest 2002 appears after Quest 2001
[ ] Complete dungeon completes Quest 2002
[ ] Quest 2003 appears after Quest 2002
[ ] Kill 8 monsters completes Quest 2003
[ ] All rewards granted correctly
[ ] No game crashes
```

**Report results in Issues**

---

## 🌍 Translations

Help translate the mod!

**Currently supported:**
- English (en)
- Chinese (zh)

**Want to add a language?**

1. Copy `text/en/story_text.lua`
2. Translate the text strings
3. Save as `text/[language_code]/story_text.lua`
4. Test in-game
5. Submit Pull Request

**Languages we'd love to see:**
- French (fr)
- German (de)
- Spanish (es)
- Russian (ru)
- Japanese (ja)
- Korean (ko)

---

## 📋 Pull Request Guidelines

**Before submitting:**
- [ ] Code tested in-game
- [ ] No game crashes
- [ ] Documentation updated
- [ ] Commit messages are clear
- [ ] Changes are focused (one feature per PR)

**PR Description should include:**
- What does this change?
- Why is this change needed?
- How did you test it?
- Screenshots (if applicable)

**Example PR:**
```
Title: Add Vampire Quest Chain (Quests 3001-3003)

Description:
Adds a new 3-quest vampire-themed adventure chain.

Changes:
- Added quests 3001, 3002, 3003 to advt_data.lua
- Added English text to story_text.lua
- Updated README.md with new quest info
- Updated STATUS.md

Testing:
- Tested on fresh save (Quest 103 completed)
- Tested on existing save
- All 3 quests complete successfully
- No crashes

Screenshots: [attached]
```

---

## ⚖️ Code of Conduct

**Be respectful:**
- Constructive feedback only
- No harassment or discrimination
- Help newcomers learn
- Give credit where due

**Be collaborative:**
- Share knowledge openly
- Accept feedback gracefully
- Communicate clearly
- Work together on solutions

---

## 🎁 Recognition

Contributors will be credited in:
- README.md Contributors section
- CHANGELOG.md for their contributions
- Git commit history (permanent record)

**Top contributors may get:**
- Maintainer status
- Quest chains named after them
- Special thanks in releases

---

## 📞 Questions?

- **General questions:** Open a GitHub Issue with "Question" label
- **Technical help:** Check [STATUS.md](STATUS.md) first
- **Installation issues:** See [INSTALLATION.md](INSTALLATION.md)

---

## 🎲 Thank You!

Every contribution, no matter how small, helps make this mod better for the Low Magic Age community. Whether you're reporting a bug, suggesting a quest, or writing code - **thank you for being part of this project!**

---

**Happy modding! May your dice roll high!** 🎲⚔️
