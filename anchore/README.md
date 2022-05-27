```yaml
name: "Apply Anchore"

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

      - name: "Anchore Grype Scan"
        uses: iDevOps-io/idevops-git-actions/anchore-file@main
        with: curl -s https://ci-tools.anchore.io/inline_scan-latest | bash -s -- -f -d Dockerfile -b .anchore-policy.json example-image:latest

```