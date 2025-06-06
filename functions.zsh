set_cntlm_env () {
    if [ -z "$1" ]
    then
        echo "Require argument, i.e. corp or home"
    else
        case "$1" in
            (corp*) echo "Setting corp vars in cntlmd"
                NoProxy="NoProxy        localhost, 127.0.0.*, 10.*, 192.168.*"
                # unset ALL_PROXY
                ;;
            (*) echo "Disabling cntlmd routing"
                NoProxy="NoProxy *"
                # export http_proxy="http://localhost:3128"
                # export https_proxy="http://localhost:3128"
                # export ftp_proxy="http://localhost:3128"
                # export ALL_PROXY=localhost:3128
                ;;
        esac
        echo "Editing ~/etc/cntlm.conf"
        if [ ! -f ~/etc/cntlm.conf.bak ]; then
            rm ~/etc/cntlm.conf.bak
        fi
        cp ~/etc/cntlm.conf ~/etc/cntlm.conf.bak
        sed "s/^NoProxy.*$/$NoProxy/g" ~/etc/cntlm.conf.bak >| ~/etc/cntlm.conf
        echo "Starting cntlm"
        cntlm -v -f -c ~/etc/cntlm.conf
    fi
}

$function set_profile() {
    PROFILE=${1}
    echo "tell app \"Terminal\" to set current settings of first window to settings set \"${PROFILE}\""|osascript; };


$function msconvert() {
    if [ -z "$1" ]
    then
        echo "Require raw file. Will use msconvert --zlib --inten32 --gzip as cmd line."
    else
        # org_cmd="docker run -it -v /Volumes/b.dump:/Volumes/b.dump harbor.gsk.com/cz_cms/base-images/proteowizard:3.0.20287 wine msconvert --zlib --inten32 --gzip /Volumes/b.dump/ms-data/DTB-IAA/08041_F1_R1_P0285945A01_TMT10.raw -o /Volumes/b.dump/ms-data/DTB-IAA"
        folder=$PWD/$1:h
        baseimage="harbor.gsk.com/cz_cms/base-images/proteowizard:3.0.20287"
        echo "docker run -it --rm -v $folder:$folder $baseimage wine msconvert --zlib --32 --gzip $1 -o $folder"
        docker run -it --rm -v $folder:$folder $baseimage wine msconvert --zlib --32 --gzip $PWD/$1 -o $folder
    fi
}


termtitle() {
    case "$TERM" in
        rxvt*|xterm*|nxterm|gnome|screen|screen-*|st|st-*)
            local prompt_host="${(%):-%m}"
            local prompt_user="${(%):-%n}"
            local prompt_char="${(%):-%~}"
            case "$1" in
                precmd)
                    printf '\e]0;%s@%s: %s\a' "${prompt_user}" "${prompt_host}" "${prompt_char}"
                ;;
                preexec)
                    printf '\e]0;%s [%s@%s: %s]\a' "$2" "${prompt_user}" "${prompt_host}" "${prompt_char}"
                ;;
            esac
        ;;
    esac
}



$function k8s_delete_n_apply() {
    if [ -z "$1" ]
    then
        echo "folder with yamls"
    else
        kubectl delete -f $PWD/$1
        find $PWD/$1 -type f -name '*.yml' | grep -v '/secret' | xargs -n 1 kubectl apply -f
    fi
}