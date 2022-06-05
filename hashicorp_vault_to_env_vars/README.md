```yaml
name: "Retrieve Vault Secrets to ENV"

on:
  workflow_dispatch:
    inputs:
      vault_path:
        description: path of secret
        default: /v1/kv/data/debian
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

      - name: "Get Secrets"
        uses: iDevOps-io/idevops-git-actions/hashicorp_vault_to_env_vars@main
        with:
          vault_path: ${{ inputs.vault_path }}
          vault_url: ${{ inputs.vault_url }}
          vault_token: ${{ secrets.vault_token }}
          
```