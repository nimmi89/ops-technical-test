#This file conatins the test cases for the APIs

echo "Getting your api gateway url..........."
echo -e "${API_URL}\n"
echo

echo "Getting your API authorization key..............."
API_KEY=$(aws ssm get-parameter \
    --name API_KEY  \
    --with-decryption \
    --query 'Parameter.[Value]'\
    --output text) 
echo -e "${API_KEY}\n"


echo -e "1.Testing Root endpoint....................\n"
curl ${API_URL}  -H "x-api-key: ${API_KEY}"
echo -e "\n \n"

echo -e "2.Testing health endpoint....................\n"
curl -v {$API_URL}/health  -H "x-api-key: ${API_KEY}"
echo -e "\n \n"

echo -e "3.Testing metadata endpoint....................\n"
curl ${API_URL}/metadata  -H "x-api-key: ${API_KEY}"
echo -e "\n \n"
# aws apigateway test-invoke-method --rest-api-id $API \
#	 --resource-id $RESOURCE --http-method GET 
