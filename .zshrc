#
#   mo zsh
#   ------
#
#   Link this .zshrc to your home :)
#.  and have LOCAL_GIT_REPO point to the folder with the git
#
#   by C. Fufezan et al.


local LOCAL_GIT_REPO="$HOME/.mozsh"

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

if [[ -a /etc/zprofile ]]; then
    source /etc/zprofile
fi
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/cf322940/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/cf322940/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/cf322940/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/cf322940/google-cloud-sdk/completion.zsh.inc'; fi

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/cf322940/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
