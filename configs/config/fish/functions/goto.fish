function goto --argument-names action place
    if set -q _flag_version
        printf '%s\n' "goto, version 0.0.🤷‍♂️"
    else if set -q _flag_help
        _goto_help
    else if functions --query _goto_$action
        _goto_$action $place
    else
        _goto_help
        return 1
    end
end

function _goto_help
    printf '%s\n' \
        'Usage: goto [options] subcommand [options]' \
        '' \
        'Options:' \
        '  -v or --version  print goto version number' \
        '  -h or --help     print this help message' \
        '' \
        'Subcommands:' \
        '  configure   run interactive configuration wizard' \
        '  bug-report  print info for use in bug reports'
end

function _goto_run_cmd
    echo ($argv)
end

function _goto_set_env
    _goto_run_cmd overmind s
    kitty @ set-tab-title "$name"
end

function _goto_work --argument-names place
    set regex "$place:?\w*"
    set toDirs (to ls | string match -r $regex $1)
    set dirs

    for d in $toDirs
        set -p dirs $d
    end

    for dir in $dirs
        if test -n $dir
            set todir (_goto_launch_kitty $dir)
            _goto_send_text $todir "to $dir;code .;clear;"
        end
    end

    clear
    exit
end

function _goto_launch_kitty
    kitty @ launch --type=tab --tab-title $argv[1] --keep-focus
end

function _goto_send_text
    kitty @ send-text --match id:$argv[1] "$argv[2]"\r
end
