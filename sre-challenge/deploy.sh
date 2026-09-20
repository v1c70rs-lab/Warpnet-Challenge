#!/bin/bash
set -e

IMAGE="warpnet:latest"
CLUSTER="warpnet-cluster"
PORT="1111"

echo "Creating kind cluster..."
kind create cluster --name $CLUSTER

echo "Creating docker image..."
docker build -t $IMAGE ./app

echo "Loading image into kind..."
kind load docker-image $IMAGE --name $CLUSTER

echo "Applying Kubernetes manifests..."
kubectl apply -f ./deployment.yaml

echo "Deployment complete."
kubectl get pods
kubectl get service

echo "Waiting for pods to become ready..."
kubectl wait --for=condition=ready pod -l app=warpnet --timeout=120s

echo "Portforwarding service to host port $PORT"
kubectl port-forward service/warpnet-service $PORT:5000

