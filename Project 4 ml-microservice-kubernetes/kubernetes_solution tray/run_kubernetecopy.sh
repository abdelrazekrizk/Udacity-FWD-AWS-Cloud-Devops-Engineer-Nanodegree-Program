#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
dockerpath="docker.io/abdelrazekrizk/flask_prediction:version1.1.0"

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run flaskprediction \
    --image=$dockerpath \
    --port=80

# Step 3
# #Creating a service Expose the kubectl pod container port=80 ,port=8080
kubectl expose pod flaskprediction \
--port=80 \
--port=8080 \
--name=flaskapp

# Step 4
# Wait until your pod is running, check for "condition=ready"
#kubectl wait --for=condition=Ready pod/flaskprediction
kubectl wait --for=condition=Ready deployment/flaskapp --timeout=90s
# Step 5:
# List kubernetes pods
kubectl get pods --sort-by='.status.containerStatuses[0].restartCount'

# Step 6:
# get kubernetes pod/flaskprediction details
kubectl get -o json pod/flaskprediction

# Step 7:
# dump pod logs, with label name=myLabel (stdout)
#kubectl: export pod logs to file
kubectl logs pod/flaskprediction

# Step 8:
# Forward the container port to a host
#kubectl port-forward pod/flaskprediction 60:8080
kubectl expose deployment/flaskapp --port=80 --target-port=8080