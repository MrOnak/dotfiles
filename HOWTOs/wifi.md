# screensaver

`sudo apt install xscreensaver`

Without xscreensaver the settings in `~/.config/i3/config` cannot act

Within `~/.config/i3/config` put these:

```
exec --no-startup-id xset s 300 300
exec --no-startup-id xset dpms 300 600 900
```



