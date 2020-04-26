#!/usr/bin/env fish

function main
  # terminate already running bar instances
  pkill -x polybar

  # wait until the processes have been shut down
  while pgrep -u (id -u) -x polybar >/dev/null; sleep 1; end

  # start polybar
  polybar main &
end

main $argv
