```yaml
name: "AWS:EKS:DEPLOY:JUYPTERHUB"

on:
  workflow_dispatch:
    inputs:
      kubernetes_cluster_name:
        description: Name of kubernetes cluster
        default: idevops-vaas-cluster
        
jobs:
  build_deploy_jupyterhub:
    name: "AWS:EKS:DEPLOY:JUYPTERHUB"
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
          
      - name: "KUBERNETES:DEPLOY:JUPYTERHUB"
        uses: iDevOps-io/idevops-git-actions/kubernetes_deployment_jupyterhub@main
        with:
          app_name: "jupyterhub"
          kubernetes_namespace: "jupyterhub"
          docker_pull_secret: "jupyterhub"
          docker_org_name: "idevopsiointernal"
          image: "jupyterhub"
          image_tag: "latest"
          port: "8000"
          mount_path: "/var/application-data/jupyterhub"
          disk_size: "20Gi"
          hostname: "jupyter-hub.idevops.io"
          docker_username: ${{ secrets.DOCKER_USERNAME }}
          docker_password: ${{ secrets.DOCKER_PASSWORD }}
          docker_server_url: "https://index.docker.io/v1/"

```



