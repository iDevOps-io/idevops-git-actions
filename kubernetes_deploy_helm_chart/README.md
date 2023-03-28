```
name: "Kubernetes Deploy Helm Chart"

on: 
workflow_dispatch:
inputs:
  chart_name:
    description: Name of the helm chart you are deploying.
    required: true
  repo_url:
    description: URL for the helm chart
    required: true
  release_name:
    description: Release Name for Helm Chart Deployment
    required: true
  namespace:
    description: Kubernetes namespace you wish to use
    required: true
  kube_config_location:
    description: Location of the kubeconfig you want to use.
    default: "/home/runner/.kube/config"
    required: false
    
jobs:
  deploy_helm_chart:
    name: "Apply Helm Chart"
    runs-on: ${{ matrix.os }} 

    strategy:
      matrix:
        os: [ 'ubuntu-latest' ]
        
    steps:
      - uses: actions/checkout@v2

      - name: "Apply Helm Chart"
        uses: iDevOps-io/idevops-git-actions/aws_deploy_remote_terraform@main
        with:
          chart_name: "${{ secrets.chart_name }}"
          repo_url: "${{ secrets.repo_url }}"
          release_name: "${{ secrets.release_name }}"
          namespace: "${{ secrets.namespace }}"
          
