#!/usr/bin/env bash
NAMESPACE=$1
MANIFEST_FILELOCATION=$2
export AWS_ACCESS_KEY_ID=$(echo $INPUT_AWS_ACCESS_KEY_ID)
export AWS_SECRET_ACCESS_KEY=$(echo $INPUT_AWS_SECRET_ACCESS_KEY)
export AWS_DEFAULT_REGION=$(echo $INPUT_AWS_DEFAULT_REGION)
aws eks update-kubeconfig --name ${INPUT_K8S_CLUSTER_NAME} --region ${INPUT_AWS_DEFAULT_REGION}
kubectl create namespace ${INPUT_NAMESPACE} || echo "Namespace Exists"
kubectl apply -f ${INPUT_MANIFEST_FILELOCATION} -n ${INPUT_NAMESPACE}