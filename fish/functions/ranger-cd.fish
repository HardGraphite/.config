# vim: ft=cfg

function ranger-cd --description 'keep dir in ranger after quit'
    # create a tmpfile to write dir to
    set dirrecfile (mktemp -t ranger_dir.XXXXX)
    # execute ranger, telling the tmpfile
    ranger --choosedir=$dirrecfile $argv
    # test if tmpfile exists
    if test -f $dirrecfile
        # read dir from the tmpfile
        set ranger_dir (cat $dirrecfile)
        # test if the dir valid
        if test -n "$ranger_dir" -a -d "$ranger_dir"
            # goto the dir
            builtin cd -- "$ranger_dir"
        else
            # failed, print to screen
            echo "fail to goto dir: $ranger_dir"
        end
        # delete the tmpfile
        rm -f -- $dirrecfile
    else
        # cannot file the tmpfile
        echo "can't find tmp file: $dirrecfile"
    end
end

