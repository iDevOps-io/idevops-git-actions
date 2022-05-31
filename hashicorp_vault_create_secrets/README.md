```yaml
name: "Create Secrets in Vault KV Engine"

on:
  workflow_dispatch:
    inputs:
      vault_path:
        description: path of secret
        default: /v1/kv/data/kubectl
      vault_url:
        description: url of vault
        default: http://vault.idevops.io

jobs:
  get_secrets:
    name: "Get Vault Secrets"
    runs-on: ${{ matrix.os }}

    strategy:
      matrix:
        os: [ 'ubuntu-latest' ]

    steps:
      - uses: actions/checkout@v2

      - name: "Create Secrets"
        uses: iDevOps-io/idevops-git-actions/hashicorp_vault_create_secrets@main
        with:
          vault_path: ${{ inputs.vault_path }}
          vault_url: ${{ inputs.vault_url }}
          vault_token: ${{ secrets.vault_token }}
          
```