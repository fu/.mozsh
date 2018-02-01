export PATH=$HOME/bin:$PATH

# Virtual env wrapper
if [[ -a /usr/local/bin/virtualenvwrapper.sh ]]; then
    show_message "Virtual env installed"
    export VIRTUAL_ENV_DISABLE_PROMPT=1
    export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
    export WORKON_HOME=$HOME/.virtualenvs
    export PROJECT_HOME=$HOME/dev
    source /usr/local/bin/virtualenvwrapper.sh
fi

