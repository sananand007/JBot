#!/bin/bash

set -eoux pipefail

function check_dir() {
	echo $PWD
	ls -al
}

function build_docker() {
	docker build -t jbotbase:$BUILD_NUMBER .
	docker images | grep jbotbase
}
	
$1