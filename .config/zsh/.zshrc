# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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

# run 10kpowerlevel theme
zsh_add_file "$HOME/.config/powerlevel10k/powerlevel10k.zsh-theme"
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.config/p10k.zsh ]] || source ~/.config/p10k.zsh
