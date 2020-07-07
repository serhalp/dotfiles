alias g="git"
alias n="npm"
alias y="yarn"
alias t="travis"

__git_complete g __git_main

alias ag="ag --hidden"
alias agnt="ag --ignore='*test*' --ignore='*unit*' --ignore='*spec*' --ignore='*e2e*'"

alias pr="hub pull-request -o"

alias yesand="(test \$? -eq 0) &&"

alias dev="aws-vault exec --session-ttl=24h --assume-role-ttl=1h dev --"
alias prod="aws-vault exec --session-ttl=24h --assume-role-ttl=1h prod --"
alias legacy="aws-vault exec --session-ttl=24h --assume-role-ttl=1h legacy --"

alias psql='docker run --rm -ti postgres psql'
alias redshift_prod='psql -h goodeggs-dw1.cerkbfia5cth.us-east-1.redshift.amazonaws.com -U goodeggs_ro -d goodeggs -p 5439'
alias redshift_staging='psql -h goodeggs-dwh-staging.cupdw3w5x8cl.us-east-1.redshift.amazonaws.com -U postgres -d goodeggs -p 5439'
