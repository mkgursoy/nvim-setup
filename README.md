A modern, fast, and fully customizable Neovim configuration written in **Lua** and managed with **[lazy.nvim](https://github.com/folke/lazy.nvim)**. Built for productivity, quick navigation, clean aesthetics, and robust language tooling.

---

## Overview & Screenshots

<p align="center">
  <img src="https://ibb.co/rKPdsk5H" alt="Neovim Overview 1" width="48%" />
  <img src="https://ibb.co/yF20kSpR" alt="Neovim Overview 2" width="48%" />
</p>

---

## Prerequisites

Ensure you have the following installed on your system before setting up:

| Requirement | Description | Command (Mac) |
|---|---|---|
| **Neovim** | `>= v0.9.0` (0.10+ recommended) | `brew install nvim` |
| **(Optional) Nerd Font** | Required for UI icons | Download from [Nerd Fonts](https://www.nerdfonts.com/) |

---

## Installation & Integration

Follow these steps to integrate this setup into your system:

### 1. Backup Existing Configuration
If you already have a Neovim setup, back it up to prevent conflicts:

```bash
# Linux / macOS
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
```

### 2. Clone the Repository
Clone this repository directly to your Neovim configuration directory `~/.config/nvim`:

```bash
# Linux / macOS
git clone [https://github.com/mkgursoy/nvim-setup.git](https://github.com/mkgursoy/nvim-setup.git) ~/.config/nvim
```
