#!/bin/sh

if [ -z "$AWS_ACCESS_KEY" ]
then
   echo "AWS access-key not specified. Please configure the environment variable 'AWS_ACCESS_KEY' with your AWS access-key."
   exit 1
fi

if [ -z "$AWS_SECRET ACCESS_KEY" ]
then
   echo "AWS secret-access-key not specified. Please configure the environment variable 'AWS_SECRET_ACCESS_KEY' with your AWS secret-access-key."
   exit 1
fi

printf "\nCreating AWS Credentials secret in the 'kgateway-system' namespace."

# glooctl create secret aws \
#    --name aws-creds \
#    --namespace kgateway-system \
#    --access-key $AWS_ACCESS_KEY \
#    --secret-key $AWS_SECRET_ACCESS_KEY

kubectl apply -n kgateway-system -f - << EOF
apiVersion: v1
kind: Secret
metadata:
  name: aws-creds
stringData:
  accessKey: ${AWS_ACCESS_KEY}
  secretKey: ${AWS_SECRET_ACCESS_KEY}
  sessionToken: ""
type: Opaque
EOF