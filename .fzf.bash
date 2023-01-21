# Setup fzf
# ---------
if [[ ! "$PATH" == */home/hjs/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/hjs/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/hjs/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/hjs/.fzf/shell/key-bindings.bash"
