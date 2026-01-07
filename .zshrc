#
#   mo zsh
#   ------
#
#   Link this .zshrc to your home :)
#.  and have LOCAL_GIT_REPO point to the folder with the git
#
#   by C. Fufezan et al.
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

local LOCAL_GIT_REPO="$HOME/.mozsh"

#First we source core and zsh option

source $LOCAL_GIT_REPO/_options.zsh
source $LOCAL_GIT_REPO/_core.zsh
source $LOCAL_GIT_REPO/_paths.zsh


for zsh_addon in $LOCAL_GIT_REPO/(^_*).zsh(.);
    do
        # show_message "Sourcing ${zsh_addon}"
        source ${zsh_addon}
    done

if [[ -a ~/.zshrc_user ]]; then
    source ~/.zshrc_user
fi

# Sourcing /etc/zprofile here is generally not standard for .zshrc.
# .zshrc is for interactive shells, while /etc/zprofile is for login shells.
# If completion or other settings are conflicting, this might be a place to check.
# Consider removing this if you don't have a specific need for it in every interactive shell.
if [[ -a /etc/zprofile ]]; then
    # source /etc/zprofile
fi


### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)


# export CPPFLAGS="-I/usr/local/opt/openjdk/include"
[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)

# Added by LM Studio CLI (lms)
# End of LM Studio CLI section

