#!/usr/bin/env fish

set ROOT (type -q git && git rev-parse --show-toplevel 2>/dev/null || pwd)

# Sets up X configuration.
function cfg_x
  # link startup configuration
  set links .xinitrc .xmodmap .Xresources
  for link in $links
    ln -sf $ROOT/resources/$link $HOME/$link || return 1
  end

  # link X configuration
  sudo mkdir -p /etc/X11/xorg.conf.d/ || return 1
  set confs 20-amdgpu.conf
  for conf in $confs
    sudo ln -sf $ROOT/resouces/$conf /etc/X11/xorg.conf.d/$conf || return 1
  end
end

# Sets up user's configuration.
function cfg_configs
  # define config dir location
  if ! set -q XDG_CONFIG_HOME
    set XDG_CONFIG_HOME $HOME/.config
  end

  # link user configuration
  mkdir -p XDG_CONFIG_HOME
  for dir in $ROOT/config/*
    if ! test -d $dir
      continue
    end

    # remove existing directories if exists
    set cdir $XDG_CONFIG_HOME/(basename $dir)
    if test -d $cdir && ! test -h $cdir
      rm -rf $cdir || return 1
    end

    # and link it
    ln -sf $dir $cdir || return 1
  end
end

# Applies global theme.
function cfg_wal
  wal --theme horizon
end

function main
  cfg_x || return 1
  cfg_configs || return 1
  cfg_wal || return 1
end

main $argv
