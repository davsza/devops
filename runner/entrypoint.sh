#!/bin/bash

gh_reg_token="${GITHUB_TOKEN}"

unset GITHUB_TOKEN

runner_name="self-hosted-$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c10)"

cleanup() {
    echo "Cleaning up..."
    ./config.sh remove --token "${gh_reg_token}"
}

trap cleanup EXIT INT TERM

./config.sh --unattended --url "${GITHUB_URL}" --token "${gh_reg_token}" --name "${runner_name}"

./run.sh
