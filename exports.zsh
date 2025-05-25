export PATH=$HOME/bin:$PATH

# Virtual env wrapper
if [[ -a /Users/cf322940/Library/Python/3.9/bin/virtualenvwrapper.sh ]]; then
    show_message "Virtual env installed @ 3.9"
    # echo $'%{$FG[BLUE]%}[%{$FX[reset]%}%  - %{$FG[BLUE]%}]%{$FX[reset]%} %{$1%}'
    export VIRTUAL_ENV_DISABLE_PROMPT=1
    export VIRTUALENVWRAPPER_PYTHON=/Library/Frameworks/Python.framework/Versions/3.9/bin/python3.9
    export WORKON_HOME=$HOME/.virtualenvs
    export PROJECT_HOME=$HOME/dev
    source /Users/cf322940/Library/Python/3.9/bin/virtualenvwrapper.sh
fi

export DYLD_LIBRARY_PATH=/usr/local/oracle/instantclient_18_1:$DYLD_LIBRARY_PATH
export LDFLAGS="-L/usr/local/opt/gettext/lib"
export CPPFLAGS="-I/usr/local/opt/gettext/include"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export DOTNET_ROOT="/usr/local/share/dotnet"

if [[ "$USER" == "cf322940" ]]; then
    export REQUESTS_CA_BUNDLE="/Users/cf322940/.virtualenvs/fpreppy3-p311/lib/python3.11/site-packages/certifi/cacert.pem"
fi
# export CERT_PATH=/etc/ssl/certs/ZscalerRootCA.pem
# export CERT_DIR=/etc/ssl/certs/
# export SSL_CERT_FILE=${CERT_PATH} 
# export SSL_CERT_DIR=${CERT_DIR}
# export REQUESTS_CA_BUNDLE=${CERT_PATH} 
# Talos installation
export TALOSCONFIG=$HOME"/_out/talosconfig"                  
export CONTROL_PLANE_IP="192.168.0.40"
talosctl config endpoint $CONTROL_PLANE_IP
talosctl config node $CONTROL_PLANE_IP
