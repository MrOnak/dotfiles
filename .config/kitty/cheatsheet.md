# kitty terminal emulator common keybinds

refers to my personal configuration, not necessarily the default

The kittykey <K> is Ctrl-Shift

Content in a kitty term is organized as follows:
* the top level is the OS window
* each OS window consists of one or more tabs
* each tab consists of one or more kitty windows
* kitty windows can be arranged in different layouts

## todos
* find a better keybind to close kitty, Ctrl-Shift-w is asking too much
* what does Ctrl-j do?
* what does Ctrl-l do?

## tab management
| keybind       | description                                         |
| ------------- | --------------------------------------------------- |
| <K>-t         | open new tab                                        |
| <K>-alt-t     | set tab title                                       |
| <K>-q         | close current tab                                   |
| <K>-,         | rearrange current tab backward                      |
| <K>-.         | rearrange current tab forward                       |
| <K>-Left      | make previous tab active                            |
| <K>-Right     | make next tab active                                |

## (kitty) window control 
| keybind       | description                                         |
| ------------- | --------------------------------------------------- |
| <K>-<CR>      | create new kitty window                             |
| <K>-w         | close current kitty window. will kill kitty if last |
| <K>-b         | rearrange kitty window backward                     |
| <K>-f         | rearrange kitty window forward                      |
| <K>-[n]       | focus specific kitty window [n] = 1, 2, 3, ...      |
| <K>-l         | cycle through layouts. custom keybinds to jump to specific layouts directly are possible |
| <K>-r         | resize current window                               |

## other commands and helpers
| keybind       | description                                         |
| ------------- | --------------------------------------------------- |
| <K>-U         | unicode character input helper                      |

