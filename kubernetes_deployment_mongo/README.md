```yaml
name: "AWS:EKS:DEPLOY:MONGO"

on:
  workflow_dispatch:
    inputs:
      kubernetes_cluster_name:
        description: Name of kubernetes cluster
        default: idevops-vaas-cluster
            
jobs:
  build_deploy_mongo:
    name: "AWS:EKS:DEPLOY:MONGO"
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
          
      - name: "KUBERNETES:DEPLOY:MONGO"
        uses: iDevOps-io/idevops-git-actions/kubernetes_deployment_mongo@main
        with:
          app_name: "mongo"
          kubernetes_namespace: "mongo"
          docker_pull_secret: "mongo"
          docker_org_name: "idevopsiointernal"
          image: "mongo"
          image_tag: "latest"
          port: "27017"
          port_name: "portone"
          intitial_delay: "60"
          period_time: "90"
          success_threshold: "1"
          failure_threshold: "10"
          mount_path: "/var/application-data/mongo"
          storage_class: "gp2"
          disk_size: "20Gi"
          docker_username: ${{ secrets.DOCKER_USERNAME }}
          docker_password: ${{ secrets.DOCKER_PASSWORD }}
          docker_server_url: "https://index.docker.io/v1/"

```

| Input Name   |      Default Value      |  Description |
|--------------|-------------------------|--------------|
|kubernetes_config| /home/runner/.kube/config |Location of the kubeconfig you want to use to deploy to kubernetes. |
|app_name | mongo | What you want to name your mongo deployment. |
|kubernetes_namespace | mongo | The namespace in k8s you want to deployment. |
|docker_pull_secret | mongo | The name of the docker pull secret you with to use to pull your image. |
|docker_org_name | idevopsiointernal | The org you will be pushing to and pulling from. |
|image | mongo | The image name you want to build and push the docker image for mongo to. |
|image_tag | latest | The image tag you wish to tag the docker image as. |
|port | 27017 | The port the container and service will be running on. |
|port_name | portone | The port the container and service will be running on. |
|replicas | 1 | The desired number of replicas. |
|max_surge| 1 | The amount of pods above the desired number of pods during an update. |
|max_unavailable | 1 | The number of pods that can be unavailable during the update process. |
|initial_delay | 60 | Time delay before liveness and readiness probes are activated. |
|period_time | 90 | Time to intiate the probe. |
|success_threshold | 1 | Minimum number of successful probes to be a success after having failed initially. |
|failure_threshold | 10 | Number of probes if the preceding probe fails. |
|mount_path | /data/db |The persistent volume mount path. |
|storage_class | gp2 | The default storage class for mongo deployment. |
|disk_size | 20Gi |The size of the persistent volume you wish to provision. |
|docker_username |  | The docker username to use for dockerhub authentication. |
|docker_password |  | The docker password to use for dockerhub authentication. |
|docker_file_location | /home/runner/work/_actions/iDevOps-io/idevops-git-actions/main/kubernetes_deployment_mongo/ | The docker org you will be pushing your image to. |
|docker_server_url | https://index.docker.io/v1/ | The url to push docker images to. |
|composite_file_location | /home/runner/work/_actions/iDevOps-io/idevops-git-actions/main/kubernetes_deployment_mongo: | The location where files lives. |
|AWS_ACCESS_KEY_ID |  | AWS access key identification. |
|AWS_SECRET_ACCESS_KEY |  | AWS access key. |
|AWS_DEFAULT_REGION |  | AWS access region. |
|MONGO_ROOT_PASSWORD | changeme123 | The default password for accessing root directory. |
|MONGO_USERNAME | admin | The default username for accessing root directory. |