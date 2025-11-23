# =======================================================
# === VARIABLES DE ENTORNO ===
# =======================================================

# Editor
export EDITOR="nvim"
export SUDO_EDITOR="$EDITOR"

# Temas
export BAT_THEME=ansi

# PATH consolidado
export PATH="$HOME/.cargo/bin:$HOME/.bun/bin:$HOME/.local/share/omarchy/bin:/usr/local/go/bin:${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

# Bun
export BUN_INSTALL="$HOME/.bun"

# PostgreSQL (descomentado si lo necesitas)
# export PGHOST="/var/run/postgresql"

# =======================================================
# === HISTORIAL ===
# =======================================================

HISTFILE=~/.history
HISTSIZE=10000
SAVEHIST=50000
setopt inc_append_history
setopt share_history
setopt hist_ignore_dups
setopt hist_ignore_space

# =======================================================
# === INICIALIZACIÓN DE HERRAMIENTAS ===
# =======================================================
# Inicializa el sistema de autocompletado de Zsh
autoload -Uz compinit
compinit

# Prompt y navegación
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

# Gestores de versiones
eval "$(~/.local/bin/mise activate zsh)"

# FZF
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border"
source <(fzf --zsh)

# Autocompletado - Carga diferida de Carapace
export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense'
zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'

# Lazy load carapace (solo cuando se usa TAB)
_carapace_lazy_load() {
  unfunction _carapace_lazy_load
  source <(carapace _carapace)
}
compdef _carapace_lazy_load carapace

