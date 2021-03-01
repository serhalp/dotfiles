alias g="git"
alias n="npm"
alias y="yarn"
alias t="travis"

__git_complete g __git_main

alias ag="ag --hidden"
alias agnt="ag --ignore='*test*' --ignore='*unit*' --ignore='*spec*' --ignore='*e2e*' --ignore='*factory*'"

alias pr="hub pull-request -o"

alias yesand="(test \$? -eq 0) &&"

alias dev="aws-vault exec --session-ttl=24h --assume-role-ttl=1h dev --"
alias prod="aws-vault exec --session-ttl=24h --assume-role-ttl=1h prod --"
alias legacy="aws-vault exec --session-ttl=24h --assume-role-ttl=1h legacy --"

alias prod="ranch -f .ranch.production.yaml"
alias stg="ranch -f .ranch.staging.yaml"
alias pretty-ranch-logs="sed 's/^.* {/{/' | bunyan"

alias lintfix-modified="git ls-files --modified | xargs getk run fix-es"
