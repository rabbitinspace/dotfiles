#!/usr/bin/env bash
#
# Wrapper to run this launcher:
# https://github.com/Biont/sway-launcher-desktop

set -euo pipefail
export TERMINAL_COMMAND="kitty"

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"

exec "$DIR"/sway-launcher-desktop.sh
