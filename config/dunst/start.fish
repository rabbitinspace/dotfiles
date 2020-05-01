#!/usr/bin/env fish

function main
  pkill -x dunst
  dunst &
end

main $argv
