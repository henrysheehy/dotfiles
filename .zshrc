# Enable colors and change prompt:
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}

zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}

zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_ALL_DUPS
setopt SHARE_HISTORY INC_APPEND_HISTORY

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey '^[[1;5B' expand-or-complete
bindkey '^[[1;5A' reverse-menu-complete
bindkey -M menuselect '^[[D' vi-backward-char
bindkey -M menuselect '^[[1;5D' vi-up-line-or-history
bindkey -M menuselect '^[[C' vi-forward-char
bindkey -M menuselect '^[[1;5C' vi-down-line-or-history
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

# bindkey 'h' vi-backward-char
# bindkey 'k' vi-up-line-or-history
# bindkey 'l' forward-word
# bindkey 'j' vi-down-line-or-history

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'

# Open file
bindkey -s '^t' 'xdg-open $(fzf) ^M'

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey -s '^e' 'nvim $(fzf) ^M'

# plugins
plugins=(
  fzf
)

# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND="find -L"

alias make-silent="make >/dev/null || make"


# Move between words:
# bindkey "^[h" backward-word 
# bindkey "^[l" forward-word
# bindkey -e
#
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# mkcd and cd into it
mkcdir ()
{
    mkdir -p -- "$1" &&
       cd -P -- "$1"
}

alias gi="git init ."
# alias gc="git commit -m"
alias gs="git status -s"
alias gl="git log --oneline"
alias gd="git diff"
alias gu="git reset HEAD~"
alias gp="git push"
alias gpull="git pull"

alias v="nvim"
alias y="yay -Syu --noconfirm"

function ga() {
    if [ "$1" != "" ]
    then
          git add "$1"
    else
          echo "Provide argument to 'git add'"
    #     git commit -m update # default commit message is `update`
    fi # closing statement of if-else block
    git push #origin HEAD
}
function gc() {
    if [ "$1" != "" ]
    then
          git commit -m "$1"
    else
          echo "Provide commit message"
    #     git commit -m update # default commit message is `update`
    fi # closing statement of if-else block
    git push #origin HEAD
}

export PYTHONPATH=~/Private/texts/python:~/Private/projects/PythU
export OPENER='rifle'

function zle-line-init {
    marking=0
}
zle -N zle-line-init

function select-char-right {
    if (( $marking != 1 ))
    then
        marking=1
        zle set-mark-command
    fi
    zle .forward-char
}
zle -N select-char-right

function select-char-left {
    if (( $marking != 1 ))
    then
        marking=1
        zle set-mark-command
    fi
    zle .backward-char
}
zle -N select-char-left

function forward-char {
    if (( $marking == 1 ))
    then
        marking=0
        NUMERIC=-1 zle set-mark-command
    fi
    zle .forward-char
}
zle -N forward-char

function backward-char {
    if (( $marking == 1 ))
    then
        marking=0
        NUMERIC=-1 zle set-mark-command
    fi
    zle .backward-char
}
zle -N backward-char

function delete-char {
    if (( $marking == 1 ))
    then
        zle kill-region
        marking=0
    else
        zle .delete-char
    fi
}
zle -N delete-char

# bindkey ';6D' select-word-left ## not working yet
# bindkey ';6C' select-word-right ## not working yet
# bindkey ';2D' select-char-left   # assuming xterm
# bindkey ';2C' select-char-right  # assuming xterm

bindkey '^[[D' backward-char
bindkey '^[[C' forward-char
bindkey '^[[1;5D' vi-backward-word
bindkey '^[[1;5C' vi-forward-word
bindkey '^?' backward-delete-char
bindkey '^[[3~' delete-char
bindkey '^H' backward-kill-word
bindkey '^[[3;2~' kill-word

bindkey '^@' clear-screen
