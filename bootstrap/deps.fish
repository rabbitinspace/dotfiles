#!/usr/bin/env fish
#
# Installs all dependencies for a fresh system installation.

# Helper function to install packages.
#
# Args:
#   $argv - list of packages to install.
function pkg_install
  sudo xbps-install --force --sync --yes $argv || return 1
end

# Installs Xorg related packages.
function install_xorg
  pkg_install \
    xorg-minimal \
    xf86-video-amdgpu \
    xf86-input-libinput \
    noto-fonts-ttf \
    noto-fonts-ttf-extra \
    noto-fonts-cjk \
    noto-fonts-emoji \
    mesa \
    mesa-vdpau
end

# Installs elogind and dbus with elogind support.
function install_de
  pkg_install \
    kde5 \
    kde5-baseapps \
    elogind \
    dbus-elogind \
    NetworkManager
end

# Installs fish shell and related packages.
function install_shell
  pkg_install \
    fish-shell \
    python3 \
    python3-pip

  sudo pip install pywal
end

# Installs developer related tools.
function install_dev
  pkg_install \
    rustup \
    go \
    gcc \
    clang \
    git \
    lazygit
end

# Installs media related packages.
function install_media
  pkg_install \
    alsa-utils \
    apulse \
    alsa-plugins-pulseaudio \
    pulseaudio
end

# Installs text editors.
function install_editors
  pkg_install \
    neovim
end

# Installs additional useful packages.
function install_utils
  pkg_install \
    fd \
    ripgrep \
    exa \
    unzip \
    curl
end

# Installs everything.
function main
  install_xorg && \
    install_de \
    install_shell && \
    install_dev && \
    install_media && \
    install_editors && \
    install_utils || return 1
end

main $argv
