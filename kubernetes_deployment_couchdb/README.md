```yaml
name: "AWS:EKS:DEPLOY:COUCHDB"

on:
  workflow_dispatch:
    inputs:
      kubernetes_cluster_name:
        description: Name of kubernetes cluster
        default: idevops-vaas-cluster
            
jobs:
  build_deploy_jupyterhub:
    name: "AWS:EKS:DEPLOY:COUCHDB"
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
          
      - name: "KUBERNETES:DEPLOY:COUCHDB"
        uses: iDevOps-io/idevops-git-actions/kubernetes_deployment_couchdb@main
        with:
          app_name: "couchdb"
          kubernetes_namespace: "couchdb"
          docker_pull_secret: "couchdb"
          docker_org_name: "idevopsiointernal"
          image: "couchdb"
          image_tag: "latest"
          port: "5984"
          mount_path: "/var/application-data/couchdb"
          disk_size: "20Gi"
          hostname: "couchdb.idevops.io"
          docker_username: ${{ secrets.DOCKER_USERNAME }}
          docker_password: ${{ secrets.DOCKER_PASSWORD }}
          docker_server_url: "https://index.docker.io/v1/"

```



