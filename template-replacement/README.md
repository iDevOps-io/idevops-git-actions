```yaml
name: "Execute template replacement on file"

on:
  workflow_dispatch:
    inputs:
      input_file:
        description: File you want to run template replacement on.
        default: manifests/circleci/deployment.yaml.template
      output_file:
        description: File you want the output to be after template replacement.
        default: manifests/circleci/deployment.yaml

jobs:
  set_build_persistent_variables:
    name: "Execute template replacement on file"
    runs-on: ${{ matrix.os }}

    strategy:
      matrix:
        os: [ 'ubuntu-latest' ]

    steps:
      - uses: actions/checkout@v2

      - name: "Execute template replacement on file"
        uses: iDevOps-io/idevops-git-actions/template_replacement@main
        with:
          input_file: "${{ github.event.inputs.input_file }}"
          output_file: "${{ github.event.inputs.output_file }}"


```