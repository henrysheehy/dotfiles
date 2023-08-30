# Dotfiles and programmes
My dotfiles for configuring my [Arch-based](https://archlinux.org/)
operating system and the programmes I use to streamline 
research and publication (to journals, website, and personal and
collaborative notes).

The dotfiles configure my desktop environment, terminal theme,
shortkeys, keyboard language settings (Latin accents, Russian, Greek, Chinese),
LaTeX write up workflow, with streamlined Inkscape figure drawing,
Zotero bibliography plugins, and many other useful settings.

# Table of Contents

- [Dotfiles and programmes](#dotfiles-and-programmes)
- [Table of Contents](#table-of-contents)
    - [What's in here?](#whats-in-here)
    - [Instructions](#instructions)
        - [Installing Arch Linux](#installing-arch-linux)
        - [Cloning the repository](#cloning-the-repository)
        - [Install my programmes](#install-my-programmes)
            - [Vim plugins](#vim-plugins)
        - [Keyboard](#keyboard)
        - [Firefox plugins](#firefox-plugins)
            - [Zotero](#zotero)
            - [Other plugins I recommend](#other-plugins-i-recommend)
        - [Wallpaper](#wallpaper)
    - [Troubleshooting](#troubleshooting)
        - [Installing Arch](#installing-arch)
            - [First solution](#first-solution)
            - [Second solution](#second-solution)
    - [Thank you](#thank-you)
        - [Guinea pig](#guinea-pig)

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

The most straightforward manner to implement my configuration --if you're
not already on [Arch](https://archlinux.org/) --is to install [Manjaro i3](https://manjaro.org/download/).
Once that is up and running, then clone my dotfiles to 
your home directory.

### Installing Arch Linux

Install Arch using the [Manjaro i3 distribution](https://manjaro.org/download/),
following the instructions therein. 
See [troubleshooting](#Troubleshooting) should you encounter any problems.

### Cloning the repository

Start your terminal --on i3, the shortcut is `<mod+CR>` i.e. your mod key
(usually left windows key) + enter, simultaneously. 

Next, enter these commands in order, pressing enter at the end of every line:

```
yay -S git
y
cd
git init
rm .bash_profile .Xresources .bashrc .config/i3/config
git remote add origin https://github.com/henrysheehy/dotfiles.git
git pull origin master
```

1. The first command installs git, a version control system i.e. for
   systematically sharing work; the second command confirms installation.
2. `cd` navigates to your home directory, wherein we want to install our 
   dot files.
3. Initialise the git repository.
4. Remove conflicting files
5. Add my repository URL
6. Pull the branch i.e. download the files

### Install my programmes
1. Update the local [Arch Linux User Repository (AUR)](https://aur.archlinux.org/) with
   `yay -Syu`.
   This will also update your programmes and kernel.
2. Run `sh .script/INSTALL.sh` to install my programmes from the AUR and [Python Package Index](https://pypi.org/project/pip/)

#### Vim plugins
In order to install the plugins when using Vim for the first time, 
Open Vim by entering `v my_first_file.md`. 
This will create a file with the given name in your current working directory (cwd).
Inside the Vim instance, type `:PlugInstall`.

### Keyboard
In order to use my keyboard (English, Greek, Chinese 
(Pinyin), Russian (phonetic), please 
execute `sh .script/keyboard.sh`
for the first time, and if the .config/.keyboard configuration file
is modified.

To use the languages
- Hold left-alt for Greek via XKB.
- Press right-windows key for Russian via XKB.
- Ctrl+spacebar for Chinese via Fcitx.

### Firefox plugins

#### Zotero

1. [Install the Zotero connector](https://www.zotero.org/download/)
2. Install [Better BibTex](https://retorque.re/zotero-better-bibtex/installation/)
3. Configure shortcut for adding Zotero citation:Open <about:addons> in a Firefox tab
    3.1. Press the wheel
    3.2. Zotero Connector: Ctrl+Shift+F

Open Zotero using i3 with `<mod+z>`. You can now 
add citations from Firfox to the currently open Zotero folder.

#### Other plugins I recommend

- Vimium
- A password manager
- Darkreader

### Wallpaper

Simply make a wallpaper folder `mkdir Wallpaper` in the home
directory (`cd`, if you're not there already).
Add your favourite pictures 😃
To randomly cycle wallpaper, restart i3 with `mod+R`.

## Troubleshooting

### Installing Arch

#### First solution

If you have difficulties installing Manjaro i3, attempt to install
without connecting to the internet (to avoid unintentional kernel 
updates).
Once you're up and running, install the (stable arch kernel)[https://archlinux.org/packages/core/x86_64/linux-lts/].
This kernel was written for those experiencing kernel panics on the usual install.
Install using

```bash
yay -S linux-lts
```

Importantly, don't run `yay -Syu` before installing this kernel! We don't 
want to update the repository or kernel before installing the stable kernel.

#### Second solution

If that fails, an alternative distribution which has succeeded for 
others (thanks Cris!) is [Endeavour OS](https://endeavouros.com/download/).
As with Manjaro, install offline, and once running, install linux-lts.

## Thank you

Thank you for using [this repository](https://github.com/henrysheehy/dotfiles).
If it is helpful to you, kindly give it a star.

### Guinea pig

Thank you to Cris ([Ciprian-Cristian Vijeu](https://research.kent.ac.uk/pqm/person/ciprian-cristian-vijeu/))
for helping to make this installation more stable for future users 😎🤙

*** 
    My dotfiles for configuring Arch Linux
    Copyright (C) 2023 Henry Joseph Sheehy
