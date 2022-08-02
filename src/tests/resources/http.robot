**Variables
${API_URL}      https://localhost
${API_USERNAME}     user
${API_PASSWORD}     pwd
${API_CLIENT_ID}    client_id
${API_CLIENT_SECRET}    client_secret

**Keywords
OAuth Token
    Create Session  dev  ${API_URL}     verify=True
    &{data}=    Create dictionary  username=${API_USERNAME}  password=${API_PASSWORD}  grant_type=password  client_id=${API_CLIENT_ID}   client_secret=${API_CLIENT_SECRET}
    ${resp}=    POST On Session    dev  /oauth/token  data=${data}   expected_status=200
    RETURN  ${resp.json()['access_token']}