function toggle_keybindings --description 'toggle key bindings between VI mode and DEFAULT mode'

#    set flag_file (ls /tmp | grep fish_keybind_flag)
#
#    if [ -z "$flag_file" ]
#        set flag_file (mktemp -t fish_keybind_flag.XXXXX)
#        echo "vi" > $flag_file
#        fish_vi_key_bindings
#
#    else
#        set flag_file /tmp/"$flag_file"
#        set mode_flag (cat $flag_file)
#        if [ "$mode_flag" = "default" ]
#            echo "vi" > $flag_file
#            fish_vi_key_bindings
#        else # $mode_flag = vi
#            echo "default" > $flag_file
#            fish_default_key_bindings
#        end
#
#    end

    if [ "$__fish_active_key_bindings" = "fish_vi_key_bindings" ]
        fish_default_key_bindings
    else
        fish_vi_key_bindings
    end

    bind \ev toggle_keybindings

end

