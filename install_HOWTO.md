# linux system installation hints

These are collected notes on installation and configuration of useful linux
applications. This document referes to and is linked to my personal dotfiles
and may not apply seamlessly to anyone but myself.

# BASICS: libraries and tools
* `sudo apt install autoconf automake libtool libncurses libncurses5 dconf-editor apt-file`
* `sudo apt install w3m w3m-img`

## SSH
* `touch ~/.ssh/config`

```
Host github_MrOnak
  HostName github.com
  User git
  IdentityFile ~/.ssh/mrOnak_at_github_2022
  IdentitiesOnly yes
  AddKeysToAgent yes
```

## FZF fuzzy finder and configure
* `sudo apt install fd-find`
* `ln -s /usr/bin/fdfind /usr/bin/fd`
* `git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf`
* `~/.fzf/install`

* move .fzf files to .config (**or install dotfiles**)
  * `cp -r ~/.fzf/shell ~/.config/fzf/shell`
  * `cp -r ~/.fzf/bin ~/.config/fzf/bin`
  * `mv ~/.fzf.bash ~/.config/fzf/fzf.bash`
  * `mv ~/.fzf.zsh ~/.config/fzf/fzf.zsh`
  * `rm -rf ~/.fzf`
  * change the keybind from Ctrl-t to Ctrl-f in ~/.config/fzf/shell/key-bindings.bash

## nerd font 
* download the recommended font for the powerlevel10k zsh theme. if the theme isn't used, you can use any font from nerdfonts.com
* `wget -P ~/.fonts https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf`
* `wget -P ~/.fonts https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf`
* `wget -P ~/.fonts https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf`
* `wget -P ~/.fonts https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf`
* `fc-cache -fv`

## BASH

### add ssh-agent to .bashrc (**included in dotfiles**)
```
eval $(ssh-agent -s)
```

If you add `AddKeysToAgent yes` to a host in .ssh/config then the key is automatically
added to ssh-agent after the first time you enter the password 

### bash-git status integration

See this: https://github.com/romkatv/gitstatus

### add FZF to ~/.bashrc (**included in dotfiles**)
```
# fuzzy finder
[ -f ~/.config/fzf/.fzf.bash ] && source ~/.config/fzf/.fzf.bash
export FZF_DEFAULT_OPTS="--height 40% --border=sharp --no-unicode --layout=reverse-list --preview='head -10 {}' --preview-window='right,40%,border-left,wrap'"
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
[ -f ~/.config/fzf/fsf.bash ] && source ~/.config/fzf/fzf.bash
```

## switching to ZSH
* `sudo apt install zsh`
* `chsh -s $(which zsh)`

### zsh theme and styling
* go to https://github.com/romkatv/powerlevel10k and follow instructions
* add custom bits to .zshrc before powerlevel10k-theme is sourced:

```
# ssh agent
eval $(ssh-agent)

#load helper functions
source $ZDOTDIR/zsh-functions

# load aliases
zsh_add_file "$ZDOTDIR/zsh_aliases"

# load plugins
zsh_add_plugin "zsh-users/zsh-autosuggestions" # https://github.com/zsh-users/zsh-autosuggestions
zsh_add_plugin "zsh-users/zsh-syntax-highlighting" # https://github.com/zsh-users/zsh-syntax-highlighting

# FZF
#export FZF_DEFAULT_OPTS="--height 40% --border=sharp --no-unicode --layout=reverse-list --preview='head -10 {}' --preview-window='right,40%,border-left,wrap'"
export FZF_DEFAULT_OPTS="--height 40% --border=sharp --no-unicode --preview='head -10 {}' --preview-window='right,40%,border-left,wrap'"
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
zsh_add_file "$HOME/.config/fzf/fzf.zsh"
```

## install kitty terminal emulator
* `sudo apt install kitty`

change `i3-sensible-terminal` in ~/.config/i3/config to `kitty`

### configure kitty and use nerdfont (**included in dotfiles**)
configuration file is in .configure/kitty/kitty.conf

