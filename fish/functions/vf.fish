function vf --description 'vim fzf'
    set fpath (fzf)
    [ -z "$fpath" ] && exit 1
    nvim "$fpath"
end
