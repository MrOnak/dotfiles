# cheatsheet for common commands in ranger file manager

might contain custom keymaps set in ~/.config/ranger/rc.conf

## navigation

use nvim keys:
| key seq.  | description |
| --------- | ----------- |
| h         | up one level |
| k         | down one level |
| j         | down one item in list |
| k         | up one item in list |
| Ctrl-D    | scroll down one half screen |
| Ctrl-U    | scroll up one half screen |
| gh        | quick jump to home dir |

## copy path and information
| key seq.  | description |
| --------- | ----------- |
| yd        | yank directory information (excludes filename) |
| yp        | yank absolute path information (includes filename) |
| yn        | yank name (this is _only_ the file/dir name, no path |
| y.        | yank name without extension |

## operations
| key seq.  | description |
| --------- | ----------- |
| a         | rename append (cursor at end of current name, before extension) |
| A         | rename append (cursor at end of extension) |
| I         | rename insert (cursor at beginning of name) |
| <Space>   | mark file |
| v         | mark all files in current list |
| V         | mark in visual mode (can do this multiple times for segments) |
| uV        | unmark in visual mode
| t         | toggle tag |
| yy        | copy marked (if any), current otherwise |
| dd        | cut marked (if any), current otherwise |
| dD        | delete marked (if any), current otherwise |
| pp        | paste (will dynamically rename doubles) |
| po        | paste overwrite |
| pl        | paste absolute symlink to yy-copied file |
| pL        | paste relative symlink to yy-copied file |


