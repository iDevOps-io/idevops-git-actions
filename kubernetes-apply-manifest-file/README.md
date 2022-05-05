```yaml
name: "Apply Kubernetes manifest file"

on:
  workflow_dispatch:
    inputs:
      manifest_file_location:
        description: Manifest file location you wish to use.
        default: manifests/circleci/deployment.yaml
      namespace:
        description: Kubernetes namespace you wish to use.
        default: circleci

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
          manifest_file_location: "${{ github.event.inputs.manifest_file_location }}"
          namespace: "${{ github.event.inputs.namespace }}"


```