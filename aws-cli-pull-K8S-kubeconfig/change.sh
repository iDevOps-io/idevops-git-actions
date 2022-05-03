#!/usr/bin/env bash
function get_kubernetes_config {
    aws eks update-kubeconfig --name ${INPUT_KUBERNETES_CLUSTER_NAME} --region ${AWS_DEFAULT_REGION}
}