# Oh My Zsh configuration
ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(
  git
  gitfast
  last-working-dir
  common-aliases
  zsh-autosuggestions	
  zsh-syntax-highlighting
  history-substring-search
)

# Disable unnecessary security check
ZSH_DISABLE_COMPFIX=true

# Load Oh-My-Zsh
source "$ZSH/oh-my-zsh.sh"

# Unalias commands from plugins (if needed)
unalias rm lt 2>/dev/null

# Homebrew configuration
export HOMEBREW_NO_ANALYTICS=1
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"

# Initialize asdf (Version Manager). asdf 0.16+ has no asdf.sh; put its shims on PATH.
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

# Load custom aliases if available
[[ -f "$HOME/.aliases" ]] && source "$HOME/.aliases"

# Encoding settings
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8   

# Editor settings
export EDITOR="zed --wait"
export BUNDLER_EDITOR=zed

# Python debugger setting
export PYTHONBREAKPOINT=ipdb.set_trace

# npm global binaries
export PATH="$HOME/.npm-global/bin:$PATH"

# Java Version from asdf
if command -v asdf >/dev/null; then
  export JAVA_HOME="$(asdf where java)"
  export PATH="$JAVA_HOME/bin:$PATH"
fi
export PATH="/opt/homebrew/opt/postgresql@17/bin:$PATH"
export PATH="/opt/homebrew/opt/mysql@8.4/bin:$PATH"
export AWS_PROFILE=yuta-tokyo

# Machine-local secrets (API keys, tokens) — kept out of this public repo
[[ -f "$HOME/.zshrc.local" ]] && source "$HOME/.zshrc.local"

# Drop duplicate PATH entries
typeset -U path

