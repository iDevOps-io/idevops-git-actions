import requests
import json


f = open('vars/kubectl/vars.json')
contents = f.read()

url_to_secret = "http://a9fea146920874acc8ed3a051441aeb6-262288570.us-west-2.elb.amazonaws.com:8200/v1/kv/data/kubectl"
headers = {
    "X-Vault-Token": "s.mRjB2NTPeZOrZaFViUamswff"
}
data_payload = {
  "options": {
    "cas": 1
  },
  "data": {
    "image": "kubectl",
    "docker_org_name": "idevopsiointernal",
    "port": "9000",
    "disk_size": "10Gi",
    "kubernetes_cluster_name": "idevops-vaas-cluster",
    "kubernetes_namespace": "kubectl",
    "DOCKER_EMAIL": "grant@sifchain.finance",
    "DOCKER_HOST_URL": "https://index.docker.io/v1/",
    "docker_pull_secret": "kubectl-docker-secret",
    "app_name": "kubectl",
    "OUTPUT_FILE": "manifests/kubectl/deployment.yaml",
    "INPUT_FILE": "manifests/kubectl/deployment.yaml.template",
    "TZ": "utc"  }
}

create_secret = requests.post(url_to_secret,headers=headers,data=json.dumps(data_payload))
print(create_secret.text)