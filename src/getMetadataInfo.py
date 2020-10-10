import json
import os

def lambda_handler(event,context): 

 version = os.environ.get("version")
 lastcommitsha : os.envrion.get("commit-sha")
 print(f'version:{version} sha:{lastcommitsha}')
 body = 



"myapplication": [
  {
    "version": os.environ.get("version"),
    "description" : "pre-interview technical test",
    "lastcommitsha": os.environ.get("commit-sha")
  }

return{
    "body" : json.dumps(body)
}
]
