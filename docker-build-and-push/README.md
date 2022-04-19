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
  update_route53:
    name: "Update or Create Route53"
    runs-on: ${{ matrix.os }}

    strategy:
      matrix:
        os: [ 'ubuntu-latest' ]

    steps:
      - uses: actions/checkout@v2

      - name: "Check if exist, build and push if not."
        uses: iDevOps-io/idevops-git-actions/docker-build-and-push@main
        with:
          docker_username: ${{ secrets.DOCKER_USERNAME }}
          docker_password: ${{ secrets.DOCKER_PASSWORD }}
          docker_org: "${{ github.event.inputs.docker_org }}"
          docker_image: "${{ github.event.inputs.docker_image }}"
          docker_tag: "${{ github.event.inputs.docker_tag }}"
          docker_file_location: "{{ github.event.inputs.docker_file_location }}"

```
