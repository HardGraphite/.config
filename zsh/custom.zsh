
# --------- z shell config  ------------
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# use vim key bindings in ZLE
#bindkey -v


# --------- plugins config -------------
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_USE_ASYNC=1
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_MANUAL_REBIND=1 # To re-bind widgets, run `_zsh_autosuggest_bind_widgets`

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
ZSH_HIGHLIGHT_STYLES[cursor]='none'
typeset -A ZSH_HIGHLIGHT_PATTERNS
ZSH_HIGHLIGHT_PATTERNS+=('rm -r' 'fg=white,bold,bg=red')

ABBR_QUIET=1


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


# --------- ranger cd ------------
_ranger_cd() {
    _ranger_temp_file="$(mktemp -t "ranger_cd.XXX")"
    ranger --choosedir="$_ranger_temp_file" -- "${@:-$PWD}"
    if _ranger_chosen_dir="$(cat "$_ranger_temp_file")" \
        && [ -n "$_ranger_chosen_dir" ] && [ "$_ranger_chosen_dir" != "$PWD" ]; then
        cd "$_ranger_chosen_dir"
        echo "go to directory: $_ranger_chosen_dir"
    fi
    rm "$_ranger_temp_file"
}
alias e=_ranger_cd


# --------- alias/abbrs -------------
# command `abbr` comes from plugin zsh-abbr
alias vi=nvim
alias vim=nvim
alias py='python -q'

abbr --session pacs='sudo pacman -S'
abbr --session pacu='sudo pacman -Syu'
abbr --session pacr='sudo pacman -Rsn'
abbr --session pacq='pacman -Ss'

abbr --session v='nvim'
abbr --session s-v='sudo -E nvim'

abbr --session s-='sudo -E'
abbr --session +x='sudo chmod +x'

