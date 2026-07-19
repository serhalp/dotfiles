alias g="git"
alias n="npm"
alias p="pnpm"
alias y="yarn"

# bash-completion@2 loads git's completion lazily on first Tab-press, so
# force it now to make __git_complete available for the "g" alias below.
declare -F __git_complete >/dev/null || source "${BREW_PREFIX}/etc/bash_completion.d/git-completion.bash"
__git_complete g __git_main

alias ag="ag --hidden"
alias agnt="ag --ignore='*test*' --ignore='*unit*' --ignore='*spec*' --ignore='*e2e*' --ignore='*factory*'"

alias pr="hub pull-request -o"

alias yesand="(test \$? -eq 0) &&"

alias claude="/Users/serhalp/.local/bin/claude"

function qq() {
  local prompt="$1"
  shift
  claude -p "$prompt" "$@" | glow
}
alias wherewasi="qq 'describe the unstaged and/or uncommitted changes in my working tree'"

# Secrets, managed with 1Password CLI (`op`)
alias with-secrets='op run --env-file=$HOME/.env.op --'
