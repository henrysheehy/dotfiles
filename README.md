# Dotfiles
My dotfiles for configuring my desktop environment, terminal theme, shortkeys, keyboard settings, LaTeX write up workflow, and many other useful settings.

# Table of Contents

- [Dotfiles](#dotfiles)
- [Table of Contents](#table-of-contents)
    - [What's in here?](#whats-in-here)
    - [Instructions](#instructions)
        - [Cloning the repository](#cloning-the-repository)
        - [Install my programmes](#install-my-programmes)
            - [Vim plugins](#vim-plugins)
        - [Keyboard](#keyboard)
        - [Firfox plugins](#firfox-plugins)
            - [Zotero](#zotero)
    - [Thank you](#thank-you)

## What's in here? 
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
- Emojis! 🦄🌈🍭 Activate by pressing `<mod+y>`

## Instructions

The most straightforward manner to implement them --if you're
not already on [Arch](https://archlinux.org/) --is to install [Manjaro i3](https://manjaro.org/download/).
Once that is up and working, then clone my dotfiles to 
your home directory.

### Cloning the repository

Start your terminal --on i3, the shortcut is `<mod+CR>` i.e. your mod key
(usually left windows key) + enter, simultaneously. 

Next, enter these commands in order, pressing enter at the end of every line:

```
yay -S git
y
cd
git init
rm .Xresources .bashrc .config/i3/config
git remote add origin https://github.com/henrysheehy/dotfiles.git
git pull origin master
```

1. The first command installs git, a version control system i.e. for
   systematically sharing work; the second command confirms installation.
2. `cd` navigates to home directory, wherein we want to install our 
   dot files.
3. Initialise the git repository.
4. Add my URL
5. Pull the branch i.e. download the files

### Install my programmes
1. Update the local [Arch Linux User Repository (AUR)](https://aur.archlinux.org/) with
   `yay -Syu`.
   This will also update your programmes and kernel.
2. Run `sh Scripts/INSTALL.sh` to install my programmes from the AUR and [Python Package Index](https://pypi.org/project/pip/)

#### Vim plugins
In order to install the plugins when using Vim for the first time, 
type `:PlugInstall` in an instance of Vim open Vim by entering `v my_first_file.md`. This will create a file with the given name in your current working directory (cwd).

### Keyboard
In order to use my keyboard (English, Greek, Chinese 
(Pinyin), Russian (phonetic), please run `keyboard.sh`
for the first time, and if the .keyboard configuration
is modified.

To use the languages
- Hold left-alt for Greek via XKB.
- Press right-windows key for Russian via XKB.
- Ctrl+spacebar for Chinese via Fcitx.

### Firfox plugins

#### Zotero


## Thank you

Thank you for using this [repository](https://github.com/henrysheehy/dotfiles).
If it is helpful to you, kindly give it a star.

*** 
    My dotfiles for configuring Arch Linux
    Copyright (C) 2023 Henry Joseph Sheehy
