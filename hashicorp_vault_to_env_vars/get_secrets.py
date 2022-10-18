import requests
import os
headers = { "X-Vault-Token": os.environ["VAULT_TOKEN"] }
secret = requests.get(os.environ["VAULT_ADDR"],headers=headers)
secret = secret.json()
github_env_file = open(os.environ["GITHUB_ENV"], "a")
github_mask_file = open("tmp_mask", "w")
for secret_key in secret["data"]["data"]:
    github_env_file.write(secret_key + "=" + secret["data"]["data"][secret_key])
    github_mask_file.write('echo "::add-mask::${secret_key}"'.format(secret_key=secret_key))
github_env_file.close()
github_mask_file.close()