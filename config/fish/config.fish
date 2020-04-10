# vim:fileencoding=utf-8:ft=fish:foldmethod=marker

set WORK_DIR (dirname (status --current-filename))

# envs {{{
set -x EDITOR nvim
set -x GOBIN $HOME/.go/bin
set -x GO111MODULE on

set PATH $HOME/.go/bin $HOME/.local/bin $PATH
# }}}

# private envs {{{
if test -f $WORK_DIR/.private.fish
  source $WORK_DIR/.private.fish
end
# }}}

# wayland {{{
set -x MOZ_ENABLE_WAYLAND 1
set -x QT_QPA_PLATFORM wayland-egl
# }}}

# xdg {{{
if test ! (set -q XDG_DATA_HOME)
  set -x XDG_DATA_HOME $HOME/.local/share
end

if test ! (set -q XDG_CONFIG_HOME)
  set -x XDG_CONFIG_HOME $HOME/.config
end

if test ! (set -q XDG_DATA_DIRS)
  set -x XDG_DATA_DIRS /usr/local/share/:/usr/share/
end

if test ! (set -q XDG_CONFIG_DIRS)
  set -x XDG_CONFIG_DIRS /etc/xdg
end

if test ! (set -q XDG_CACHE_HOME)
  set -x XDG_CACHE_HOME $HOME/.cache
end

if test ! (set -q XDG_RUNTIME_DIR)
  set -q UID; set UID (id -u)
  set -x XDG_RUNTIME_DIR "/tmp/$UID-runtime-dir"
  if test ! -d $XDG_RUNTIME_DIR
    mkdir $XDG_RUNTIME_DIR
    chmod 0700 $XDG_RUNTIME_DIR
  end
end
# }}}

# fisher {{{
if not functions -q fisher
  curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
  fish -c fisher
end
# }}}

# colors {{{
if test -e $WORK_DIR/theme.fish
  source $WORK_DIR/theme.fish
end
# }}}

# {{{ rbenv
if type -q rbenv
  status --is-interactive; and source (rbenv init -|psub)
end
# }}}

# nix {{{
if type -q bass
  set source_path $HOME/.nix-profile/etc/profile.d/nix.sh
  if test -f $source_path
    bass source $source_path
  end
end
# }}}

# rust {{{
if test -d $HOME/.cargo
  set PATH $HOME/.cargo/bin $PATH
end
# }}}

# prompt {{{
if type -q _pure_prompt_git
  set -g async_prompt_functions _pure_prompt_git
end
# }}}

# sway {{{
if test -z "$DISPLAY" && test (tty) = /dev/tty1
  set -x XKB_DEFAULT_LAYOUT us
  if type -q dbus-launch
    exec dbus-launch sway
  else
    exec sway
  end
end
# }}}

# ssh {{{
if type -q fish_ssh_agent
  fish_ssh_agent
end
# }}}

# aliases  {{{
alias lg=lazygit
# }}}
