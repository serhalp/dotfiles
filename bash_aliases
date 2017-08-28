alias g="git"
__git_complete g __git_main

alias n="npm"

alias pr="hub pull-request | xargs open"

alias dev="aws-vault exec --session-ttl=24h --assume-role-ttl=1h dev --"
alias prod="aws-vault exec --session-ttl=24h --assume-role-ttl=1h prod --"
alias legacy="aws-vault exec --session-ttl=24h --assume-role-ttl=1h legacy --"

alias psql='docker run --rm -ti postgres psql'
alias redshift_prod='psql -h goodeggs-dw1.cerkbfia5cth.us-east-1.redshift.amazonaws.com -U goodeggs_ro -d goodeggs -p 5439'
alias redshift_staging='psql -h goodeggs-dwh-staging.cupdw3w5x8cl.us-east-1.redshift.amazonaws.com -U postgres -d goodeggs -p 5439'
