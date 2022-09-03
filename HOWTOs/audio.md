# how to get audio to work and set the correct audio device

Install pulse audio daemon and cli utilities: `sudo apt install pulseaudio pulseaudio-utils`

`pactl` is the command line helper, available commands through `pactl help`

To list all audio output devices: `pactl list short sinks`.

To change the default sink: `pactl set-default-sink [x]` where [x] is either the
index or the device name. The command does not persist through reboots though 
so to make a change permanent, you need to set the sink in `/etc/pulse/default.pa`

Near the end of the file there are lines `set-default-source` and `set-default-sink`,
just add the device name there (without `pactl`).

Note that the numerical audio device indexes from `pactl list short sinks` seem
to change with reboots, so it is better to use the full device name in `default.pa`
