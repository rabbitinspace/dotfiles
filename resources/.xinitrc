#/usr/bin/env sh

set -euo

prepare_dirs() {
  mkdir -p "$HOME/.cache/wal"
  if [ ! -e "$HOME/.cache/wal/colors.Xresources" ]; then
    touch "$HOME/.cache/wal/colors.Xresources"
  fi
}

# Applies system and user X configurations.
merge_configs() {
  local sxrc="/etc/X11/xinit/.Xresources"
  local sxkb="/etc/X11/xinit/.Xmodmap"
  local uxrc="$HOME/.Xresources"
  local uxkb="$HOME/.Xmodmap"

  if [ -e "$sxrc" ]; then
    xrdb -I"$HOME" -merge "$sxrc"
  fi

  if [ -e "$sxkb" ]; then
    xmodmap "$sxkb"
  fi

  if [ -e "$uxrc" ]; then
    xrdb -I"$HOME" -merge "$uxrc"
  fi

  if [ -e "$uxkb" ]; then
    xmodmap "$uxkb"
  fi
}

# Applies additional xinitrc scripts.
start_sxrcs() {
  local path=/etc/X11/xinit/xinitrc.d
  if [ ! -d "$path" ]; then
    return
  fi

  for file in "$path"/?*.sh; do
    if [ -x "$file" ]; then
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
  prepare_dirs
  merge_configs
  start_sxrcs
  fix_cursor

  exec bspwm
}

main "$@"
