```yaml
name: "Kubernetes validate deployment"

on:
  workflow_dispatch:
    inputs:
      app_name:
        description: Manifest file location you wish to use.
        default: manifests/circleci/deployment.yaml
      namespace:
        description: Kubernetes namespace you wish to use.
        default: circleci

jobs:
  kubernetes_validate_deployment:
    name: "Kubernetes validate deployment"
    runs-on: ${{ matrix.os }}

    strategy:
      matrix:
        os: [ 'ubuntu-latest' ]

    steps:
      - uses: actions/checkout@v2

      - name: "Kubernetes validate deployment"
        uses: iDevOps-io/idevops-git-actions/kubernetes_validate_deployment_rollout@main
        with:
          app_name: "${{ github.event.inputs.app_name }}"
          namespace: "${{ github.event.inputs.namespace }}"
          kubernetes_cluster_name: "${{ github.event.inputs.kubernetes_cluster_name }}"


```