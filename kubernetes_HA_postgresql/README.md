```yaml
name: "AWS:EKS:DEPLOY:HA:POSTGRESQL"
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
  build_deploy_ha_postgresql:
    name: "AWS:EKS:DEPLOY:HA:POSTGRESQL"
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
          kubernetes_cluster_name: "${{ github.event.inputs.kubernetes_cluster_name }}"
          
      - name: "KUBERNETES:DEPLOY:HA:POSTGRESQL"
        uses: iDevOps-io/idevops-git-actions/kubernetes_HA_postgresql/kubernetes_statefulset_postgresql@IIO-74
        with:
```        
|Input   | Default Value  | Description  |
| --- | :--: | --- |        
|kubernetes_config   | /home/runner/.kube/config  |Location of the kubeconfig you want to use to deploy to kubernetes.   |
|app_name   | postgres  |What you want to name your postgresql deployment.   |
|kubernetes_namespace   | postgresql-ha  |The namespace in kubernetes you want to deploy to.   |
|docker_pull_secret   |   |The name of the docker pull secret you with to use to pull your image.   |
| docker_org_name  |   |  The org you will be pushing to and pulling from. |
| image  |   |  The image name you want to build and push the docker image for postgresql to.   |
| image_tag  |  |  The image tag you wish to tag the docker image as.  |
|port   | 5432  |The port the container and service will be running on.   |
|node_port  |      |  The node port the container and service will be open on.
|initial_delay   | 30  |  Number of seconds after the container has started before liveness or readiness probes are initiated.  |
|period_time   |  10  |How often (in seconds) to perform the probe.   |
|success_threshold   | 1  |Minimum consecutive successes for the probe to be considered successful after having failed.   |
|failure_threshold   | 10  | Number of probes if the preceding probe fails.   |
|timeout_period   | 5  | Number of seconds after which the probe times out.   |
|mount_path   | "/bitnami/postgresql"  |The persistent volume mount path.   |
|disk_size   | 2Gi  |The size of the persistent volume you wish to provision.   |
|database_password   | changeme123  |The root password for the database.   |
|docker_username   |   |The docker username to use for dockerhub authentication.   |
|docker_password   |   |The docker password to use for dockerhub authentication.   |
|docker_file_location   | /home/runner/work/_actions/iDevOps-io/idevops-git-actions/main/kubernetes_HA_postgresql/kubernetes_statefulset_postgresql  |The location of the dockerfile.   |
|docker_server_url   |https://index.docker.io/v1/   |The url to push docker images to.   |
|composite_file_location   |/home/runner/work/_actions/iDevOps-io/idevops-git-actions/main/kubernetes_HA_postgresql  |The location where files live.   |

```yaml
      - name: "KUBERNETES:DEPLOY:HA:PGPOOL"
        uses: iDevOps-io/idevops-git-actions/kubernetes_HA_postgresql/kubernetes_deployment_pgpool@IIO-74
        with:
```
|Input   | Default Value  | Description  |
| --- | :--: | --- |        
|kubernetes_config   | /home/runner/.kube/config  |Location of the kubeconfig you want to use to deploy to kubernetes.   |
|app_name   | pgpool  |What you want to name your pgpool deployment.   |
|kubernetes_namespace   | postgresql-ha  |The namespace in kubernetes you want to deploy to.   |
|docker_pull_secret   |   |The name of the docker pull secret you with to use to pull your image.   |
| docker_org_name  |   |  The org you will be pushing to and pulling from. |
| image  |   |  The image name you want to build and push the docker image for pgpool to.   |
| image_tag  |  |  The image tag you wish to tag the docker image as.  |
|port   | 5432  |The port the container and service will be running on.   |
|node_port  |      |  The node port the container and service will be open on.
|initial_delay   | 30  |  Number of seconds after the container has started before liveness or readiness probes are initiated.  |
|period_time   |  10  |How often (in seconds) to perform the probe.   |
|success_threshold   | 1  |Minimum consecutive successes for the probe to be considered successful after having failed.   |
|failure_threshold   | 10  | Number of probes if the preceding probe fails.   |
|timeout_period   | 5  | Number of seconds after which the probe times out.   |
|admin_password   | admin123  |The pgpool admin password   |
|docker_username   |   |The docker username to use for dockerhub authentication.   |
|docker_password   |   |The docker password to use for dockerhub authentication.   |
|docker_file_location   | /home/runner/work/_actions/iDevOps-io/idevops-git-actions/main/kubernetes_HA_postgresql/kubernetes_deployment_pgpool  | The location of the dockerfile.   |
|docker_server_url   |https://index.docker.io/v1/   |The url to push docker images to.   |
|composite_file_location   |/home/runner/work/_actions/iDevOps-io/idevops-git-actions/main/kubernetes_HA_postgresql   |The location where files live.   |
app_name: "pgpool"
          kubernetes_namespace: "postgresql-ha"
          docker_pull_secret: "pgpool-docker-secret"
          docker_org_name: "idevopsiointernal"
          image: "bitnami-pgpool"
          image_tag: "${{ github.event.inputs.docker_tag }}"
          port: "5432"
          node_port: "32000"
          initial_delay: "30"
          period_time: "10"
          success_threshold: "1"
          failure_threshold: "10"
          timeout_period: "5"
          docker_username: ${{ secrets.DOCKER_USERNAME }}
          docker_password: ${{ secrets.DOCKER_PASSWORD }}
          docker_server_url: "https://index.docker.io/v1/"
          AWS_ACCESS_KEY_ID: "${{ secrets.AWS_ACCESS_KEY_ID }}"
          AWS_SECRET_ACCESS_KEY: "${{ secrets.AWS_SECRET_ACCESS_KEY }}"
          AWS_DEFAULT_REGION: "${{ secrets.AWS_DEFAULT_REGION }}"
          admin_password: "admin123"

