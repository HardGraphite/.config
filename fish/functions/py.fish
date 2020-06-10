function py
    set_color -i yellow
    echo " ☻  <" (python3 -V) ">"
    set_color normal
    python3 -q $argv
end

