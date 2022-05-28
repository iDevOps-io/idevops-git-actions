```yaml
name: "zaproxyscan"

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
        uses: iDevOps-io/idevops-git-actions/zaproxyscan@main
        with:
          aws_access_key_id: ${{ secrets.AWS_ACCESS_KEY_ID }}
          aws_secret_access_key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
        docker run -t owasp/zap2docker-stable zap-full-scan.py -t https://www.example.com
```