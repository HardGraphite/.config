#function fish_greeting                                                      
#    set_color blue
#    echo -e "\t" "   ( ≧ ◠ ◡ ◠ ≦ )"
#    set_color -i red
#    echo -e "\t" "✵  hello, world  ✵ "
#    set_color normal
#    echo  "[$USER@$hostname]  "  (date +%F%n%A%n%R)
#end

function fish_greeting
    set_color blue
#    python3 ~/.config/fish/functions/fish_greeting.py
#    set_color -i -d white
#    echo -en "# pwd:"(pwd) ",  shell: "$SHELL"\n"
    ~/.config/fish/functions/fish_greeting.sh
    set_color normal
end

