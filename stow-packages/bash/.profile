# vim: set ft=bash :

# bash history
export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
shopt -s histappend                      # append to history, don't overwrite it

export BASH_SILENCE_DEPRECATION_WARNING=1
export EDITOR='nvim'

# homebrew - different setup for Apple Silicon vs. Intel
if [[ $(uname -m) == 'arm64' ]]; then
  # add `brew` cli itself to PATH
  eval "$(/opt/homebrew/bin/brew shellenv)"
  # add packages to PATH
  export PATH="/opt/homebrew:$PATH"
else
  # add `brew` cli itself to PATH
  eval "$(/usr/local/bin/brew shellenv)"
  # add packages to PATH
  export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
fi
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export BREW_PREFIX=`brew --prefix`

eval "$(mise activate bash)"

# Locally installed node module binaries
export PATH="./node_modules/.bin:$PATH"

# Rust binaries
export PATH="$HOME/.cargo/bin:$PATH"

# uv
export PATH="$HOME/.local/bin:$PATH"

export PATH="$HOME/.local/bin:$PATH"

if [ -f ${BREW_PREFIX}/etc/bash_completion ]; then
  . ${BREW_PREFIX}/etc/bash_completion
else
  echo "brew bash-completion formula not found - skipping!"
fi

source ~/.git-completion.sh

# https://starship.rs/
eval "$(starship init bash)"

p() {
  cd ~/Projects/$1
}

source ~/.bash_aliases

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# gnupg doesn't seem to work on OS X without this
export GPG_TTY=$(tty)

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/serhalp/Downloads/google-cloud-sdk/path.bash.inc' ]; then . '/Users/serhalp/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/serhalp/Downloads/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/serhalp/Downloads/google-cloud-sdk/completion.bash.inc'; fi

# Needed for Go development in some Netlify projects
export CGO_LDFLAGS="-L$(brew --prefix openssl)/lib -L$(brew --prefix re2)/lib"
export OPENSSL_ROOT_DIR="$(brew --prefix openssl)/lib"
export GOPRIVATE="github.com/netlify/"
