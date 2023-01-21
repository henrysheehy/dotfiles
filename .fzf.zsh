# Setup fzf
# ---------
if [[ ! "$PATH" == */home/hjs/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/henrys/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/hjs/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/hjs/.fzf/shell/key-bindings.zsh"
