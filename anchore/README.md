```yaml
name: "Apply Anchore"

on:
  workflow_dispatch:

jobs:
  anchore_grype_scan:
    name: "Anchore Docker Image Scan"
    runs-on: ${{ matrix.os }}

    strategy:
      matrix:
        os: [ 'ubuntu-latest' ]

    steps:
      - uses: actions/checkout@v2

      - name: "Anchore Docker Image Scan"
        uses: iDevOps-io/idevops-git-actions/anchore@main
        with:
          docker_image_name: "${{ github.event.inputs.docker_image_name }}"
          fail_on_failure: "${{ github.event.inputs.fail_on_failure }}"
          anchore_url: "${{ github.event.inputs.anchore_url }}"

```