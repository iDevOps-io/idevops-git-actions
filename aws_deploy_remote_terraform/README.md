```yaml
name: "Apply Remote Terraform to AWS Cluster"

on:
  workflow_dispatch:
    inputs:
      dynamo_db_table_name:
        description: Dynamo Database table name
        required: false
      s3_bucket:
        description: s3 bucket 
        required: false
      TF_MAIN:
        description: github RAW URL for the terraform template file (main.tf)
        required: true
        default: "https://raw.githubusercontent.com/iDevOps-io/terraform-aws-rds-aurora/main/main.tf"
      TF_VARS:
        description: github RAW URL for the terraform variables file (vars.tf)
        required: true
        default: "https://raw.githubusercontent.com/iDevOps-io/terraform-aws-rds-aurora/main/vars.tf"
      TF_VARS_JSON:
        description: github RAW URL for the terraform variables file (vars.tf)
        required: true
        default: "https://raw.githubusercontent.com/iDevOps-io/terraform-aws-rds-aurora/main/vars.json"

jobs:
  apply_remote_terraform:
    name: "Apply Remote Terraform to AWS Cluster"
    runs-on: ${{ matrix.os }}

    strategy:
      matrix:
        os: [ 'ubuntu-latest' ]

    steps:
      - uses: actions/checkout@v2

      - name: "Apply Remote Terraform to AWS Cluster"
        uses: iDevOps-io/idevops-git-actions/aws_deploy_remote_terraform@main
        with:
          AWS_ACCESS_KEY_ID: "${{ secrets.AWS_ACCESS_KEY_ID }}"
          AWS_SECRET_ACCESS_KEY: "${{ secrets.AWS_SECRET_ACCESS_KEY }}"
          AWS_DEFAULT_REGION: "${{ secrets.AWS_DEFAULT_REGION }}"
          dynamo_db_table_name: "${{ github.event.inputs.dynamo_db_table_name }}"
          s3_bucket: "${{ github.event.inputs.s3_bucket }}"
          TF_MAIN: "${{ github.event.inputs.TF_MAIN }}"
          TF_VARS: "${{ github.event.inputs.TF_VARS }}"
          TF_VARS_JSON: "${{ github.event.inputs.TF_VARS_JSON }}"
```
