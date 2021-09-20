export AWS_DEFAULT_REGION='us-east-1'

if [[ -f ~/.aws/assume-role ]]; then
	source ~/.aws/assume-role
fi

function aws-assume-role {
	local readonly role="$1"
	local time="${2:-3600}"
	if [[ "$(agp)" != "${role}" ]] then
		( mfa | head -n 1 ; echo "${time}" ) | acp "${role}" >/dev/null
	fi
}

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
