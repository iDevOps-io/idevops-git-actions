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
  execute_template_replacement:
    name: "Execute template replacement on file"
    runs-on: ${{ matrix.os }}

    strategy:
      matrix:
        os: [ 'ubuntu-latest' ]

    steps:
      - uses: actions/checkout@v2
      - uses: actions/setup-python@v2
        with:
          python-version: '3.7'
          architecture: 'x64'

      - name: "Execute template replacement on file"
        uses: iDevOps-io/idevops-git-actions/template_replace_file@main
        with:
          input_file: "${{ github.event.inputs.input_file }}"
          output_file: "${{ github.event.inputs.output_file }}"

```