<div align="center">

# dotfiles

[**Terminal**](https://sw.kovidgoyal.net/kitty/) • [**Shell**](https://fishshell.com/) • [**Editor**](https://github.com/hlissner/doom-emacs) • [**Prompt**](https://github.com/rafaelrinaldi/pure) • [**WM**](https://github.com/baskerville/bspwm) • [**Bar**](https://github.com/polybar/polybar) • [**Launcher**](https://github.com/davatorium/rofi)

![1.png](screenshots/1.png)

</div>

---

I use Void Linux at the moment and [`abyss`](https://github.com/rabbitinspace/abyss) to bootstrap it on my hardware.

## Requirements

- Void Linux
- Fish Shell
- Git + LFS

## Installation

There's a [script](bootstrap/main.fish) which is supposed to setup a newly installed Void Linux distribution:

```fish
git clone git@github.com:rabbitinspace/dotfiles.git .dotfiles
cd .dotfiles && bootstrap/main.fish
```

Then reboot.
