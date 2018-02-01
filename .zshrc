#
#   mo zsh
#   ------
#
#   Link this .zshrc to your home :)
#.  and have LOCAL_GIT_REPO point to the folder with the git
#
#   by C. Fufezan et al.


local LOCAL_GIT_REPO="$HOME/.zsh_git"

#First we source core and zsh option

source $LOCAL_GIT_REPO/_options.zsh
source $LOCAL_GIT_REPO/_core.zsh


for zsh_addon in $LOCAL_GIT_REPO/(^_*).zsh(.);
    do
        # show_message "Sourcing ${zsh_addon}"
        source ${zsh_addon}
    done

if [[ -a ~/.zshrc_user ]]; then
    source ~/.zshrc_user
fi
