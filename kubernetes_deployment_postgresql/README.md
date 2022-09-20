```yaml
name: "AWS:EKS:DEPLOY:POSTGRESQL"

on:
  workflow_dispatch:
    inputs:
      kubernetes_cluster_name:
        description: Name of kubernetes cluster
        default: idevops-vaas-cluster
            
jobs:
  build_deploy_postgresql:
    name: "AWS:EKS:DEPLOY:POSTGRESQL"
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
          
      - name: "KUBERNETES:DEPLOY:POSTGRESQL"
        uses: iDevOps-io/idevops-git-actions/kubernetes_deployment_postgresql@main
        with:
```
|Input   | Default Value  | Description  |
| --- | :--: | --- |
|kubernetes_config   | /home/runner/.kube/config  |Location of the kubeconfig you want to use to deploy to kubernetes.   |
|app_name   | postgresql  |What you want to name your postgresql deployment.   |
|kubernetes_namespace   | postgresql  |The namespace in kubernetes you want to deploy to.   |
|docker_pull_secret   |   |The name of the docker pull secret you with to use to pull your image.   |
| docker_org_name  |   |  The org you will be pushing to and pulling from. |
| image  |   |The image tag you wish to tag the docker image as.   |
|port   | 5432  |The port the container and service will be running on.   |
|initial_delay   | 60|Number of seconds after the container has started before liveness or readiness probes are initiated.  |
|period_time   | 90  |How often (in seconds) to perform the probe.   |
|success_threshold   | 1  |Minimum consecutive successes for the probe to be considered successful after having failed.   |
|failure_threshold   | 10  | Number of probes if the preceding probe fails.   |
|mount_path   | /var/lib/postgresql/data  |The persistent volume mount path.   |
|sub_path   | pgdata  |The persistent volume sub mount.   |
|disk_size   | 5Gi  |The size of the persistent volume you wish to provision.   |
|storage_class   | gp2  |The default storage class for the postgresql deployment.   |
|database_name   | Testdb  |The name of the database.   |
|database_password   | changeme123  |The root password for the database.   |
|docker_username   |   |The docker username to use for dockerhub authentication.   |
|docker_password   |   |The docker password to use for dockerhub authentication.   |
|docker_file_location   | /home/runner/work/_actions/iDevOps-io/idevops-git-actions/main/kubernetes_deployment_postgresql/  |The docker org you will be pushing your image to.   |
|docker_server_url   |https://index.docker.io/v1/   |The url to push docker images to.   |
|composite_file_location   |/home/runner/work/_actions/iDevOps-io/idevops-git-actions/main/kubernetes_deployment_postgresql   |The location where files live.   |