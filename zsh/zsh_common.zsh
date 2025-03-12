# alias
export LSCOLORS=cxfxcxdxbxegedabagacad
alias today_iso='date "+%Y-%m-%d"'
alias ll='ls -lG'
alias ls='ls -G'
alias v='nvim'
alias nv='nvim'

# Obsidian alias
if [[ -n "$DAILYNOTE_DIR" ]]; then
    alias d='nvim "$DAILYNOTE_DIR/$(date +%Y-%m-%d).md"'
fi
if [[ -n "$OBSIDIAN_DIR" ]]; then
    alias od='cd "$OBSIDIAN_DIR"'
fi

# starship
eval "$(starship init zsh)"

# zsh plugin
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

# ghq + peco
function peco-src () {
  local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-src
bindkey '^]' peco-src

# uv
source "$HOME/.local/bin/env"

# uvの補完
eval "$(uv generate-shell-completion zsh)"

#########
# 自作便利コマンド
#########

# mkdir-today
function mt() {
  local dir_name
  dir_name=$(date +%Y%m%d)

  mkdir -p "$dir_name"
  cd "$dir_name"
}

# mkdir-cd
function mc() {
  if [ -z "$1" ]; then
    echo "Usage: mkcd <directory_name>"
    return 1
  fi

  mkdir -p "$1"
  cd "$1" || return
}

