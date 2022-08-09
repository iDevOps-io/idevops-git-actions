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
        uses: iDevOps-io/idevops-git-actions/kubernetes-validate-deployment@main
        with:
          app_name: "${{ github.event.inputs.app_name }}"
          namespace: "${{ github.event.inputs.namespace }}"
          AWS_ACCESS_KEY_ID: "${{ secrets.AWS_ACCESS_KEY_ID }}"
          AWS_SECRET_ACCESS_KEY: "${{ secrets.AWS_SECRET_ACCESS_KEY }}"
          AWS_DEFAULT_REGION: "${{ secrets.AWS_DEFAULT_REGION }}"
          kubernetes_cluster_name: "${{ github.event.inputs.kubernetes_cluster_name }}"


```