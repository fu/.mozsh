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

alias mountMP='sshfs fu@192.168.0.2:/ ~/tmp/MountPoints/plan-e -oauto_cache,reconnect,volname=plan-e'
alias mountVHIP='sshfs -p 45423 fu@ebbweb01.uni-muenster.de:/ ~/tmp/MountPoints/vhip -oauto_cache,reconnect,volname=vhip'
alias mountLilly='sshfs fufezan@lillycsoft.net:/ ~/tmp/MountPoints/lilly -oauto_cache,reconnect,volname=lilly'
alias mountMP='sshfs sys0p@plan-b.uni-muenster.de:/ ~/tmp/MountPoints/plan-b -oauto_cache,reconnect,volname=plan-e'
alias mountPlanC='sshfs fu@128.176.144.130:/ ~/tmp/MountPoints/plan-c -oauto_cache,reconnect,volname=plan-c'

# alias blue="PROMPT_COLOR3='0;36m';PROMPT_COLOR2='0;32m';osascript ~/scripts/Terminal-app/blue.scpt"
# alias red="PROMPT_COLOR3='0;32m';PROMPT_COLOR2='0;35m';osascript ~/scripts/Terminal-app/red.scpt"
# alias black="PROMPT_COLOR3='0;36m';PROMPT_COLOR2='0;34m';osascript ~/scripts/Terminal-app/black.scpt"
# alias green="PROMPT_COLOR3='0;36m';PROMPT_COLOR2='0;33m';osascript ~/scripts/Terminal-app/green.scpt"
# alias white="PROMPT_COLOR3='0;34m';PROMPT_COLOR2='0;32m';osascript ~/scripts/Terminal-app/white.scpt"

alias vhip="ssh -Y fu@ebbweb01.uni-muenster.de -p 45423"

alias hestia="ssh -Y fu@134.74.186.110"
alias metis="ssh -Y christian@134.74.186.120"
alias sysphus="ssh -Y christian@134.74.186.82"
alias lilly="ssh fufezan@lilly.csoft.net"
alias terra='for ((i=0; i<1000; i++)); do growlnotify -s -m "peak "$i" @zero" && sleep 1800s; done'
alias iche190="ssh -Y christian@iche190.kfunigraz.ac.at"
alias iche187="ssh -Y christian@iche187.kfunigraz.ac.at"
alias iche183="ssh -Y itunes@ICHE154144.KFUNIGRAZ.AC.AT"
#TERAGRID
alias ornl="ssh chrifu@tg-login.ornl.teragrid.org"
alias tacc="ssh tg457597@lonestar.tacc.utexas.edu"
alias prdu="ssh chrifu@tg-login.purdue.teragrid.org"
alias sdsc="ssh chrifu@tg-login.sdsc.teragrid.org"
alias ucanl="ssh chrifu@tg-login.uc.teragrid.org"

## COMMAND ALIASES
alias h="ssh christian@hestia '$1'"
alias q="ssh chrifu@ornl '$1'"

## Mongo aliases
alias pq='mongo localhost:27023/piqdb'
alias shutDownMongos='mongo localhost:27023/admin --eval "printjson(db.shutdownServer())"'
alias startMongos='mongos -f $HOME/dev/Proteomics/piqdb/misc/_.local/mongosRouta.conf'

# SSH Tunnels

alias planBtunnel='echo "Establishing Mysql Proxy Tunnel to plan-b on 33060:localhost:3306 ...";ssh -L 33060:localhost:3306 -l sys0p -N plan-b.uni-muenster.de'

