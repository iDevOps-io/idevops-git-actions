```yaml
name: "Set Build Persistent Variables From Vars File"

on:
  workflow_dispatch:
    inputs:
      vars_file_location:
        description: Location of vars file to be used for persistent variable replacement
        default: vars/

jobs:
  set_build_persistent_variables:
    name: "Set Build Persistent Variables From Vars File"
    runs-on: ${{ matrix.os }}

    strategy:
      matrix:
        os: [ 'ubuntu-latest' ]

    steps:
      - uses: actions/checkout@v2

      - name: "Set build persistent variables from vars file"
        uses: iDevOps-io/idevops-git-actions/persistent-variables-from-vars@main
        with:
          vars_file_location: "${{ github.event.inputs.vars_file_location }}"

```