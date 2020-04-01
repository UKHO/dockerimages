tf = curl "https://releases.hashicorp.com/terraform/"
match = "\/terraform\/?([^\/]*)\/"
[[ ${tf} =~ ${match}  ]]
version=${BASH_REMATCH[1]}