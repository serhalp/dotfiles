alias g="git"
alias n="npm"
alias p="pnpm"
alias y="yarn"
alias t="travis"

__git_complete g __git_main

alias ag="ag --hidden"
alias agnt="ag --ignore='*test*' --ignore='*unit*' --ignore='*spec*' --ignore='*e2e*' --ignore='*factory*'"

alias pr="hub pull-request -o"

alias yesand="(test \$? -eq 0) &&"
