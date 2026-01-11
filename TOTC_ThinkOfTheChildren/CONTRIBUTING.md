# Contributing to TOTC: Think Of The Children

First off, thank you for considering contributing to TOTC: Think Of The Children! It's people like you that make this mod better for everyone.

## Code of Conduct

This project follows a simple code of conduct:

- Be respectful and inclusive
- Be constructive in feedback
- Focus on what's best for the community
- Show empathy towards other contributors

## Ways to Contribute

There are many ways to contribute to this project:

### 1. Report Bugs

If you find a bug, please create an issue with:

- **Clear title**: Briefly describe the problem
- **Description**: Detailed explanation of the issue
- **Steps to reproduce**: How to trigger the bug
- **Expected behavior**: What should happen
- **Actual behavior**: What actually happens
- **Environment**:
  - Project Zomboid version (e.g., Build 43.13.1)
  - Mod version (e.g., v1.0.0)
  - Singleplayer or multiplayer
  - Other mods installed
  - Operating system
- **Screenshots/logs**: If applicable

**Bug Report Template**:
```markdown
**Bug Description**
A clear description of what the bug is.

**To Reproduce**
1. Go to '...'
2. Click on '...'
3. See error

**Expected Behavior**
What you expected to happen.

**Environment**
- PZ Version: Build 43.13.1
- Mod Version: 1.0.0
- Game Mode: Singleplayer
- OS: Windows 10

**Additional Context**
Any other information, screenshots, or logs.
```

### 2. Suggest Features

Have an idea for a new feature? Open an issue with:

- **Feature description**: What you want added
- **Use case**: Why this would be useful
- **Examples**: How it might work
- **Alternatives**: Other ways to achieve the same goal

**Feature Request Template**:
```markdown
**Feature Description**
A clear description of the feature you'd like.

**Problem It Solves**
Why this feature would be useful.

**Proposed Solution**
How you envision this working.

**Alternatives Considered**
Other solutions you've thought about.

**Additional Context**
Any other information or mockups.
```

### 3. Submit Translations

Want to translate the mod to your language?

1. Copy `Sandbox_EN.txt` or `Sandbox_ES.txt`
2. Rename to your language code (e.g., `Sandbox_FR.txt` for French)
3. Translate all strings
4. Create a pull request
5. Include your name in credits

**Supported languages** (add yours!):
- English (EN) ✅
- Spanish (ES) ✅
- French (FR) - Need translator
- German (DE) - Need translator
- Portuguese (PT) - Need translator
- Russian (RU) - Need translator
- Chinese (ZH) - Need translator
- Japanese (JA) - Need translator

### 4. Improve Documentation

Documentation improvements are always welcome:

- Fix typos or grammar
- Clarify confusing sections
- Add examples or screenshots
- Expand FAQ
- Improve installation instructions

### 5. Code Contributions

Want to contribute code? Great!

#### Before You Start

1. Check existing issues to avoid duplicate work
2. For major changes, open an issue first to discuss
3. Fork the repository
4. Create a new branch for your feature

#### Development Setup

1. Fork and clone the repository
2. Copy to your PZ Workshop folder for testing
3. Make your changes
4. Test thoroughly:
   - Singleplayer
   - Multiplayer (if possible)
   - Different sandbox settings
   - With other popular mods

#### Code Style

Follow the existing code style:

**Lua Style Guide**:
```lua
-- Use descriptive variable names
local childZombieChance = 10  -- Good
local czc = 10                -- Bad

-- Add comments for complex logic
-- Check if zombie should be child-sized
if randomRoll < childChance then
    -- Apply scaling
end

-- Use consistent indentation (4 spaces)
function MyFunction()
    if condition then
        doSomething()
    end
end

-- Keep functions focused and small
function CalculateScale(size)
    return size / 100.0
end
```

**Best Practices**:
- Keep functions small and focused
- Comment complex logic
- Use meaningful variable names
- Validate inputs (check for nil)
- Handle edge cases
- Minimize performance impact
- Follow PZ modding conventions

#### Commit Messages

Write clear commit messages:

**Good commits**:
```
Add French translation
Fix zombie scaling not applying in multiplayer
Improve performance by caching sandbox variables
Update README with FAQ section
```

**Bad commits**:
```
Fixed stuff
Update
Changes
asdfasdf
```

**Commit Message Format**:
```
Type: Brief description (50 chars or less)

More detailed explanation if needed (wrap at 72 chars).
Explain the problem this commit solves and why you
chose this solution.

Fixes #123
```

