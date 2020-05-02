#!/usr/bin/env fish
#
# Installs all dependencies for a fresh system installation.

# Helper function to install packages.
#
# Args:
#   $argv - list of packages to install.
function pkg_install
  sudo xbps-install --force --sync --yes $argv
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
    font-awesome5 \
    mesa \
    mesa-vdpau
end

# Installs packages required for graphical session.
function install_wm
  pkg_install \
    bspwm \
    picom \
    sxhkd
end

# Installs packages to make graphical session more useful.
function install_wm_util
  pkg_install \
    dunst \
    polybar \
    rofi \
    dbus \
    tdrop
end

# Installs terminal and related packages.
function install_term
  pkg_install \
    fish-shell \
    kitty \
    pywal
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
    feh \
    mpv \
    zathura \
    alsa-utils \
    apulse \
    alsa-plugins-pulseaudio \
    pulseaudio
end

# Installs text editors.
function install_editors
  pkg_install \
    emacs-x11 \
    neovim
end

# Installs additional useful packages.
function install_utils
  pkg_install \
    fd \
    ripgrep \
    exa \
    unzip
end

# Installs everything.
function main
  install_xorg && \
    install_wm && \
    install_wm_util && \
    install_term && \
    install_dev && \
    install_media && \
    install_editors && \
    install_utils || return 1
end

main $argv
