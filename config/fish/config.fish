# environment variables
set -x EDITOR nvim
set -x GOBIN /usr/local/bin
set -x GOPATH "$HOME"/.go

# wayland
set -x MOZ_ENABLE_WAYLAND 1

# prompt
starship init fish | source
