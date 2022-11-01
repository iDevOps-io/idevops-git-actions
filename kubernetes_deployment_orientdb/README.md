```yaml
name: "AWS:EKS:DEPLOY:ORIENTDB"

on:
  workflow_dispatch:
    inputs:
      kubernetes_cluster_name:
        description: Name of kubernetes cluster
        default: idevops-vaas-cluster
        docker_tag:
        description: docker tag
        default: 1      
jobs:
  build_deploy_orientdb:
    name: "AWS:EKS:DEPLOY:ORIENTDB"
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
          
      - name: "KUBERNETES:DEPLOY:ORIENTDB"
        uses: iDevOps-io/idevops-git-actions/kubernetes_deployment_orientdb@main
        with:
          app_name: "orientdb"
          kubernetes_namespace: "orientdb"
          docker_pull_secret: "orientdb"
          docker_org_name: "idevopsiointernal"
          image: "orientdb"
          image_tag: "latest"
          port: "2434"
          port_two: "2435"
          port_three: "2436"
          mount_path: "/var/application-data/orientdb"
          disk_size: "20Gi"
          hostname: "orientdb-hub.idevops.io"
          docker_username: ${{ secrets.DOCKER_USERNAME }}
          docker_password: ${{ secrets.DOCKER_PASSWORD }}
          docker_server_url: "https://index.docker.io/v1/"

      - name: "KUBERNETES:DEPLOY:ORIENTDB"
        uses: iDevOps-io/idevops-git-actions/kubernetes_deployment_orientdb@main
        with:
```
|Input   | Default Value  | Description  |
| --- | :--: | --- |
|kubernetes_config | /home/runner/.kube/config | Location of the kubeconfig you want to use to deploy to kubernetes.|
| app_name | orientdb | What you want to name your orientdb deployment. |
| kubernetes_namespace | orientdb | The namespace in k8s you want to deployment | 
| docker_pull_secret | | The name of the docker pull secret you with to use to pull your image. | 
| docker_org_name | idevopsiointernal | The org you will be pushing to and pulling from. | 
| image | orientdb | The image name you want to build and push the docker image for orientDB to. |
| image_tag | latest |The image tag you wish to tag the docker image as. | 
| port | 2434 | The port the container and service will be running on. | 
| port_two | 2435 | The second port the container and service will be running on. | 
| port_three | 2436 | The third port the container and service will be running on. |  
| initial_delay | 60 | Number of seconds after the container has started before liveness or readiness probes are initiated. | 
| period_time | 90 | How often (in seconds) to perform the probe. | 
| success_threshold | 1 | Minimum consecutive success for the probe to be considered successful after having failed. | 
| failure_threshold | 10 | Number of probes if the preceding probe fails. | 
| mount_path | /var/application-data/orientdb | The persistent volume mount path. | 
| disk_size | 20Gi | The size of the persistent volume you wish to provision. | 
| hostname | orientdb-hub.idevops.io | The hostname to be set in the ingress controller. | 
| docker_username | | The docker username to use for dockerhub authentication. | 
| docker_password | 
| docker_file_location | The docker org you will be pushing your image to. | /home/runner/work/_actions/iDevOps-io/idevops-git-actions/main/kubernetes_deployment_orientdb/ | 
| docker_server_url | The url to push docker images to | https:index.docker.io/v1/ | 
| composite_file_location | The location where files live | /home/runner/work/_actions/iDevOps-io/idevops-git-actions/main/kubernetes_deployment_orientdb |  