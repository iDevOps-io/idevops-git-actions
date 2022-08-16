```yaml
name: "AWS:EKS:DEPLOY:FREETUBE"

on:
  workflow_dispatch:
    inputs:
      kubernetes_cluster_name:
        description: Name of kubernetes cluster
        default: idevops-vaas-cluster
            
jobs:
  build_deploy_freetube:
    name: "AWS:EKS:DEPLOY:FREETUBE"
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
          
      - name: "KUBERNETES:DEPLOY:FREETUBE"
        uses: iDevOps-io/idevops-git-actions/kubernetes_deployment_freetube@main
        with:
          app_name: "freetube"
          kubernetes_namespace: "freetube"
          docker_pull_secret: "freetube"
          docker_org_name: "idevopsiointernal"
          image: "freetube"
          image_tag: "latest"
          port: "3000"
          mount_path: "/var/application-data/freetube"
          disk_size: "20Gi"
          hostname: "freetube.idevops.io"
          docker_username: ${{ secrets.DOCKER_USERNAME }}
          docker_password: ${{ secrets.DOCKER_PASSWORD }}
          docker_server_url: "https://index.docker.io/v1/"

```



