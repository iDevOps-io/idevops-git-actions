```yaml
name: "Docker Google OSV Scan"

on:
  workflow_dispatch:
    inputs:
      docker_org:
        description: Docker Org
        default: idevopsinternal
      docker_image:
        description: Docker Image Name
        default: ubuntu
      docker_tag:
        description: The Docker tag.
        default: latest     
        
jobs:
  update_build_check_push:
    name: "Docker Google OSV Scan"
    runs-on: ${{ matrix.os }}

    strategy:
      matrix:
        os: [ 'ubuntu-latest' ]

    steps:
      - uses: actions/checkout@v2

      - name: "DOCKER:OSV:SCAN"
        uses: iDevOps-io/idevops-git-actions/docker_google_osv_scan@main
        with:
          docker_org: "${{ inputs.docker_org }}"
          docker_image: "${{ inputs.image }}"
          docker_tag: "${{ inputs.image_tag }}"


```
