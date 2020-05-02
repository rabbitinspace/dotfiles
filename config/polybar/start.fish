#!/usr/bin/env fish

set DIR (dirname (status --current-filename))

function main
  # terminate already running bar instances
  pkill -x polybar

  # wait until the processes have been shut down
  while pgrep -u (id -u) -x polybar >/dev/null; sleep 1; end

  # start polybar

  polybar desktop &
  polybar time &
  polybar date &

  PATH="$DIR:$PATH" \
    polybar pulse &
end

main $argv
