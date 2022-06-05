```yaml
name: "Apply Vault Secrets"

on:
  workflow_dispatch:
    inputs:
      manifest:
        description: Manifest file location you wish to use.
        default: manifests/debian/deployment.yaml
      namespace:
        description: Kubernetes namespace you wish to use.
        default: debian
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
          AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
          AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
          AWS_DEFAULT_REGION: ${{ secrets.AWS_DEFAULT_REGION }}

      - name: Import Secrets
        uses: hashicorp/vault-action@v2.4.0
        with:
          url: "http://vault.idevops.io:8200/"
          tlsSkipVerify: true
          token: \${{ secrets.VAULT_TOKEN }}
          secrets: |
              secrets/kv/debian DOCKER_EMAIL | DOCKER_EMAIL ;
              secrets/kv/debian DOCKER_HOST_URL | DOCKER_HOST_URL ;
              secrets/kv/debian INPUT_FILE | INPUT_FILE ;
              secrets/kv/debian OUTPUT_FILE | OUTPUT_FILE ;
              secrets/kv/debian docker_org_name | docker_org_name ;
              secrets/kv/debian docker_pull_secret | docker_pull_secret ;
              secrets/kv/debian image | image ;
              secrets/kv/debian kubernetes_cluster_name | kubernetes_cluster_name;
              secrets/kv/debian kubernetes_namespace | kubernetes_namespace;
              secrets/kv/debian port | port

      - name: Verify secrets
        run: |
          if [ ${#AWS_ACCESS_KEY_ID} -lt 1 ]; then echo "error" ; exit; fi
          if [ ${#AWS_SECRET_ACCESS_KEY} -lt 1 ]; then echo "error" ; exit; fi
```