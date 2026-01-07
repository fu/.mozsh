autoload -Uz compinit
if [[ -n "$ZDOTDIR/.zcompdump" && (( "$ZDOTDIR/.zcompdump" -nt "$ZDOTDIR/.zcompinit" ) || ! -s "$ZDOTDIR/.zcompinit") ]]; then
  compinit -i
else
  compinit -C -i
fi

source "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
# if [[ "$USER" == "fu" ]]; then
#   [[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)
# else
#   [[ /Users/cf322940/.rd/bin/kubectl ]] && source <(kubectl completion zsh)
# fi

# Google Cloud SDK - Prefer sourcing via brew --prefix
source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"