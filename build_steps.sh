#!/bin/bash

set -eoux pipefail


KEY_PATH="/home/pi/keys/gittoken.json"
BUILD_URL="https://70483f2bdaf6.ngrok.io/job/JBot/$BUILD_NUMBER/console"

function check_dir() {
	echo $PWD
	ls -al
}

function build_docker() {
	docker build -t jbotbase:$BUILD_NUMBER .
	docker images | grep jbotbase
}

function run_docker() {
	docker run --rm jbotbase:$BUILD_NUMBER
}

function extract_token() {
	token=$(jq '.token' $KEY_PATH)
    token="${token%\"}"
    token="${token#\"}"
	echo $token
}

function post_gitStatus_success() {
	echo "Post status after build succeeds"
	git_token=$(extract_token)
	URL="https://api.GitHub.com/repos/sananand007/JBot/statuses/$GIT_COMMIT?access_token=$git_token"
	curl -s -H $URL \
  		-H "Content-Type: application/json" \
  		-X POST \
  		-d "{\"state\": \"success\",\"context\": \"continuous-integration/jenkins\", \"description\": \"Jenkins\", \"target_url\": $BUILD_URL}" >> output.txt

}

:<<"L"
UA='iOS/10.2.2 (iPhone Darwin) Model/iPhone Platform/iPhone6,1 RabbitiOS/2.0.141'
URL='https://flex-capacity-na.amazon.com/GetOffersForProvider?serviceAreaIds=122'
curl -s -H 'Host: flex-capacity-na.amazon.com' \
  -H "Cookie: session-token=$ses_t" \
  -H "x-amz-access-token: $amz_t" \
  -H "x-flex-instance-id: $flx_id" \
  -H 'Accept: */*' \
  -H "User-Agent: $UA" \
  -H 'Accept-Language: en-us' \
  --compressed "$URL" >> output.txt
L

$1
