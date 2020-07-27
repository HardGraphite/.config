
# --------- z shell config  ------------
DISABLE_AUTO_UPDATE='true'
DISABLE_UNTRACKED_FILES_DIRTY='true'


# --------- plugins config -------------
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_USE_ASYNC=1

ZSH_HIGHLIGHT_MAXLENGTH=128
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[alias]='fg=cyan,bold'
ZSH_HIGHLIGHT_STYLES[command]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[path]='fg=white,underline'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=blue,bold'
typeset -A ZSH_HIGHLIGHT_PATTERNS
ZSH_HIGHLIGHT_PATTERNS+=('rm -r' 'fg=white,bold,bg=red')


# --------- global varibales -------------
# path var
export PATH=$PATH:'/opt/texlive/2019/bin/x86_64-linux'
# other global vars
export EDITOR='nvim'
export QT_LOGGING_RULES='qt5ct.debug=false'


# --------- fzf config -----------
export FZF_PREVIEW_COMMAND='[[ $(file --mime oh-my-zsh) =~ 'directory' ]] && (ls -l {}) || (head -c 512 {} | cat -ns)'
export FZF_DEFAULT_OPTS="--bind ctrl-j:down,ctrl-k:up --border --height 60% --color=dark --tabstop=4 --preview '$FZF_PREVIEW_COMMAND'"
export FZF_DEFAULT_COMMAND='find \( -path "**/.git" -o -path "**/links" \) -a -prune -o -type d,f'
export FZF_COMPLETION_TRIGGER='\'


# --------- alias -------------
alias v=nvim
