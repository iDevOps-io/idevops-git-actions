```yaml
name: "AWS:EKS:DEPLOY:elasticsearch"

on:
  workflow_dispatch:
    inputs:
      kubernetes_cluster_name:
        description: Name of kubernetes cluster
        default: idevops-vaas-cluster
        
jobs:
  build_deploy_elasticsearch:
    name: "AWS:EKS:DEPLOY:elasticsearch"
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
          
      - name: "KUBERNETES:DEPLOY:elasticsearch"
        uses: iDevOps-io/idevops-git-actions/kubernetes_deployment_elasticsearch@main
        with:
          app_name: "elasticsearch"
          kubernetes_namespace: "elasticsearch"
          docker_pull_secret: "elasticsearch"
          docker_org_name: "idevopsiointernal"
          image: "elasticsearch"
          image_tag: "latest"
          port: "3000"
          port_two: "3001"
          port_three: "3002"
          mount_path: "/var/application-data/elasticsearch"
          disk_size: "20Gi"
          hostname: "elasticsearch.idevops.io"
          docker_username: ${{ secrets.DOCKER_USERNAME }}
          docker_password: ${{ secrets.DOCKER_PASSWORD }}
          docker_server_url: "https://index.docker.io/v1/"

```



