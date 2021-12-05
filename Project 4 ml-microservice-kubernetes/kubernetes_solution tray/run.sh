#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath="abdelrazekrizk/flask_prediction:version1.1.0"

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run --generator=run-pod/v1  --image=$DOCKER_PATH --port=80

# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
kubectl port-forward pod/udacity-project1 8080:80