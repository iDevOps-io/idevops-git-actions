```yaml
name: "Apply Kubernetes manifest file"

on:
  workflow_dispatch:
    inputs:
      manifest:
        description: Manifest file location you wish to use.
        default: manifests/circleci/deployment.yaml
      namespace:
        description: Kubernetes namespace you wish to use.
        default: circleci
      k8s_cluster_name:
        description: Name of kubernetes cluster.
        default: idevops-vaas-cluster

jobs:
  apply_kubernetes_manifest_file:
    name: "Apply Kubernetes manifest file"
    runs-on: ${{ matrix.os }}

    strategy:
      matrix:
        os: [ 'ubuntu-latest' ]

    steps:
      - uses: actions/checkout@v2

      - name: "Apply Kubernetes manifest file"
        uses: iDevOps-io/idevops-git-actions/kubernetes-apply-manifest-file@main
        with:
          manifest: "${{ github.event.inputs.manifest }}"
          namespace: "${{ github.event.inputs.namespace }}"
          k8s_cluster_name: "${{ github.event.inputs.k8s_cluster_name }}"
          AWS_ACCESS_KEY_ID: "${{ secrets.AWS_ACCESS_KEY_ID }}"
          AWS_SECRET_ACCESS_KEY: "${{ secrets.AWS_SECRET_ACCESS_KEY }}"
          AWS_DEFAULT_REGION: "${{ secrets.AWS_DEFAULT_REGION }}"

```