# ╭──────────────────────────────────────────────────────────────╮
# │ ZSH                                                          │
# ╰──────────────────────────────────────────────────────────────╯

HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=50000

setopt APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_SAVE_NO_DUPS
setopt SHARE_HISTORY

setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT

setopt INTERACTIVE_COMMENTS
setopt NO_BEEP
setopt CORRECT


# ╭──────────────────────────────────────────────────────────────╮
# │ ZINIT                                                        │
# ╰──────────────────────────────────────────────────────────────╯

ZINIT_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/zinit/zinit.git"

if [[ ! -f "$ZINIT_HOME/zinit.zsh" ]]; then
    mkdir -p "$(dirname "$ZINIT_HOME")"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "$ZINIT_HOME/zinit.zsh"


# ────────────────────────────────────────────────────────────────
# Zsh completions
# ────────────────────────────────────────────────────────────────

zinit ice blockf atpull'zinit creinstall -q .'
zinit load zsh-users/zsh-completions


# Completion styles
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list \
    'm:{a-zA-Z}={A-Za-z}' \
    'r:|[._-]=* r:|=*'

zstyle ':completion:*' group-name ''
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$HOME/.cache/zsh"


# Initialize completion
autoload -Uz compinit
compinit


# ────────────────────────────────────────────────────────────────
# fzf-tab
# ────────────────────────────────────────────────────────────────

zinit load Aloxaf/fzf-tab

zstyle ':fzf-tab:*' switch-group '<' '>'
zstyle ':fzf-tab:*' fzf-flags \
    '--height=40%' \
    '--layout=reverse' \
    '--border=rounded'

zstyle ':fzf-tab:*' fzf-bindings \
    'ctrl-j:down' \
    'ctrl-k:up'

zstyle ':fzf-tab:complete:cd:*' fzf-preview \
    'eza --tree --level=2 --color=always $realpath 2>/dev/null || ls -la $realpath'

zstyle ':fzf-tab:complete:(kill|ps):argument-rest' \
    fzf-preview \
    '[[ $group == [0-9]* ]] && ps --pid=$word -o pid,user,comm,args'


# ────────────────────────────────────────────────────────────────
# Syntax highlighting
# ────────────────────────────────────────────────────────────────

zinit ice wait lucid
zinit load zdharma-continuum/fast-syntax-highlighting


# ────────────────────────────────────────────────────────────────
# Autosuggestions
# ────────────────────────────────────────────────────────────────

zinit ice wait lucid atload'_zsh_autosuggest_start'
zinit load zsh-users/zsh-autosuggestions

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#666666'
ZSH_AUTOSUGGEST_STRATEGY=(history completion)


# ────────────────────────────────────────────────────────────────
# History search
# ────────────────────────────────────────────────────────────────

zinit ice wait lucid
zinit load zdharma-continuum/history-search-multi-word


# ────────────────────────────────────────────────────────────────
# Forgit
# ────────────────────────────────────────────────────────────────

zinit ice wait lucid
zinit load wfxr/forgit


# ────────────────────────────────────────────────────────────────
# You should use
# ────────────────────────────────────────────────────────────────

zinit ice wait lucid
zinit load MichaelAquilina/zsh-you-should-use


# ────────────────────────────────────────────────────────────────
# fzf
# ────────────────────────────────────────────────────────────────

if (( $+commands[fzf] )); then

    export FZF_DEFAULT_OPTS="
        --height=40%
        --layout=reverse
        --border=rounded
        --info=inline
        --prompt='❯ '
        --pointer='▶'
        --marker='┃'
        --color=fg:#cccccc,bg:#080808
        --color=hl:#ffffff
        --color=fg+:#ffffff,bg+:#181818
        --color=pointer:#ffffff
        --color=marker:#ffffff
        --color=prompt:#ffffff
        --color=info:#888888
        --color=border:#444444
    "

    export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

    export FZF_CTRL_T_OPTS="
        --preview 'bat --style=numbers --color=always --line-range :200 {} 2>/dev/null || sed -n \"1,200p\" {}'
        --preview-window=right:50%
    "

    export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'

    export FZF_ALT_C_OPTS="
        --preview 'eza --tree --level=2 --color=always {} 2>/dev/null || ls -la {}'
    "

    # Load fzf key bindings
    if [[ -r /usr/share/fzf/shell/key-bindings.zsh ]]; then
        source /usr/share/fzf/shell/key-bindings.zsh
    fi

    # Load fzf completion
    if [[ -r /usr/share/fzf/shell/completion.zsh ]]; then
        source /usr/share/fzf/shell/completion.zsh
    fi
fi


# ────────────────────────────────────────────────────────────────
# Zoxide
# ────────────────────────────────────────────────────────────────

if (( $+commands[zoxide] )); then
    eval "$(zoxide init zsh)"
fi
## plugins end

export EDITOR="nvim"
export VISUAL="$EDITOR"
export PAGER="less"
export LESS="-R"

## Alias & custom funcs

# eza aliases
alias ls='eza --icons --group-directories-first'
alias ll='eza --icons -lah --group-directories-first'
alias la='eza --icons -la --group-directories-first'
alias l='eza --icons -l --group-directories-first'

lt() {
    local depth=${1:-2}
    eza --tree --level="$depth" --group-directories-first
}

if (( $+commands[bat] )); then
    alias cat='bat --paging=never'
fi

if (( $+commands[rg] )); then
    alias grep='rg'
fi

if (( $+commands[fd] )); then
    alias find='fd'
fi


alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'


alias update='sudo zypper dup'
alias refresh='sudo zypper refresh'
alias ports='ss -tulpn'
alias df='df -h'
alias du='du -h'

alias reload="source ~/.zshrc"
alias editrc="nvim ~/.zshrc"

alias v="nvim ."

## Alias end

if (( $+commands[starship] )); then
    eval "$(starship init zsh)"
fi


# bun completions
[ -s "/home/rshekar/.bun/_bun" ] && source "/home/rshekar/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"


# Added by Antigravity CLI installer
export PATH="/home/rshekar/.local/bin:$PATH"
export PATH="/home/rshekar/go/bin:$PATH"

# Vite+ bin (https://viteplus.dev)
. "/home/rshekar/.config/vite-plus/env"

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv zsh)"

. "$HOME/.cargo/env"
