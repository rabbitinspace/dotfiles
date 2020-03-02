# environment variables
set -x EDITOR nvim
set -x GOBIN /usr/local/bin
set -x GOPATH "$HOME"/.go

# wayland
set -x MOZ_ENABLE_WAYLAND 1
set -x QT_QPA_PLATFORM wayland-egl

# prompt
starship init fish | source

# set colors
edge_neon_colors

# sway
if test -z "$DISPLAY" && test (tty) = /dev/tty1
  set -x XKB_DEFAULT_LAYOUT us
  exec sway
end

# rbenv
if which rbenv >/dev/null
  status --is-interactive; and source (rbenv init -|psub)
end

# nix
if type -q bass
  set source_path $HOME/.nix-profile/etc/profile.d/nix.sh
  if test -f $source_path
    bass source $source_path
  end
end
