# The following lines were added by compinstall
zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename '/home/dominique/.zshrc'

autoload -Uz compinit
compinit
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

# load aliases
zsh_add_file "$ZDOTDIR/zsh-aliases"

# load plugins
zsh_add_plugin "zsh-users/zsh-autosuggestions" # https://github.com/zsh-users/zsh-autosuggestions
zsh_add_plugin "zsh-users/zsh-syntax-highlighting" # https://github.com/zsh-users/zsh-syntax-highlighting

# FZF
export FZF_DEFAULT_OPTS="--height 40% --border=sharp --no-unicode --preview='head -10 {}' --preview-window='right,40%,border-left,wrap'"
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
zsh_add_file "$HOME/.config/fzf/fzf.zsh"

# custom prompt with git integration
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst

#PROMPT_FGCOL='%F{240}'
#PROMPT_BGCOL='%K{default}'
PROMPT=$'\n$PROMPT_FGCOL%n @ %m%f %F{blue}%1~%f $vcs_info_msg_0_\n  %(?.%F{green}.%F{red})%#%f '
#RPROMPT='$PROMPT_BGCOL$vcs_info_msg_0_ $PROMPT_FGCOL %D{%H:%M}%f%k'

zstyle ':vcs_info:git:*' formats '%F{green} %b%f'
zstyle ':vcs_info:*' enable git

