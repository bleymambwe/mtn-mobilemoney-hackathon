import requests

#url = 'http://<virtual-machine-public-ip>/process_input/'

message = {
    "msg": "what does the consition say about sending money abroad? ",
}

response = requests.post(url, json=message)

data = response.json()
print(data)