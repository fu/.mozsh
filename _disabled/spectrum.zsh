#! /bin/zsh
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

SAMUEL_L_IPSUM=${SAMUEL_L_IPSUM:-Look, just because I don't be givin' no man a foot massage }

# Show all 256 colors with color number
function spectrum_ls() {
  for code in {000..255}; do
    print -P -- "$code: %{$FG[$code]%}$SAMUEL_L_IPSUM%{$reset_color%}"
  done
}

# Show all 256 colors where the background is set to specific color
function spectrum_bls() {
  for code in {000..255}; do
    print -P -- "$code: %{$BG[$code]%}$SAMUEL_L_IPSUM%{$reset_color%}"
  done
}
