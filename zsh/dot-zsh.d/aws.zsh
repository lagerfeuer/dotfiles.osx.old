export AWS_DEFAULT_REGION='us-east-1'

# AWS ASSUME ROLE 
#
# if [[ -f ~/.aws/assume-role ]]; then
# 	source ~/.aws/assume-role
# fi

# function aws-assume-role {
# 	local readonly role="$1"
# 	local time="${2:-3600}"
# 	if [[ "$(agp)" != "${role}" ]] then
# 		( mfa | head -n 1 ; echo "${time}" ) | acp "${role}" >/dev/null
# 	fi
# }

function mfa {
  op item get AWS --vault Work --otp
}

function ar {
  mfa | awsume $@
}
alias unar='awsume --unset'

###############################################################################

function s3cat {
  local readonly S3_ARN="${1}"
  aws s3 cp "${S3_ARN}" -
}

function s3jq {
  local readonly S3_ARN="${1}"
  local readonly JQ_FILTER="${2}"
  aws s3 cp "${S3_ARN}" - | jq -r "${JQ_FILTER}"
}

function s3json {
  local readonly S3_ARN="${1}"
  aws s3 cp "${S3_ARN}" - | jq -r . | bat -l=json
}

alias aws-get-id='aws sts get-caller-identity | jq .'
alias aws-whoami='aws sts get-caller-identity | jq .'
alias aws-roles='awk '\''/\[profile [a-z]/ { print $2 }'\'' $HOME/.aws/config |tr -d \]'

function get-cf-id-for-name {
  aws cloudfront list-distributions | \
    jq "[.DistributionList.Items[] | { id: .Id, alias: .Aliases.Items[0] } | select(.alias == \"${1}\")]"
}
