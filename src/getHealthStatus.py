import json

def lambda_handler(event, context):
    body = "Your API is healthy!!"
    statusCode = 200
    return{
        "statusCode" : statusCode,
        "body" : json.dumps(body)

   }


