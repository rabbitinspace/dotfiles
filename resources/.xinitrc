#!/usr/bin/env fish

# Applies system and user X configurations.
function merge_configs
  set sxrs /etc/X11/xinit/.Xresources
  set sxkb /etc/X11/xinit/.Xmodmap
  set uxrc "$HOME/.Xresources"
  set uxkb "$HOME/.Xmodmap"

  if test -e sxrc
    xrdb -merge $sxrc || return 1
  end

  if test -e sxkb
    xmodmap $sxkb || return 1
  end

  if test -e uxrc
    xrdb -merge $uxrc || return 1
  end

  if test -e uxkb
    xmodmap $uxkb || return 1
  end
end

# Applies additional xinitrc scripts.
function start_sxrcs
  set path /etc/X11/xinit/xinitrc.d
  if test -d $path
    for file in $path/?*.sh
      if test -x $file
        $file || return 1
      end
    end
  end
end

# Fixes cursor theme doesn't change.
function fix_cursor
  # https://wiki.archlinux.org/index.php/Cursor_themes#Cursor_size_doesn't_change_on_startup
  xrandr || return 1

  # https://wiki.archlinux.org/index.php/Cursor_themes#Change_X_shaped_default_cursor
  xsetroot -cursor_name left_ptr || return 1
end

# Starts WM
function main
  fix_cursor || return 1
  merge_configs || return 1
  start_sxrcs || return 1

  exec bspwm
end

main $argv
