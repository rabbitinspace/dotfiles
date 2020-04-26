#!/usr/bin/env fish

# Applies system and user X configurations.
function merge_configs
  set sxrs /etc/X11/xinit/.Xresources
  set sxkb /etc/X11/xinit/.Xmodmap
  set uxrc "$HOME/.Xresources"
  set uxkb "$HOME/.Xmodmap"

  if test -e sxrc
    xrdb -merge $sxrc
  end

  if test -e sxkb
    xmodmap $sxkb
  end

  if test -e uxrc
    xrdb -merge $uxrc
  end

  if test -e uxkb
    xmodmap $uxkb
  end
end

# Applies additional xinitrc scripts
function start_sxrcs
  set path /etc/X11/xinit/xinitrc.d
  if test -d $path
    for file in $path/?*.sh
      if test -x $file
        $file
      end
    end
  end
end

# Starts WM
function main
  merge_configs
  start_sxrcs

  exec bspwm
end

main $argv
