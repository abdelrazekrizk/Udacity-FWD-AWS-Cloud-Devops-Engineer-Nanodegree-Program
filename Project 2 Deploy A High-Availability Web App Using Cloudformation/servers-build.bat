aws cloudformation create-stack --stack-name APPServer --template-body file://servers.yml  --parameters file://servers-parameters.json  --region=us-east-1 --capabilities CAPABILITY_NAMED_IAM


backend.yml


aws cloudformation create-stack --stack-name APPServer --template-body file://backend.yml --region=us-east-1 --capabilities CAPABILITY_NAMED_IAM
