export PATH=$HOME/bin:$PATH

# Virtual env wrapper
if [[ -a /Library/Frameworks/Python.framework/Versions/3.7/bin/virtualenvwrapper.sh ]]; then
    show_message "Virtual env installed"
    # echo $'%{$FG[BLUE]%}[%{$FX[reset]%}%  - %{$FG[BLUE]%}]%{$FX[reset]%} %{$1%}'
    export VIRTUAL_ENV_DISABLE_PROMPT=1
    export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
    export WORKON_HOME=$HOME/.virtualenvs
    export PROJECT_HOME=$HOME/dev
    source /Library/Frameworks/Python.framework/Versions/3.7/bin/virtualenvwrapper.sh
fi

export DYLD_LIBRARY_PATH=/usr/local/oracle/instantclient_18_1:$DYLD_LIBRARY_PATH
export LDFLAGS="-L/usr/local/opt/gettext/lib"
export CPPFLAGS="-I/usr/local/opt/gettext/include"