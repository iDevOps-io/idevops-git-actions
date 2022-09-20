```yaml
name: "K8S:DEPLOYMENT:TEAMSPEAK"

on:
  workflow_dispatch:
    inputs:
      kubernetes_cluster_name:
        description: Name of kubernetes cluster
        default: idevops-vaas-cluster

jobs:
  build_deploy_teamspeak:
    name: "K8S:DEPLOYMENT:TEAMSPEAK"
    runs-on: ${{ matrix.os }}

    strategy:
      matrix:
        os: [ 'ubuntu-latest' ]

    steps:
      - uses: actions/checkout@v2

      - name: "AWS:EKS:PULL:KUBECONFIG"
        uses: iDevOps-io/idevops-git-actions/aws_pull_eks_kubeconfig@main
        with:
          AWS_ACCESS_KEY_ID: "${{ secrets.AWS_ACCESS_KEY_ID }}"
          AWS_SECRET_ACCESS_KEY: "${{ secrets.AWS_SECRET_ACCESS_KEY }}"
          AWS_DEFAULT_REGION: "${{ secrets.AWS_DEFAULT_REGION }}"
          kubernetes_cluster_name: "{{ github.event.inputs.kubernetes_cluster_name }}"

      - name: "KUBERNETES:DEPLOY:TEAMSPEAK"
        uses: iDevOps-io/idevops-git-actions/kubernetes_deployment_teamspeak@main
        with:
          app_name: "teamspeak"
          kubernetes_namespace: "teamspeak"
          docker_pull_secret: "teamspeak"
          docker_org_name: "idevopsiointernal"
          image: "teamspeak"
          image_tag: "latest"
          port: "9987"
          port_two: "10011"
          port_three: "30033"
          mount_path: "/var/ts3server/"
          disk_size: "50Gi"
          hostname: "teamspeak.idevops.io"
          docker_username: ${{ secrets.DOCKER_USERNAME }}
          docker_password: ${{ secrets.DOCKER_PASSWORD }}
          docker_server_url: "https://index.docker.io/v1/"

```
