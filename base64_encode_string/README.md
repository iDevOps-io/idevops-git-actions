```yaml
name: "Base 64 Encode"

on:
  workflow_dispatch:
    inputs:
      encode_file:
        description: File you wish to base64 encode.
        default: manifests/circleci/deployment.yaml


jobs:
  base_64_encode:
    name: "Base 64 Encode"
    runs-on: ${{ matrix.os }}

    strategy:
      matrix:
        os: [ 'ubuntu-latest' ]

    steps:
      - uses: actions/checkout@v2

      - name: "Base 64 Encode"
        uses: iDevOps-io/idevops-git-actions/base64_encode_string@main
        with:
          encode_file: "${{ github.event.inputs.encode_file }}"


```