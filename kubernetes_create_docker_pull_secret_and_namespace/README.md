```yaml
name: "Create namespace & Docker Pull Secret"

on:
  workflow_dispatch:
    inputs:
      namespace:
        description: Namespace for kubernetes.
        default: kubernetes_namespace  
      docker_host_url:
        description: Host url for Docker.
        default: idevops.io
      docker_email:
        description: Email used for Docker.
        default: default@email.com
      docker_pull_secret:
        description: Adds a secret to grant access for pods to pull images from registry.
        default: app_docker_secret  
        
jobs:
  create-namespace-docker-pull-secret:
    name: "Create namespace & Docker Pull Secret."
    runs-on: ${{ matrix.os }}

    strategy:
      matrix:
        os: [ 'ubuntu-latest' ]

    steps:
      - uses: actions/checkout@v2

      - name: "Create namespace & Docker Pull Secret."
        uses: iDevOps-io/idevops-git-actions/create-namespace-docker-pull-secret@main
        with:
          docker_username: ${{ secrets.DOCKER_USERNAME }}
          docker_password: ${{ secrets.DOCKER_PASSWORD }}
          namespace: "${{ github.event.inputs.namespace }}"
          docker_host_url: "${{ github.event.inputs.docker_host_url }}"
          docker_pull_secret: "${{ github.event.inputs.docker_pull_secret }}"

```
