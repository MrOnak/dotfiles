# The following lines were added by compinstall
autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
setopt inc_append_history
setopt share_history
unsetopt beep
# End of lines configured by zsh-newuser-install

# ssh agent
eval $(ssh-agent) >/dev/null

#load helper functions
source $ZDOTDIR/zsh-functions

# load all the things 
zsh_add_file "$ZDOTDIR/zsh-vimode"
zsh_add_file "$ZDOTDIR/zsh-aliases"
zsh_add_file "$ZDOTDIR/zsh-keybinds"
zsh_add_plugin "zsh-users/zsh-autosuggestions" # https://github.com/zsh-users/zsh-autosuggestions
zsh_add_plugin "zsh-users/zsh-syntax-highlighting" # https://github.com/zsh-users/zsh-syntax-highlighting

# FZF
export FZF_DEFAULT_OPTS="--height 40% --border=sharp --no-unicode --preview='head -10 {}' --preview-window='right,40%,border-left,wrap'"
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
zsh_add_file "$HOME/.config/fzf/fzf.zsh"

# custom prompt with git integration
zsh_add_file "$ZDOTDIR/zsh-prompt"