**Types**:
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Code style changes (formatting)
- `refactor`: Code refactoring
- `test`: Adding tests
- `chore`: Maintenance tasks

### 6. Review Pull Requests

Help review others' contributions:

- Test the changes locally
- Check code quality
- Verify documentation is updated
- Provide constructive feedback

## Pull Request Process

1. **Fork** the repository
2. **Create a branch** from `main`:
   ```bash
   git checkout -b feature/my-new-feature
   ```
3. **Make your changes** with clear commits
4. **Test thoroughly**:
   - No console errors
   - Works in singleplayer
   - Works in multiplayer
   - Doesn't conflict with popular mods
5. **Update documentation**:
   - README.md if user-facing
   - TECHNICAL.md if code-related
   - Add to CHANGELOG
6. **Push** to your fork:
   ```bash
   git push origin feature/my-new-feature
   ```
7. **Open a Pull Request** with:
   - Clear title
   - Description of changes
   - Link to related issue
   - Screenshots/videos if UI changes
   - Testing performed

**PR Template**:
```markdown
## Description
Brief description of what this PR does.

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Documentation update
- [ ] Code refactoring
- [ ] Other (describe)

## Related Issue
Fixes #(issue number)

## Testing Done
- [ ] Tested in singleplayer
- [ ] Tested in multiplayer
- [ ] Tested with other mods
- [ ] No console errors
- [ ] Documentation updated

## Screenshots/Videos
If applicable, add screenshots or videos.

## Checklist
- [ ] Code follows project style
- [ ] Comments added for complex logic
- [ ] Documentation updated
- [ ] Tested thoroughly
- [ ] No breaking changes (or documented)
```

## Review Process

1. Maintainer reviews your PR
2. May request changes or clarifications
3. You address feedback
4. Once approved, maintainer merges
5. Your changes are included in next release

**Review timeline**:
- Simple fixes: 1-3 days
- New features: 1-2 weeks
- Large changes: Varies

## Getting Help

Need help contributing?

- **Discord**: Join the PZ Modding Discord
- **Forums**: Post on The Indie Stone forums
- **Issues**: Ask questions in a GitHub issue
- **Email**: Contact the maintainer (if provided)

## Recognition

Contributors will be:
- Listed in README.md credits
- Mentioned in release notes
- Thanked in Steam Workshop description

## Project Structure

```
TOTC_ThinkOfTheChildren/
├── Contents/mods/TOTC_ThinkOfTheChildren/
│   ├── mod.info                    # Mod metadata
│   ├── poster.png                  # Mod thumbnail
│   └── common/media/
│       ├── sandbox-options.txt     # Config options
│       └── lua/
│           ├── client/
│           │   └── TOTC_Main.lua   # Main mod logic
│           └── shared/Translate/   # Translations
├── LICENSE                         # MIT License
├── README.md                       # Main documentation
├── CONTRIBUTING.md                 # This file
├── STEAM_WORKSHOP_GUIDE.md        # Publishing guide
└── ...other docs
```

## Development Workflow

### Making Changes

1. **Create feature branch**:
   ```bash
   git checkout -b feature/add-teen-size
   ```

2. **Make changes**: Edit Lua files, add features

3. **Test locally**:
   - Copy to Workshop folder
   - Launch PZ and test
   - Check console for errors

4. **Commit changes**:
   ```bash
   git add .
   git commit -m "feat: Add teen size option (75% scale)"
   ```

5. **Push to your fork**:
   ```bash
   git push origin feature/add-teen-size
   ```

6. **Create Pull Request** on GitHub

### Testing Checklist

Before submitting a PR:

- [ ] No Lua errors in console
- [ ] Mod loads in game
- [ ] Sandbox options appear correctly
- [ ] Settings save and load properly
- [ ] Changes work in singleplayer
- [ ] Changes work in multiplayer
- [ ] Compatible with popular mods (if applicable)
- [ ] Performance is acceptable
- [ ] Documentation updated

## Versioning

This project uses [Semantic Versioning](https://semver.org/):

- **MAJOR** (1.0.0): Breaking changes
- **MINOR** (0.1.0): New features, backwards compatible
- **PATCH** (0.0.1): Bug fixes, backwards compatible

## License

By contributing, you agree that your contributions will be licensed under the MIT License.

## Questions?

Don't hesitate to ask! Open an issue with the "question" label or reach out on Discord.

---

**Thank you for contributing to TOTC: Think Of The Children!**

*Won't somebody please think of the children?!*
