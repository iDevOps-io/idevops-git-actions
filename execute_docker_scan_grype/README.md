```yaml
name: "Apply Anchore"

on:
  workflow_dispatch:

jobs:
  anchore_grype_scan:
    name: "Anchore Grype Scan"
    runs-on: ${{ matrix.os }}

    strategy:
      matrix:
        os: [ 'ubuntu-latest' ]

    steps:
      - uses: actions/checkout@v2

      - name: "DOCKER:IMAGE:SCAN:ANCHORE"
        uses: iDevOps-io/idevops-git-actions/execute_docker_image_scan_anchore@main
        with:
          docker_image_name: "${{ inputs.docker_org }}/${{ inputs.image }}:${{ inputs.image_tag }}"
```
