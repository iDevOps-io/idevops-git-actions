```yaml
name: "AWS:EKS:DEPLOY:ACTIVEMQ"

on:
  workflow_dispatch:
    inputs:
      kubernetes_cluster_name:
        description: Name of kubernetes cluster
        default: idevops-vaas-cluster
        
jobs:
  build_deploy_activemq:
    name: "AWS:EKS:DEPLOY:ACTIVEMQ"
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
          
      - name: "KUBERNETES:DEPLOY:ACTIVEMQ"
        uses: iDevOps-io/idevops-git-actions/kubernetes_deployment_activemq@main
        with:
          "image": "activemq",
          "kubernetes_cluster_name": "idevops-vaas-cluster",
          "kubernetes_namespace": "activemq",
          "DOCKER_EMAIL": "grant@sifchain.finance",
          "DOCKER_HOST_URL": "https://index.docker.io/v1/",
          "docker_pull_secret": "activemq-docker-secret",
          "app_name": "activemq",
          "docker_org_name": "idevopsiointernal",
          "port": "8161",
          "port_two": "61616",
          "disk_size": "50Gi",
          "OUTPUT_FILE": "manifests/activemq/deployment.yaml",
          "INPUT_FILE": "manifests/activemq/deployment.yaml.template",
          "hostname": "activemq.idevops.io"
          
```



