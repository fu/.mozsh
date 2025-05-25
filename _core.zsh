#
autoload -U colors && colors

# A script to make using 256 colors in zsh less painful.
# P.C. Shyamshankar <sykora@lucentbeing.com>
# Copied from http://github.com/sykora/etc/blob/master/zsh/functions/spectrum/
# extended by cf

typeset -AHg FX FG BG

FX=(
    reset     "%{[00m%}"
    bold      "%{[01m%}" no-bold      "%{[22m%}"
    italic    "%{[03m%}" no-italic    "%{[23m%}"
    underline "%{[04m%}" no-underline "%{[24m%}"
    blink     "%{[05m%}" no-blink     "%{[25m%}"
    reverse   "%{[07m%}" no-reverse   "%{[27m%}"
)

for color in {000..255}; do
    FG[$color]="%{[38;5;${color}m%}"
    BG[$color]="%{[48;5;${color}m%}"
done

BASIC_COLORS=(BLACK RED GREEN YELLOW BLUE MAGENTA CYAN WHITE)
INDEX=(000 001 002 003 004 005 006 007 008)

for (( i = 1; i <= $#BASIC_COLORS; i++ )) do
  FG[$BASIC_COLORS[$i]]="%{[38;5;$INDEX[$i]m%}"
  BG[$BASIC_COLORS[$i]]="%{[48;5;$INDEX[$i]m%}"
done


function show_message() {
    print -P -- '%{$FG[BLUE]%}[%{$FX[reset]%}%  - %{$FG[BLUE]%}]%{$FX[reset]%} %{$1%}'
}

HISTSIZE=500000
SAVEHIST=500000
HISTFILE=$HOME/.history
PAGER='less'


# Watchlist
WATCHFMT='%n %a at %t %w.'
watch=( root )

# Key bindings for word deletion with Option+Shift+Arrow

# Option + Shift + Left Arrow: delete word left
# Common sequence: \e[1;4D
bindkey '\e[1;10D' backward-kill-word

# Option + Shift + Right Arrow: delete word right
# Common sequence: \e[1;4C
bindkey '\e[1;10C' kill-word
