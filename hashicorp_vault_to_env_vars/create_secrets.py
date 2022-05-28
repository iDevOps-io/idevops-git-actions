import requests
import os
headers = { "X-Vault-Token": os.environ["VAULT_TOKEN"] }
create_secret = requests.post(os.environ["VAULT_ADDR"],headers=headers, data=os.environ["VAULT_PAYLOAD"])
print(create_secret.text)