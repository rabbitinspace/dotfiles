<p align="center">
  
# dotfiles

![1.png](screenshots/1.png)

Here's used software:

- **Terminal**: [kitty](https://sw.kovidgoyal.net/kitty/)
- **Shell**: [fish](https://fishshell.com/)
- **Editor**: [emacs](https://github.com/hlissner/doom-emacs)
- **Prompt**: [pure](https://github.com/rafaelrinaldi/pure)
- **WM**: [bspwm](https://github.com/baskerville/bspwm) + [polybar](https://github.com/polybar/polybar)
- **Launcher**: [rofi](https://github.com/davatorium/rofi)

</p>

---

I use Void Linux at the moment and [`abyss`](https://github.com/rabbitinspace/abyss) to bootstrap it on my hardware.

## Requirements

- Void Linux
- [fish](https://fishshell.com/)

## Installation

There's a script which is supposed to setup a newly installed Void Linux distribution:

```fish
git clone git@github.com:rabbitinspace/dotfiles.git .dotfiles
cd .dotfiles && bootstrap/main.fish
```

Then reboot.
