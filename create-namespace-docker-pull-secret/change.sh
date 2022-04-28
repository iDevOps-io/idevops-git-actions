#!/usr/bin/env bash
function kubernetes_create_namespace {
    NAMESPACE=$1
    kubectl create namespace ${1} || echo "Namespace Exists"
}

function kubernetes_create_docker_secret {
    NAMESPACE=$1
    DOCKER_HOST_URL=$2
    DOCKER_USERNAME=$3
    DOCKER_PASSWORD=$4
    DOCKER_EMAIL=$5
    DOCKER_PULL_SECRET=$6
    EXISTS=

    kubectl create secret docker-registry ${INPUT_DOCKER_PULL_SECRET} \
    --docker-server="${INPUT_DOCKER_HOST_URL}" \
    --docker-username="${INPUT_DOCKER_USERNAME}" \
    --docker-password="${INPUT_DOCKER_PASSWORD}" \
    --docker-email="${INPUT_DOCKER_EMAIL}" \
    --namespace ${INPUT_NAMESPACE} || export EXISTS=yes

    if [ ! -z ${EXISTS} ]; then
    kubectl delete secret ${INPUT_DOCKER_PULL_SECRET} -n ${INPUT_NAMESPACE}
    kubectl create secret docker-registry ${INPUT_DOCKER_PULL_SECRET} \
    --docker-server="${INPUT_DOCKER_HOST_URL}" \
    --docker-username="${INPUT_DOCKER_USERNAME}" \
    --docker-password="${INPUT_DOCKER_PASSWORD}" \
    --docker-email="${INPUT_DOCKER_EMAIL}" \
    --namespace ${INPUT_NAMESPACE}
    fi
}