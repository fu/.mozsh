alias l="ls -lha"
alias lr="ls -lhatr"
# alias top='top -s1 -o cpu -R -F'
alias p="python3"

alias ono="~/bin/O_V10/osx_ono"
alias vmd='"$vmdappdir/Resources/VMD.app/Contents/MacOS/VMD" $*'
alias ced='subl'
alias xmgrace2pdf='xmgrace $1 -hdevice PDF -hardcopy'
alias irb="echo 'No f!)@#() way ...'"
alias genCloud='java -jar $HOME/bin/ibm-word-cloud.jar -c $HOME/.ibm-word-cloud.config -w 4800 -h 2400'
alias mountSpeedDisk='diskutil erasevolume HFS+ "SpeedDisk" `hdiutil attach -nomount ram://10485760`'
alias mate='subl'

# alias blue="PROMPT_COLOR3='0;36m';PROMPT_COLOR2='0;32m';osascript ~/scripts/Terminal-app/blue.scpt"
# alias red="PROMPT_COLOR3='0;32m';PROMPT_COLOR2='0;35m';osascript ~/scripts/Terminal-app/red.scpt"
# alias black="PROMPT_COLOR3='0;36m';PROMPT_COLOR2='0;34m';osascript ~/scripts/Terminal-app/black.scpt"
# alias green="PROMPT_COLOR3='0;36m';PROMPT_COLOR2='0;33m';osascript ~/scripts/Terminal-app/green.scpt"
# alias white="PROMPT_COLOR3='0;34m';PROMPT_COLOR2='0;32m';osascript ~/scripts/Terminal-app/white.scpt"

## Mongo aliases
alias pq='mongo localhost:27023/piqdb'
alias shutDownMongos='mongo localhost:27023/admin --eval "printjson(db.shutdownServer())"'
alias startMongos='mongos -f $HOME/dev/Proteomics/piqdb/misc/_.local/mongosRouta.conf'

# SSH Tunnels
