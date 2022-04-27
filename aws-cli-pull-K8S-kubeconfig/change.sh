#!/usr/bin/env bash
function get_kubernetes_config {
    aws eks update-kubeconfig --name ${kubernetes_cluster_name} --region ${AWS_DEFAULT_REGION}
}