the kitty.conf is excellently documented, just look and see 

I found setting these options to be beneficial
```
font_family        MesloLGS NF
font_size          12

cursor #ff00ff
cursor_text_color #cccccc
cursor_blink_interval 0

enable_audio_bell yes
```

## install ranger file manager and addon dependencies
* `sudo apt install ranger atool unrar highlight mediainfo caca-utils imagemagick `
* `pip install pillow`

### ranger configuration (**included in dotfiles**)
copy ranger config files to ~/.config
* `ranger --copy-config=commands`
* `ranger --copy-config=scope`
* `ranger --copy-config=rifle`
* `ranger --copy-config=rc`

enable image-preview powered by kitty terminal adapt the `~/.config/ranger/rc.conf`
```
set image_preview true
set preview_images_method kitty
```

go through the whole file and change other things. 

rc.conf is also the place to add / change keybinds

### ranger plugins (**included in dotfiles**)
#### devicons (relies on nerdfont)
* `git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons`
* `echo "default_linemode devicons" >> $HOME/.config/ranger/rc.conf`

#### ranger-FZF integration
copy the "fzf integration" plugin to `~/.config/ranger/commands.py`

add keybind to `~/.config/ranger.rc.conf`

comment out the emacs mappings as they're blocking Ctrl-f

find the `# Searching` block and add:

`map <C-f> fzf_select`

## NEOVIM
### prerequisites 
* `sudo apt install git unzip wget curl tar`
* `sudo apt install ripgrep`
* `sudo apt install python3 python3-pip`
* `pip3 install --upgrade pynvim`
* `sudo apt install nodejs npm`
* `sudo npm cache clean -f`
* `sudo npm install -g n`
* `sudo n stable`
* `sudo npm install -g neovim`

### neovim itself
* `git clone https://github.com/MrOnak/neovim_cfg.git ~/.config/nvim`
* `cd ~/.config/nvim`
* `git checkout nerdfont`
* `cd ~`
* `sudo add-apt-repository ppa:neovim-ppa/stable`
* `sudo apt update`
* `sudo apt install neovim`

## ncmpcpp command-line media player
* `sudo apt install ncmpcpp mpd mpdris2 mpc` - console based media player 
  * comment-out wildmidi in /etc/mpd.conf, also see ~/.config/ncmpcpp/ and ~/.config/mpd/
  * add keybinds for media keys to ~/.config/i3/config
  * allow mpd to run as user: `systemctl --user enable mpd`

## CLI screenshotter

See https://github.com/MrOnak/i3_cli_screenshotter

# i3wm graphical environment
## i3 applications
* chromium
  * chromium extensions: ghostery, adblock plus, dark reader, bitwarden, smartup gestures
* `sudo apt install qalculate`
  * (set this to floating in i3/config: `for_window [class="Qalculate" instance="qalculate"] floating enable`)

## screensaver
* `sudo apt install xscreensaver`

add these lines to `~/.config/i3/config`:

```
exec --no-startup-id xset s 300 300
exec --no-startup-id xset dpms 300 600 900
```

This will turn screens black after 300 seconds, suspend the monitors after 600
and switch them off after 900.

## aethetics in i3
* `sudo apt install picom feh`

### configure i3 (**included in dotfiles**)
* `cp /usr/share/doc/picom/examples/picom.sample.conf ~/.config/picom.conf`
* `vi ~/.config/i3/config`

```
# picom for opacity and things (https://wiki.archlinux.org/title/Picom) 
exec --no-startup-id picom --config ~/.config/picom.conf

# feh handles wallpapers (https://man.archlinux.org/man/feh.1)
exec_always --no-startup-id feh --bg-fill ~/Pictures/wallpapers/mars.jpg ~/Pictures/wallpapers/earth3.jpg

```

## use nerdfont to improve the i3status

add this to ~/.config/i3/config:

```
font pango:MesloLGS NF, pango:Ubuntu Mono, pango:monospace 10
```


