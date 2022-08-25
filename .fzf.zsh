# Setup fzf
# ---------
if [[ ! "$PATH" == */home/dominique/.config/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/dominique/.config/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/dominique/.config/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/dominique/.config/fzf/shell/key-bindings.zsh"
