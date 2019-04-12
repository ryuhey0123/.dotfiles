# .dotfiles

Welcome to Ryuhey's dotfiles. Using machine :

| Hardware                                  | OS                   |
| ----------------------------------------- | -------------------- |
| Macbook Pro (Retina, 15-inch, Early 2013) | macOS Mojave 10.14.4 |
|                                           | WIndows 8.1 (on VM)  |
| iMac                                      | macOS Mojave 10.14.4 |
|                                           | Windows 10 (on VM)   |
| Macbook Air                               | Archlinux            |

## Install

Clone this repository to $HOME directory and run install script.

``` sh
$ sh install.sh
```

For Italic font support, making terminfo file.

```
$ vim /tmp/xterm-256color-italic.terminfo
```

Witre :

```
# A xterm-256color based TERMINFO that adds the escape sequences for italic.
xterm-256color-italic|xterm with 256 colors and italic,
  sitm=\E[3m, ritm=\E[23m,
  use=xterm-256color,
```

And, 

```sh
$ tic /tmp/xterm-256color-italic.terminfo
```

At iTerm2,

- Preferences → Profiles → Text  check  **italic text allowed**
- Preferences → Profiles → Terminal → Report Terminal Type  input  **xterm-256color-italic**

**ATTENTION**

This script install some application without your confirmation. And there is not Uninstall script.

## Application list

Auto install Application is marked by ⭐️.

### Editor

- [neovim](https://github.com/neovim/neovim) ⭐️

  Vim-fork focused on extensibility and usability

- [pycahrm](https://www.jetbrains.com/pycharm/)

  Python IDE

- [MacVim](https://github.com/macvim-dev/macvim)

  GUI VIM()

- [Typora](https://typora.io/)

  Markdown editor

- [Table tool](https://github.com/jakob/TableTool)

  A simple CSV editor for the Mac

- Texpad

- Xcode

### Terminal emulator

- [iTerm](https://www.iterm2.com/index.html) ⭐️

  Standard terminal emulator

- [Hyper](https://hyper.is/)

  Made up by electron (https://hyper.is/)

- [Alacritty](https://github.com/jwilm/alacritty)

  GPU supported terminal emulator

### Shell

- [zsh](https://www.zsh.org/) ⭐️

  A shell designed for interactive use

- [fish](https://fishshell.com/)

  Finally, a command line shell for the 90s

### Shell Plugin/Tools

- [zplug](https://github.com/zplug/zplug) ⭐️

  A next-generation plugin manager for zsh

- [tmux](https://github.com/tmux/tmux) ⭐️

  A terminal multiplexer

- [fzf](https://github.com/junegunn/fzf) ⭐️

   A command-line fuzzy finder

- [z](https://github.com/rupa/z) ⭐️

  Jump around

- [mas](https://github.com/mas-cli/mas) ⭐️

  Mac App Store command line interface

### Web browser

- Google chrome

### Office suite

- Microsoft Excel
- Microsoft Word

### Communication

- [Slack](https://slack.com/intl/ja-jp/)


### Utility

- [Alfred 3](https://www.alfredapp.com/)

  An award-winning app for macOS

- [MagicPrefs](http://magicprefs.com/)

   Improve the functionality and configuration options of the Apple Magic Mouse.

- [AppCleaner](https://freemacsoft.net/appcleaner/)

  A small application which allows you to thoroughly uninstall unwanted apps

- [The Unarchiver](https://theunarchiver.com/)

  The only app you need to open RAR on Mac

### Viewer

- [Skim](https://skim-app.sourceforge.io/)

  A PDF reader and note-taker for OS X

- [Vectorworks 2019 Viewer](http://www.aanda.co.jp/download/detail/vwviewerdl_2019.html)

  A CAD viewer

### Virtual machine

- VMware fusion

