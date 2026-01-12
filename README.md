# TOTC: Think Of The Children - Development Project

<div align="center">

![TOTC Logo](TOTC_ThinkOfTheChildren/preview.png)

> *"Won't somebody please think of the children?!"* - Helen Lovejoy, The Simpsons

[![Project Zomboid](https://img.shields.io/badge/Project%20Zomboid-Build%2042.13.1-green?style=for-the-badge)](https://projectzomboid.com)
[![Mod Version](https://img.shields.io/badge/Mod%20Version-1.0.1-orange?style=for-the-badge)]()
[![React](https://img.shields.io/badge/React-18.3.1-blue?style=for-the-badge&logo=react)](https://reactjs.org)
[![TypeScript](https://img.shields.io/badge/TypeScript-5.6.2-blue?style=for-the-badge&logo=typescript)](https://www.typescriptlang.org)
[![Vite](https://img.shields.io/badge/Vite-5.4.10-646CFF?style=for-the-badge&logo=vite)](https://vitejs.dev)
[![License](https://img.shields.io/badge/License-MIT-blue?style=for-the-badge)](TOTC_ThinkOfTheChildren/LICENSE)

**Complete development environment for the TOTC Project Zomboid mod, including web tools and comprehensive documentation**

[Mod Features](#mod-features) • [Web App](#web-app) • [Installation](#installation) • [Development](#development) • [Project Structure](#project-structure) • [Contributing](#contributing)

</div>

---

## Overview

This repository contains the complete development environment for **TOTC: Think Of The Children**, a Project Zomboid mod that adds child-sized zombies to the game. The project includes:

- **Project Zomboid Mod**: The core mod files with Lua scripts, configurations, and translations
- **Web Application**: A React/TypeScript web app built with Vite for mod management and tools
- **Comprehensive Documentation**: 22 documentation files covering installation, publishing, and technical details
- **Publishing Guides**: Step-by-step guides for Steam Workshop and GitHub releases

---

## Mod Features

The TOTC mod introduces child-sized zombies to Project Zomboid:

- **Configurable Spawn Rate**: Control what percentage of zombies spawn as children (default: 10%)
- **Adjustable Size**: Set how small child zombies are compared to adults (default: 50%)
- **Sandbox Integration**: Easy configuration through the game's built-in Sandbox Options
- **Multiplayer Ready**: Works seamlessly in singleplayer and multiplayer servers
- **Build 42 Compatible**: Uses the new Build 42 mod structure (`common/` + `42/` folders)
- **Lightweight**: Minimal performance impact - uses OnTick for reliable zombie processing
- **Bilingual**: Includes English and Spanish translations
- **No Dependencies**: Works standalone without requiring other mods

For detailed mod information, see [TOTC_ThinkOfTheChildren/README.md](TOTC_ThinkOfTheChildren/README.md)

---

## Web App

The included web application provides tools and utilities for mod development and management:

- **Mod Configuration Tool**: Interface for testing and previewing mod settings
- **Documentation Viewer**: Integrated documentation browser
- **Development Utilities**: Tools for mod development workflow

### Tech Stack

- **Frontend**: React 18 with TypeScript
- **Build Tool**: Vite
- **Styling**: Tailwind CSS
- **Icons**: Lucide React
- **Backend**: Supabase (optional, for data persistence)

---

## Installation

### Prerequisites

- **Node.js** 18+ and npm
- **Project Zomboid** (for testing the mod)
- **Git** for version control

### Clone and Setup

1. **Clone the repository**:
   ```bash
   git clone https://github.com/yourusername/TOTC_ThinkOfTheChildren.git
   cd TOTC_ThinkOfTheChildren
   ```

2. **Install dependencies**:
   ```bash
   npm install
   ```

3. **Start development server**:
   ```bash
   npm run dev
   ```

4. **Build for production**:
   ```bash
   npm run build
   ```

### Mod Installation

For Project Zomboid mod installation, see [docs/INSTALL.txt](docs/INSTALL.txt) or [TOTC_ThinkOfTheChildren/README.md](TOTC_ThinkOfTheChildren/README.md)

---

## Development

### Available Scripts

- `npm run dev` - Start development server
- `npm run build` - Build for production
- `npm run preview` - Preview production build
- `npm run lint` - Run ESLint
- `npm run typecheck` - Run TypeScript type checking

### Project Structure

```
├── TOTC_ThinkOfTheChildren/     # Project Zomboid mod files
│   ├── Contents/mods/TOTC.../   # Mod content (Steam Workshop structure)
│   │   ├── common/              # Shared assets (required, even if empty)
│   │   │   └── media/           # Common media folder
│   │   └── 42/                  # Build 42 specific files
│   │       ├── mod.info         # Mod metadata with pzversion=42.x
│   │       └── media/           # Lua scripts, translations, etc.
│   ├── media/                   # Original assets
│   ├── README.md                # Mod documentation
│   ├── LEEME.md                 # Spanish documentation
│   └── workshop.txt             # Steam Workshop metadata
├── docs/                        # Documentation
│   ├── INSTALL.txt              # Installation guide
│   ├── TECHNICAL.md             # Technical documentation
│   └── PUBLISHING.md            # Publishing guide
├── src/                         # Web application source
│   ├── components/              # React components
│   ├── pages/                   # Application pages
│   └── ...
├── public/                      # Static assets
├── package.json                 # Node.js dependencies
├── vite.config.ts               # Vite configuration
└── README.md                    # This file
```

---

## Contributing

We welcome contributions to both the mod and the web application!

### For the Mod

- Report bugs or suggest features in [Issues](../../issues)
- Submit pull requests for improvements
- Help with translations or testing

### For the Web App

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/your-feature`
3. Make your changes and test thoroughly
4. Submit a pull request

### Development Guidelines

- Follow the existing code style
- Add tests for new features
- Update documentation as needed
- Ensure compatibility with Project Zomboid Build 42/43

See [docs/CONTRIBUTING.md](TOTC_ThinkOfTheChildren/CONTRIBUTING.md) for detailed contribution guidelines.

---

## Publishing

See [docs/PUBLISHING.md](docs/PUBLISHING.md) for guides on publishing to GitHub and Steam Workshop.

---

## License

This project is licensed under the MIT License - see [TOTC_ThinkOfTheChildren/LICENSE](TOTC_ThinkOfTheChildren/LICENSE) for details.

The Project Zomboid mod and associated assets are provided as-is for educational and entertainment purposes.

---

## Acknowledgments

- **Project Zomboid** by The Indie Stone
- **Helen Lovejoy** from The Simpsons for the inspiration
- The Project Zomboid modding community

---

**Made with ❤️ for the Project Zomboid community**</content>
<parameter name="filePath">c:\Users\raulillana\ModsPZ\PZ_MOD_TOTC\project\README.md