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

# function git_branch_info() {
#     git_branch=`git branch --show-current 2>/dev/null`
#     echo $git_branch
# }


# function git_branch_info_bugged() {
#     ref=`git branch` 2>|/dev/null
#     if [[ -n ${ref} ]]; then
#         git_branch=`echo $ref | grep '^\*' | sed 's=\* ==g'`
#     else
#         git_branch='      '
#     fi
#     echo $git_branch
# }

# git_prompt() {
#     if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
#         unset git_prompt
#         return 0
#     fi

#     local git_status_dirty git_status_stash git_branch

#     if [ "$(git --no-optional-locks status --untracked-files='no' --porcelain)" ]; then
#         git_status_dirty='%F{green}*'
#     else
#         unset git_status_dirty
#     fi

#     if [ "$(git stash list)" ]; then
#         git_status_stash="%F{yellow}▲"
#     else
#         unset git_status_stash
#     fi

#     git_branch="$(git symbolic-ref HEAD 2>/dev/null)"
#     git_branch="${git_branch#refs/heads/}"

#     if [ "${#git_branch}" -ge 24 ]; then
#         git_branch="${git_branch:0:21}..."
#     fi

#     git_branch="${git_branch:-no branch}"
#     git_tag="${git describe --tags}"
#     git_prompt=" %F{blue}[%F{253}${git_branch}${git_status_dirty}${git_status_stash}%F{blue}]"
#     echo $git_prompt
# }

git_prompt_2() {
    if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        # Unset global 'git_prompt' if not in a git repo, in case other parts of the config use it.
        unset git_prompt 
        return 0
    fi

    local git_status_dirty git_status_stash git_branch

    # Number of files with staged changes
    local n_staged_files
    n_staged_files="$(git diff --cached --name-only --no-renames | wc -l | tr -d ' ')"
    n_staged_files="$((n_staged_files + 0))" # Ensure it's a number

    # Number of tracked files with any changes (staged or unstaged)
    local n_changed_tracked_files
    n_changed_tracked_files="$(git --no-optional-locks status --untracked-files='no' --porcelain | wc -l | tr -d ' ')"
    n_changed_tracked_files="$((n_changed_tracked_files + 0))" # Ensure it's a number

    # Current branch name, handles detached HEAD
    git_branch=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null || echo "DETACHED")
    local remote_branch
    remote_branch="$(git for-each-ref --format='%(upstream:short)' "refs/heads/$git_branch" 2>/dev/null)"

    diffs="$(git rev-list --count --left-right $git_branch...$remote_branch)"
    diffs=${=diffs}
    n_behind_remote=$diffs[3]
    n_ahead_of_remote=$diffs[1]
    git_tag="$(git describe --tags)"

    local prompt_content="🌿 %{$FG[GREEN]%}${git_branch} %{$FG[008]%}${git_tag} ∫%{$FG[GREEN]%}${n_staged_files}%{$FX[reset]%}|%{$FG[RED]%}${n_changed_tracked_files}%{$FX[reset]%} %{$FG[RED]%}↧${n_behind_remote} %{$FG[YELLOW]%}↥${n_ahead_of_remote}%{$FX[reset]%}"
    echo "$prompt_content"
}

# simple_git_python () {
#     info=`echo $PWD | python3 ~/bin/git_status_parser.py`
#     info=(${(s/ /)info})
#     # # one git call to rule them all
#     # # {branch} {n_committed_files} {n_not_staged_for_commit} {n_untracked_files}
#     git_tag=$info[2]
#     git_branch=$info[4]
#     n_not_staged_for_commit=$info[6]
#     n_committed_files=$info[8]
#     # n_untracked_files=$info[4]
#     n_ahead_of_remote=$info[10]
#     n_behind_remote=$info[12]

#     # # git_prompt="${info[1]}"
#     git_prompt="%{$FG[GREEN]%}${git_branch} %{$FG[008]%}${git_tag} %{$FG[GREEN]%}${n_committed_files}%{$FX[reset]%}|%{$FG[RED]%}${n_not_staged_for_commit}%{$FX[reset]%} %{$FG[RED]%}${n_behind_remote} %{$FG[YELLOW]%}${n_ahead_of_remote}%{$FX[reset]%}"
#     echo $git_prompt
# }

function virtual_env_project_info() {
    if [[ -n $VIRTUAL_ENV  ]];then
        virtual_env_basename=`echo $VIRTUAL_ENV:t`
    else
        virtual_env_basename=''
    fi
    echo $virtual_env_basename
}

function su_or_not() {
    if [[ $UID -eq 0 ]];then
        su_status="%{$FG[RED]%}%{$FX[blink]%}#"
    else
        su_status="%{$FG[GREY]%}$"
    fi
    echo $su_status
}

function setprompt() {
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

#     PROMPT='%{$FG[RED]%}%U %u %{$FX[reset]%}%n%{$FG[GREEN]%}@%{$FG[RED]%}%m%{$FX[reset]%}:%{$FG[GREEN]%}~
# %{$FX[reset]%} %{$FG[GREY]%}%{$(su_or_not)%}%{$FX[reset]%} '
    PROMPT='%{$FG[RED]%}%U %u %{$FX[reset]%}%n%{$FG[GREEN]%}@%{$FG[RED]%}%m%{$FX[reset]%}:%{$FG[GREEN]%}%~
%{$FG[GREEN]%}%#%{$FG[RED]%}> %{$FX[reset]%}'
    # RPROMPT=$'${vcs_info_msg_0_}'
    RPROMPT=$'$(git_prompt_2) %{$FG[BLUE]%}$(virtual_env_project_info) %{$FG[008]%}%*%{$FX[reset]%}'
    # RPS0=$'>>>'
    # RPS2=$'><><>>'
}
setprompt