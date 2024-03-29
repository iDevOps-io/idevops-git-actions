```yaml
name: "Docker Build, Check, and Push"

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
        description: The Docker tag you want to set. This must be incremented or it will not build.
        default: latest
      docker_file_location:
        description: Location of the docker file you want to build and push.
        default: idevops.io       
        
jobs:
  update_build_check_push:
    name: "Check if exist, build and push if not."
    runs-on: ${{ matrix.os }}

    strategy:
      matrix:
        os: [ 'ubuntu-latest' ]

    steps:
      - uses: actions/checkout@v2

      - name: "DOCKER:BUILD:CHECK:PUSH"
        uses: iDevOps-io/idevops-git-actions/docker_build_check_tag_and_push@main
        with:
          docker_username: "${{ inputs.docker_username }}"
          docker_password: "${{ inputs.docker_password }}"
          docker_org: "${{ inputs.docker_org }}"
          docker_image: "${{ inputs.image }}"
          docker_tag: "${{ inputs.image_tag }}"
          docker_file_location: "${{ inputs.docker_file_location }}"

```
