```yaml
name: "Apply ZAProxyscan"

on:
  workflow_dispatch:
    inputs:
      web_url:
        description: The url you want to scan.
        default: https://idevops.io
     

jobs:
  zaproxyscan:
    name: "ZAProxyscan"
    runs-on: ${{ matrix.os }}

    strategy:
      matrix:
        os: [ 'ubuntu-latest' ]

    steps:
      - uses: actions/checkout@v2

      - name: "ZAProxyscan"
        uses: iDevOps-io/idevops-git-actions/zaproxyscan@main
        with: 
          web_url: "${{ github.event.inputs.web_url }}"

```