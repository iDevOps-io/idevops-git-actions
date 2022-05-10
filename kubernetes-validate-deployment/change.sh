#!/usr/bin/env bash
NAMESPACE=$1
APP_NAME=$2
export AWS_ACCESS_KEY_ID=$(echo $INPUT_AWS_ACCESS_KEY_ID)
export AWS_SECRET_ACCESS_KEY=$(echo $INPUT_AWS_SECRET_ACCESS_KEY)
export AWS_DEFAULT_REGION=$(echo $INPUT_AWS_DEFAULT_REGION)
kubectl rollout status deployment/${INPUT_APP_NAME} --namespace ${INPUT_NAMESPACE}