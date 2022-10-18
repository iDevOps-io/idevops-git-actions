```yaml
name: "Set Build Persistent Variables From Vars File"

on:
  workflow_dispatch:
    inputs:
      vars_file_location:
        description: Location of vars file to be used for setting persistent variables
        default: vars/circleci/vars.json

jobs:
  set_build_persistent_variables:
    name: "Set Build Persistent Variables From Vars File"
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

      - name: "Set build persistent variables from vars file"
        uses: iDevOps-io/idevops-git-actions/env_vars_from_json_file@main
        with:
          vars_file_location: "${{ github.event.inputs.vars_file_location }}"

```