```yaml
name: "Route53 UPSERT CNAME Pipeline"

on:
  workflow_dispatch:
    inputs:
      domain:
        description: Domain you want to update.
        default: grants.idevops.io
      cname_domain:
        description: CNAME Domain you want to update.
        default: idevops.io

jobs:
  update_route53:
    name: "Update or Create Route53"
    runs-on: ${{ matrix.os }}

    strategy:
      matrix:
        os: [ 'ubuntu-latest' ]

    steps:
      - uses: actions/checkout@v2

      - name: "Create an CNAME record set"
        uses: iDevOps-io/idevops-git-actions/route53@main
        with:
          aws_access_key_id: ${{ secrets.AWS_ACCESS_KEY_ID }}
          aws_secret_access_key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
          aws_route53_hosted_zone_id: ${{ secrets.ROUTE53_ZONEID }}
          aws_route53_rr_action: "UPSERT"
          aws_route53_rr_name: "${{ github.event.inputs.domain }}"
          aws_route53_rr_type: "CNAME"
          aws_route53_rr_ttl: "60"
          aws_route53_rr_value: "${{ github.event.inputs.cname_domain }}"

```