#!/bin/bash

#repoclone.sh clones the repo from the app#

#generate a jwt to authenticate with (uses the privatekey)
JWT=$(ruby jwtgenerator.rb)
echo $JWT

#Get the access token for this specific repo
TOKENRESPONSE=$(curl -X POST -H "Authorization: Bearer $JWT" \
-H "Accept: application/vnd.github.machine-man-preview+json" \
https://api.github.com/app/installations/504649/access_tokens)

AUTHTOKEN=${TOKENRESPONSE} | jq .token


#Clone with the access token
git clone https://x-access-token:${AUTHTOKEN}@github.com/CharlesWinter/TestGoDoc.git