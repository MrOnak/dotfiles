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
unsetopt beep
# End of lines configured by zsh-newuser-install

# load aliases
if [ -f ~/.sh_aliases ]; then
    . ~/.sh_aliases
fi

# ssh agent
eval $(ssh-agent) >/dev/null

# FZF
#export FZF_DEFAULT_OPTS="--height 40% --border=sharp --no-unicode --layout=reverse-list --preview='head -10 {}' --preview-window='right,40%,border-left,wrap'"
export FZF_DEFAULT_OPTS="--height 40% --border=sharp --no-unicode --preview='head -10 {}' --preview-window='right,40%,border-left,wrap'"
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
[ -f ~/.config/fzf.zsh ] && source ~/.config/fzf.zsh

# run 10kpowerlevel theme
source ~/.config/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.

[[ ! -f ~/.config/p10k.zsh ]] || source ~/.config/p10k.zsh
