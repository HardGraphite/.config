function cdf --description 'cd fzf'
    set FZF_TEMP_COMMAND ''
    set fpath (find \( -path "**/.git" -o -path "**/links" \) -a -prune -o -type d | fzf --bind ctrl-j:down,ctrl-k:up --border --color=dark --tabstop=4 --preview 'ls -ahl --color {}')
    [ -z "$fpath" ] && return 1
    cd "$fpath" && echo " ➤  $PWD"
end