# Plugins de Zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Completados específicos - Carga diferida
_bun_lazy_load() {
  [ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"
  unfunction _bun_lazy_load
}

_ng_lazy_load() {
  source <(ng completion script)
  unfunction _ng_lazy_load
}

# Solo cargar si realmente los usas
compdef _bun_lazy_load bun
compdef _ng_lazy_load ng

# Atuin - Carga al final o comenta si no lo usas mucho
eval "$(atuin init zsh)"

# =======================================================
# === ALIASES ===
# =======================================================

# Navegación
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Listado de archivos (eza)
if command -v eza &> /dev/null; then
  alias ls='eza -lh --group-directories-first --icons=auto'
  alias lsa='eza -lha --group-directories-first --icons=auto'
  alias lt='eza --tree --level=2 --long --icons --git'
  alias lta='eza --tree --level=2 --long --icons --git -a'
fi

# FZF
alias ff="fzf --preview 'bat --style=numbers --color=always {}'"
alias fzfbat='fzf --preview="bat --theme=gruvbox-dark --color=always {}"'
alias fzfnvim='nvim $(fzf --preview="bat --theme=gruvbox-dark --color=always {}")'

# Git
alias g='git'
alias ga='git add'
alias gaa='git add --all'
alias gs='git status'
alias gp='git push'
alias gl='git pull'
alias gco='git checkout'
alias gcm='git commit -m'
alias gcam='git commit -a -m'
alias gcad='git commit -a --amend'

# Docker
alias d='docker'
alias dcu='docker-compose up -d'
alias dcd='docker-compose down'
alias dps='docker ps'

# Herramientas
alias r='rails'
alias tm='new_tmux'

# Compresión
alias decompress="tar -xzf"

# =======================================================
# === FUNCIONES ===
# =======================================================

# Neovim inteligente
n() {
  if [ "$#" -eq 0 ]; then
    nvim .
  else
    nvim "$@"
  fi
}

# Abrir con app predeterminada
open() {
  xdg-open "$@" >/dev/null 2>&1 &
}

# Comprimir directorio
compress() {
  tar -czf "${1%/}.tar.gz" "${1%/}"
}

# Tmux inteligente
new_tmux() {
  local session_dir=$(zoxide query --list | fzf --height 40% --reverse)
  [ -z "$session_dir" ] && return

  local session_name=$(basename "$session_dir")
  local notification=""

  if tmux has-session -t "$session_name" 2>/dev/null; then
    [ -n "$TMUX" ] && tmux switch-client -t "$session_name" || tmux attach -t "$session_name"
    notification="tmux attached to $session_name"
  else
    if [ -n "$TMUX" ]; then
      tmux new-session -d -c "$session_dir" -s "$session_name" && tmux switch-client -t "$session_name"
      notification="new tmux session (inside tmux): $session_name"
    else
      tmux new-session -c "$session_dir" -s "$session_name"
      notification="new tmux session: $session_name"
    fi
  fi

  [ -n "$notification" ] && notify-send "$notification"
}

# Escribir ISO a SD
iso2sd() {
  if [ $# -ne 2 ]; then
    echo "Usage: iso2sd <input_file> <output_device>"
    echo "Example: iso2sd ~/Downloads/ubuntu.iso /dev/sda"
    echo -e "\nAvailable devices:"
    lsblk -d -o NAME,SIZE,TYPE | grep -E 'disk'
    return 1
  fi

  echo "⚠️ WARNING: This will erase all data on $2"
  read -rp "Continue? (y/N): " confirm
  [[ "$confirm" =~ ^[Yy]$ ]] || return 1

  sudo dd bs=4M status=progress oflag=sync if="$1" of="$2" && sudo eject "$2"
}

# Formatear disco
format-drive() {
  if [ $# -ne 2 ]; then
    echo "Usage: format-drive <device> <label>"
    echo "Example: format-drive /dev/sda 'My Drive'"
    echo -e "\nAvailable drives:"
    lsblk -d -o NAME,SIZE,TYPE | grep -E 'disk'
    return 1
  fi

  echo "⚠️ WARNING: This will ERASE ALL DATA on $1"
  read -rp "Continue? (y/N): " confirm
  [[ "$confirm" =~ ^[Yy]$ ]] || return 1

  local partition="$([[ $1 == *"nvme"* ]] && echo "${1}p1" || echo "${1}1")"

  sudo wipefs -a "$1" &&
  sudo parted -s "$1" mklabel gpt &&
  sudo parted -s "$1" mkpart primary ext4 1MiB 100% &&
  sudo mkfs.ext4 -L "$2" "$partition" &&
  echo "✓ Drive formatted and labeled '$2'"
}

# Conversión de video
transcode-video-1080p() {
  ffmpeg -i "$1" -vf scale=1920:1080 -c:v libx264 -preset fast -crf 23 -c:a copy "${1%.*}-1080p.mp4"
}

transcode-video-4K() {
  ffmpeg -i "$1" -c:v libx265 -preset slow -crf 24 -c:a aac -b:a 192k "${1%.*}-optimized.mp4"
}

# Conversión de imágenes
img2jpg() {
  magick "$1" -quality 95 -strip "${1%.*}.jpg"
}

img2jpg-small() {
  magick "$1" -resize 1080x\> -quality 95 -strip "${1%.*}.jpg"
}

img2png() {
  magick "$1" -strip \
    -define png:compression-filter=5 \
    -define png:compression-level=9 \
    -define png:compression-strategy=1 \
    -define png:exclude-chunk=all \
    "${1%.*}.png"
}

export PATH=$PATH:/home/humelop/.spicetify

# === Zellij Configuration ===
# Función helper: sincroniza colores automáticamente antes de abrir layout
_zj() {
    ~/.config/zellij/update-all-layouts.sh > /dev/null 2>&1
    zellij --layout "$1"
}

# Layouts por tecnología (con auto-sync de colores)
alias zj-pro='~/.config/zellij/update-all-layouts.sh > /dev/null 2>&1 && zellij --layout work-pro'
alias zj='_zj default'
alias zj-ng='_zj angular'
alias zj-react='_zj react'
alias zj-rn='_zj react-native'
alias zj-django='_zj django'

# Utilidades
alias zj-sync='~/.config/zellij/sync-theme.sh'
alias zj-list='ls -1 ~/.config/zellij/layouts/ | sed "s/.kdl//"'
function zj-edit() { ${EDITOR:-nvim} ~/.config/zellij/layouts/"$1".kdl }
function zj-new() { zellij --session "$1" }

# === Keychain SSH ===
eval $(keychain --eval --quiet id_ed25519)
