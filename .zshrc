#
#   mo zsh
#   ------
#
#   Link this .zshrc to your home :)
#.  and have LOCAL_GIT_REPO point to the folder with the git
#
#   by C. Fufezan et al.


local LOCAL_GIT_REPO="$HOME/.mozsh-vanilla"

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

# Sourcing /etc/zprofile here is generally not standard for .zshrc.
# .zshrc is for interactive shells, while /etc/zprofile is for login shells.
# If completion or other settings are conflicting, this might be a place to check.
# Consider removing this if you don't have a specific need for it in every interactive shell.
if [[ -a /etc/zprofile ]]; then
    # source /etc/zprofile
fi

export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/fu/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

# Google Cloud SDK - Prefer sourcing via brew --prefix
source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"

# The following lines for Google Cloud SDK are redundant if the brew --prefix versions above are working.
# If you specifically need the version from Downloads, ensure the brew --prefix lines are commented out.
# if [ -f '/Users/fu/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/fu/Downloads/google-cloud-sdk/path.zsh.inc'; fi
# if [ -f '/Users/fu/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/fu/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
