
# Path to your oh-my-zsh installation.
export ZSH="$ZSHDIR/oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

# Enable **Powerlevel10k**
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    extract     # extract compressed files
    fzf         # fuzzy finder
    #safe-paste  # paste but not exec
    sudo        # add `sudo`
    zsh-abbr    # fish abbr
    zsh-autosuggestions      # provide cmd sugestions like fish
    zsh-syntax-highlighting  # syntax highlight
)

source $ZSH/oh-my-zsh.sh

