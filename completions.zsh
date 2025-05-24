autoload -Uz compinit
if [[ -n "$ZDOTDIR/.zcompdump" && (( "$ZDOTDIR/.zcompdump" -nt "$ZDOTDIR/.zcompinit" ) || ! -s "$ZDOTDIR/.zcompinit") ]]; then
  compinit -i
else
  compinit -C -i
fi

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh