export EDITOR='mvim -f --nomru -c "au VimLeave * !open -a Terminal"'
export PATH="/usr/local/bin:/usr/local/sbin:$PATH" # homebrew
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
if [[ -x $(which brew) ]]; then
  nvm_path="$(brew --prefix nvm)/nvm.sh"
  [[ -f $nvm_path ]] && source $nvm_path
fi

# After nvm sets up the path
export PATH="./node_modules/.bin:$PATH" # locally installed node binaries

# for passwords and stuff:
if [ -f ~/.sekret ]; then
  source ~/.sekret
fi

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
