# ze_fu Theme
#
# my good old zsh theme ported to oh-my-zsh.
#
# very git-centric. Sorry :)
#
# Color functions to make using 256 colors in zsh less painful.
# P.C. Shyamshankar <sykora@lucentbeing.com>
# Copied from http://github.com/sykora/etc/blob/master/zsh/functions/spectrum/
# extended by cf
# colors and stuff are done in _core
#

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

function git_branch_info() {
    git_branch=`git rev-parse --abbrev-ref HEAD 2>/dev/null`
    echo $git_branch
}


function git_branch_info_bugged() {
    ref=`git branch` 2>|/dev/null
    if [[ -n ${ref} ]]; then
        git_branch=`echo $ref | grep '^\*' | sed 's=\* ==g'`
    else
        git_branch='      '
    fi
    echo $git_branch
}

function virtual_env_project_info() {
    if [[ -n $VIRTUAL_ENV  ]];then
        virtual_env_basename=`echo $VIRTUAL_ENV:t`
    else
        virtual_env_basename=' '
    fi
    echo $virtual_env_basename
}

function su_or_not() {
    if [[ $UID -eq 0 ]];then
        su_status="%{$FG[RED]%}%{$FX[blink]%}#%{$FX[reset]%}"
    else
        su_status="%{$FG[GREY]%}$%{$FX[reset]%}"
    fi
    echo $su_status
}

#A=Black
#B=Red
#C=Green
#D=Brown
#E=Blue
#F=Purple
#G=Cyan
#H=Gray
#I=Transparent
#X=None
#Capital letters Bold
export CLICOLOR=1
#               -+-+-+-+-+-+-+-+-+-+-+
export LSCOLORS=ExFxBxDxCxegedabagahad
#               ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^
#               | | | | | | | | | | +- dir writeothers NOsticky
#               | | | | | | | | | +- dir writeothers sticky
#               | | | | | | | | +-exe setguid
#               | | | | | | | +-exe setuid
#               | | | | | | +-char_special
#               | | | | | +-block special
#               | | | | +-Executable
#               | | | +-Pipe
#               | | +-Socket
#               | +-Symbolic link
#               +-Dir
# <<>> http://geoff.greer.fm/lscolors/ <<>>

PROMPT=$'%{$FG[RED]%}%U %u%{$FX[reset]%}%n%{$FG[GREEN]%}@%{$FG[RED]%}%m%{$FX[reset]%}: %{$FG[GREEN]%}%~
    %{$FG[BLUE]%}%i %{$FG[GREEN]%}$(git_branch_info)%{$FX[reset]%} %{$FG[GREY]%}$(su_or_not)%{$FX[reset]%} '

RPS1=$'%{$FG[BLUE]%}$(virtual_env_project_info) %{$FG[RED]%}[%{$FX[reset]%}%*%{$FG[RED]%}]%{$FX[reset]%}'
RPS0=$'>>>'
RPS2=$'><><>>'
