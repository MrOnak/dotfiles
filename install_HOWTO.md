## install FZF and configure
* `sudo apt install fd-find`
* `ln -s /usr/bin/fdfind /usr/bin/fd`
* `git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf`
* `~/.fzf/install`

* move .fzf files to .config
* `cp -r ~/.fzf/shell ~/.config/fzf/shell`
* `cp -r ~/.fzf/bin ~/.config/fzf/bin`
* `mv ~/.fzf.bash ~/.config/fzf/.fzf.bash`
* `rm -rf ~/.fzf`

* change the keybind from Ctrl-t to Ctrl-f in ~/.config/fzf/shell/key-bindings.bash

* adapt the ~/.bashrc
```
# fuzzy finder
[ -f ~/.config/fzf/.fzf.bash ] && source ~/.config/fzf/.fzf.bash
export FZF_DEFAULT_OPTS="--height 40% --border=sharp --no-unicode --layout=reverse-list --preview='head -10 {}' --preview-window='right,40%,border-left,wrap'"
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
```

# SSH
* `touch ~/.ssh/config`

```
Host github_MrOnak
  HostName github.com
  User git
  IdentityFile ~/.ssh/mrOnak_at_github_2022
  IdentitiesOnly yes
```

* adapt .bashrc with keybind to register SSH password
```
_ssh_add_key() {
  echo "register SSH key password"
  eval $(ssh-agent -s)
  ssh-add ~/.ssh/mrOnak_at_github_2022
}

bind -x '"\C-t": _ssh_add_key'
```

# prerequisites for neovim 
* `sudo apt install git unzip wget curl tar`
* `sudo apt install ripgrep`
* `sudo apt install python3 python3-pip`
* `pip3 install --upgrade pynvim`
* `sudo apt install nodejs npm`
* `sudo npm cache clean -f`
* `sudo npm install -g n`
* `sudo n stable`
* `sudo npm install -g neovim`

# install nerd font
* download the "hack" font .zip file from nerdfonts.com:
* `wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip`
* `unzip Hack.zip`
* `mkdir ~/.fonts`
* `mv *.ttf ~/.fonts`
* `fc-cache -fv`
* close all instances of the terminal and set custom font

# neovim itself
* `git clone https://github.com/MrOnak/neovim_cfg.git ~/.config/nvim`
* `cd ~/.config/nvim`
* `git checkout nerdfont`
* `cd ~`
* `sudo add-apt-repository ppa:neovim-ppa/stable`
* `sudo apt update`
* `sudo apt install neovim`

# install ranger file manager and addon dependencies
* `suto apt install ranger atool unrar highlight mediainfo caca-utils kitty imagemagick w3m w3m-img`

copy ranger config files to ~/.config
* `ranger --copy-config=commands`
* `ranger --copy-config=scope`
* `ranger --copy-config=rifle`
* `ranger --copy-config=rc`

enable image preview powered by w3m
`vi ~/.config/ranger/rc.conf`

set parameter `set image_preview` to true

go through the whole file and change other things. 

rc.conf is also the place to add / change keybinds

## ranger plugins
### devicons (relies on nerdfont)
* `git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons`
* `echo "default_linemode devicons" >> $HOME/.config/ranger/rc.conf`

### FZF integration
copy the "fzf integration" plugin to `~/.config/ranger/commands.py`

add keybind to `~/.config/ranger.rc.conf`

comment out the emacs mappings as they're blocking Ctrl-f

find the `# Searching` block and add:

`map <C-f> fzf_select`

# aethetics in i3
* `sudo apt install picom feh`
* `cp /usr/share/doc/picom/examples/picom.sample.conf ~/.config/picom.conf`
* `vi ~/.config/i3/config`

add these lines
```
# picom for opacity and things (https://wiki.archlinux.org/title/Picom) 
exec --no-startup-id picom --config ~/.config/picom.conf

# feh handles wallpapers (https://man.archlinux.org/man/feh.1)
exec_always --no-startup-id feh --bg-fill ~/Pictures/wallpapers/mars.jpg ~/Pictures/wallpapers/earth3.jpg

```

## use nerdfont to improve the i3status

add this to ~/.config/i3/config:

```
font pango:Hack Nerd Font Mono, pango:Ubuntu Mono, pango:monospace 10
```

# libraries and tools
* `sudo apt install autoconf automake libtool libncurses libncurses5 dconf-editor apt-file`

# CLI tools
* `sudo apt install rxvt-unicode` - terminal emulator
  * @TODO must include config ~/.Xdefaults here
  * change `i3-sensible-terminal` to `rxvt-unicode` in ~/.config/i3/config
* `sudo apt install ncmpcpp mpd mpdris2 mpc` - console based media player 
  * comment-out wildmidi in /etc/mpd.conf, also see ~/.config/ncmpcpp/ and ~/.config/mpd/
  * add keybinds for media keys to ~/.config/i3/config
  * allow mpd to run as user: `systemctl --user enable mpd`

# i3 applications
* chromium
  * chromium extensions: ghostery, adblock plus, dark reader, bitwarden, smartup gestures
* `sudo apt install qalculate`
  * (set this to floating in i3/config: `for_window [class="Qalculate" instance="qalculate"] floating enable`)

# switching to ZSH
* `sudo apt install zsh`
* go to https://github.com/romkatv/powerlevel10k and follow instructions
* add custom bits to .zshrc before powerlevel10k-theme is sourced:

```
# load aliases
if [ -f ~/.sh_aliases ]; then
    . ~/.sh_aliases
fi

# ssh agent
ssh-add-key() {
  echo "register SSH key password"
  eval $(ssh-agent)
  ssh-add ~/.ssh/mrOnak_at_github_2022
}
zle     -N            ssh-add-key
bindkey -M emacs '^T' ssh-add-key
bindkey -M vicmd '^T' ssh-add-key
bindkey -M viins '^T' ssh-add-key

# FZF
#export FZF_DEFAULT_OPTS="--height 40% --border=sharp --no-unicode --layout=reverse-list --preview='head -10 {}' --preview-window='right,40%,border-left,wrap'"
export FZF_DEFAULT_OPTS="--height 40% --border=sharp --no-unicode --preview='head -10 {}' --preview-window='right,40%,border-left,wrap'"
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
```
