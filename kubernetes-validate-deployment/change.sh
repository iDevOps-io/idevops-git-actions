#!/usr/bin/env bash

NAMESPACE=$1
APP_NAME=$2

kubectl rollout status deployment/${INPUT_APP_NAME} --namespace ${INPUT_NAMESPACE}