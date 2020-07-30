#!/usr/bin/env fish
#
# Installs configuration and resources.

set ROOT (type -q git && git rev-parse --show-toplevel 2>/dev/null || pwd)

# Sets up X configuration.
function cfg_x
  # link X configuration
  sudo mkdir -p /etc/X11/xorg.conf.d/ || return 1
  set confs 20-amdgpu.conf 40-fonts.conf
  for conf in $confs
    sudo cp -f $ROOT/resources/$conf /etc/X11/xorg.conf.d/$conf || return 1
  end
end

# Configures additional system services.
function cfg_services
  sudo ln -s /etc/sv/dbus /var/service/
  sudo ln -s /etc/sv/elogind /var/service/
  sudo ln -s /etc/sv/NetworkManager /var/service/
  sudo ln -s /etc/sv/sddm /var/service/

  sudo rm /var/service/dhcpcd
end

# Sets up user's configuration.
function cfg_configs
  # define config dir location
  if ! set -q XDG_CONFIG_HOME
    set XDG_CONFIG_HOME $HOME/.config
  end

  # link user configuration
  mkdir -p $XDG_CONFIG_HOME
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

# Installs fonts from resources.
function cfg_fonts
  set -l path /usr/share/fonts/JetBrainsMono
  sudo mkdir -p $path

  pushd $ROOT/resources
  unzip -d jbmono jbmono.zip

  set -l ttf (fd ttf jbmono | head -n1)
  sudo cp -R $ttf $path
  rm -rf jbmono
  popd

  fc-cache -fv
end

# Configures everything.
function main
  cfg_x || return 1
  cfg_services || return 1
  cfg_configs || return 1
  cfg_fonts || return 1
  cfg_wal || return 1
end

main $argv
