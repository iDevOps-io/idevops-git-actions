```yaml
name: "Kubernetes validate statefulset"
author: Jared Colgrove <jcolgrove@idevops.io>
branding:
  icon: cloud
  color: gray-dark
description: Kubernetes validate statefulset
inputs:
  app_name:
    description: Name of the app you are deploying.
    required: true
  namespace:
    description: Kubernetes namespace you wish to use
    required: true
  kube_config_location:
    description: Location of the kubeconfig you want to use.
    default: "/home/runner/.kube/config"
    required: false
runs:
  using: "composite"
  steps:
  - run: |
      #!/usr/bin/env bash
      kubectl rollout status statefulset/${{ inputs.app_name }} --namespace ${{ inputs.namespace }} --kubeconfig=${{ inputs.kube_config_location }}
    shell: bash
```    