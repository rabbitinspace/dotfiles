#/usr/bin/env bash

set -euo

# Applies system and user X configurations.
merge_configs() {
  local sxrc="/etc/X11/xinit/.Xresources"
  local sxkb="/etc/X11/xinit/.Xmodmap"
  local uxrc="$HOME/.Xresources"
  local uxkb="$HOME/.Xmodmap"

  if [[ -e "$sxrc" ]]; then
    xrdb -merge $sxrc
  fi

  if [[ -e "$sxkb" ]]; then
    xmodmap $sxkb
  fi

  if [[ -e "$uxrc" ]]; then
    xrdb -merge $uxrc
  fi

  if [[ -e "$uxkb" ]]; then
    xmodmap $uxkb
  fi
}

# Applies additional xinitrc scripts.
start_sxrcs() {
  local path=/etc/X11/xinit/xinitrc.d
  if [[ ! -d "$path" ]]; then
    return
  fi

  for file in "$path"/?*.sh; do
    if [[ -x "$file" ]]; then
      . "$file"
    fi
  done
}

# Fixes cursor theme doesn't change.
fix_cursor() {
  # https://wiki.archlinux.org/index.php/Cursor_themes#Cursor_size_doesn't_change_on_startup
  xrandr

  # https://wiki.archlinux.org/index.php/Cursor_themes#Change_X_shaped_default_cursor
  xsetroot -cursor_name left_ptr
}

# Starts WM
main() {
  fix_cursor
  merge_configs
  start_sxrcs

  exec bspwm
}

main "$@"
