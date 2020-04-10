# wallpaper

set wallpaper "{wallpaper}"

# special

set background '{background}'
set foreground '{foreground}'
set cursor '{cursor}'

# colors

set color0 '{color0}'
set color1 '{color1}'
set color2 '{color2}'
set color3 '{color3}'
set color4 '{color4}'
set color5 '{color5}'
set color6 '{color6}'
set color7 '{color7}'
set color8 '{color8}'
set color9 '{color9}'
set color10 '{color10}'
set color11 '{color11}'
set color12 '{color12}'
set color13 '{color13}'
set color14 '{color14}'
set color15 '{color15}'

# fzf colors

set -x FZF_DEFAULT_OPTS "
    $FZF_DEFAULT_OPTS
    --color fg:7,bg:0,hl:1,fg+:232,bg+:1,hl+:255
    --color info:7,prompt:2,spinner:1,pointer:232,marker:1"

# fix LS_COLORS being unreadable

set -x LS_COLORS "$LS_COLORS:su=30;41:ow=30;42:st=30;44:"

# pure prompt

set -g pure_symbol_prompt "::"
set -g pure_symbol_git_unpulled_commits "↓"
set -g pure_symbol_git_unpushed_commits "↑"
set -g pure_reverse_prompt_symbol_in_vimode false
set -g pure_color_primary $color4
set -g pure_color_info $color6
set -g pure_color_mute $color8
set -g pure_color_success $color2
# set -g pure_color_normal
set -g pure_color_danger $color1
set -g pure_color_light $color7
set -g pure_color_warning $color3
set -g pure_color_dark $color0

# fish colors

set -g fish_color_command $color5 --bold
set -g fish_color_comment $color7
set -g fish_color_end $color5
set -g fish_color_error $color1
set -g fish_color_escape $color6
set -g fish_color_operator $color6
set -g fish_color_param $color4
set -g fish_color_quote $color3
set -g fish_color_redirection $color4
