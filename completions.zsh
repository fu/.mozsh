autoload -Uz compinit
if [[ -n "$ZDOTDIR/.zcompdump" && (( "$ZDOTDIR/.zcompdump" -nt "$ZDOTDIR/.zcompinit" ) || ! -s "$ZDOTDIR/.zcompinit") ]]; then
  compinit -i
else
  compinit -C -i
fi
