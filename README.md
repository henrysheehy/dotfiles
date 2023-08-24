# .files
These are my dotfiles for configuring the
[Arch Linux distribution](https://archlinux.org/). 

The most straightforward manner to implement them --if you're
not already on Arch --is to install [Manjaro i3](https://manjaro.org/download/).
Once that is up and working, then clone my dotfiles to 
your home directory.

## AUR and Python backup
Run `INSTALL.sh` to install my programmes from the [Arch Linux User Repository](https://aur.archlinux.org/) and [Python Package Index](https://pypi.org/project/pip/)

### What's in here? 
- Alacritty is a terminal emulator
- Autokey with my dotfiles transforms `hjkl` to arrow keys, or shift
arrow keys when ctrl is held simultaneously
- Caffeine to prevent sleep during full screen
- Fcitx language input
- Flameshot screen grab
- i3 and i3 polybar (personal configuration)
- Inkscape for LaTeX figures
- [Inkscape-LaTeX integration](https://github.com/gillescastel/inkscape-figures) by [Gilles Catel ✝2022](https://castel.dev/)
- Luavim built up from a foundation of [dotfiles](https://github.com/ejmastnak/dotfiles/) by [Elijan J. Mastnak](https://www.ejmastnak.com/)

## Keyboard
In order to use my keyboard (English, Greek, Chinese 
(Pinyin), Russian (phonetic), please run `keyboard.sh`
for the first time, and if the .keyboard configuration
is modified.

To use the languages
- Hold left-alt for Greek via XKB.
- Press right-windows key for Russian via XKB.
- Ctrl+spacebar for Chinese via Fcitx.

## To-do
- Fix autokey for input areas, such as dmenu
- Fix [inkscape-shortcut-manager](https://github.com/gillescastel/inkscape-shortcut-manager) bugs and push it the AUR as a package.

*** 
    My dotfiles for configuring Arch Linux
    Copyright (C) 2023 Henry Joseph Sheehy
