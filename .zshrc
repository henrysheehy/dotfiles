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

export FZF_DEFAULT_COMMAND="find -L"

alias make-silent="make >/dev/null || make"

alias kmp="killall mplayer ; killall mplayer;  killall screenkey; killall droidcam-cli"


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


# Shortcuts
alias H="ranger $VAULT"
alias DA="ranger $DATA"
alias P="ranger $PROJ"
alias I="ranger $PICS"
alias N="ranger $NOTE"
alias B="ranger $BOOK"
alias M="ranger $MUSIC"
alias A="ranger $ART"
alias D="ranger $DOCS"
# alias DI="ranger $DIST"
# alias VI="ranger $VIDEO" 
alias W="ranger $WORK"
alias C="ranger $CONF"
alias S="ranger $SNIP"
alias V="nvim $INIT"
alias SC="ranger $SCRIPT"
alias L="ranger $LSP"

alias CL='find . -regextype posix-egrep -regex ".*\.(aux|bbl|bcf|blg|fdb_latexmk|fls|run.xml|synctex.gz|tdo|toc|log|hst|ver|out)$" -delete'

note() {
    dir=`pwd`
    title="$(echo "$1" | sed 's/.*/\u&/' | sed 's/-/ /g' | sed 's/_/ /g')"
    file=$1".md"
    file=$NOTE/$file
    if [ ! -e "$file" ] ; then
        echo "# $title
Entry: `date`  
" > $file
        if [ "$dir" != "$HOME" ] && [ "$dir" != $NOTE ]; then
          ln -s $file $dir
          echo "[Working directory]($dir)

" >> $file
        fi
    else
        var=`grep -Eo 'Entry:* *:*:* .*' $file | tail -1 | awk -F' ' '{print $2" "$3" "$4" "$5" "$6" "$7}' | tr -d ]`
        last="$(echo "$var" | awk '{print "date -d\""$1FS$2FS$3"\" +%Y%m%d"}' | bash )"
        today=`date +%Y%m%d`
        if [ "$today" != "$last" ] ; then
            echo "
Entry: `date`  
" >> $file
        fi
    fi
    nvim -c "startinsert" + $file 
}
alias n='note'
alias iso="date +"%Y-%m-%dT%H:%M:%S%:z""

################################################################################
# https://superuser.com/questions/823883/how-to-justify-and-center-text-in-bash
# Formatting using printf
# 
# _L == total length for 'L' and 'R' options
# tl == total length for 'C' option
# _c == center for 'C' option ( tl / 2 )
# fill == filler character or space by default
# 
# Default lengths declared at top of function
# 
# usage $) f_M [string] [L,R,C] [character count]
#       -S option:
#       $) f_M -S [character] [total length (- for default 'space')]
#        -3rd var ($3) is needed for filler character ($2) or
#         else ($2) is total length
# 
# 

f_M () {
    tl=72
    _c=36
    _L=16
    f_numread () {
        printf $1 | sed ':a;s/\B[0-9]\{3\}\>/,&/;ta'
    }
    f_C () {
        local x=$(printf $1 | wc -c)
        local y=$(expr $_c - $(expr $x / 2))
        local z=$(expr $tl - $y)
        local space=' '
        printf "%${y}s%-${z}s\n" "$space" "$1"
    }
    case $1 in
        -S)
            fill=' '
            if [[ -n $2 ]]; then
                if [[ -n $3 ]]; then
                    fill="$2"
                    if [[ $3 =~ ^-?[0-9]+$ ]]; then
                        tl=$3
                    fi
                else
                    if [[ $2 =~ ^-?[0-9]+$ ]]; then
                        tl=$2
                    fi
                fi
            fi
            printf "${fill}%.0s" {1..$tl}
            ;;
        *)
            if [[ $3 =~ ^-?[0-9]+$ ]]; then
                tl=$3
                _L=$3
                _c=$(expr $tl / 2)
            fi
            if [[ $1 =~ ^-?[0-9]+$ ]]; then
                local x=$(f_numread $1)
                case $2 in
                    L)
                        printf "%-${_L}s\n" "$x" ;;
                    R)
                        printf "%${_L}s\n" "$x" ;;
                    C)
                        f_C $x ;;
                    "")
                        printf '%s\n' $x
                esac
            else
                case $2 in
                    L)
                        printf "%-${_L}s\n" "$1" ;;
                    R)
                        printf "%${_L}s\n" "$1" ;;
                    C)
                        f_C $1 ;;
                    "")
                        printf '%s\n' $1
                esac
            fi
            ;;
    esac
}

# f_fancy_box () {
    # local s=''
    # for s in ${text[@]}; do
    #     case $s in
    #         000) printf '%b\n' "<$(f_M -S = -)>" ;;
    #         ---) printf '%b\n' "| $(f_M -S - 70) |" ;;
    #         *) printf '%b\n' "|$(f_M $s C)|" ;;
    #     esac
    # done
# }

f_fancy_box () {
    a=("$@")
    
    local s=''
    for s in "${a[@]}" ; do
      case $s in
          000) printf '%b\n' "#$(f_M -S = -)#" ;;
          ---) printf '%b\n' "# $(f_M -S - 70) #" ;;
          TIT*) printf '%b\n' "#$(f_M "* ${s#TIT } *" C)#" ;;
          *) printf '%b\n' "#$(f_M "$s" C)#" ;;
      esac
    done
  }

copyright () {
      text=(
"000"
" "
"TIT ${1}"
"${2}"
"Authored by Henry Sheehy"
"Copyright (c) `date +%Y-%m-%d`"
"All rights reserved"
" "
"Licensed under the"
"GNU Library General Public License version 2.0 (LGPLv2.0)"
" "
"000"
)

f_fancy_box $text
}
################################################################################


# plugins
plugins=(
  fzh
)

# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
source "/usr/share/zsh/plugins/zsh-system-clipboard/zsh-system-clipboard.zsh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PASSWORD_STORE_DIR="/vault/Secure/.pass/"
export GNUPGHOME="/vault/Secure/.gnupg/"
export UserKnownHostsFile="/vault/Secure/.ssh/config/known_hosts.d/"
export NVIM_LISTEN_ADDRESS="/tmp/nvimsocket"
