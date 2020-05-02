#!/usr/bin/env fish
#
# Bootstraps clean Void Linux installation.

set DIR (dirname (status --current-filename))

function main
  # install dependencies
  $DIR/deps.fish || return 1

  # install configuration
  $DIR/cfg.fish || return 1
end

main $argv
