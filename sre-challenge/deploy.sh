#!/bin/bash
set -e

IMAGE="warpnet_image"
CLUSTER="warpnet-cluster"
PORT="1111"

echo "Creating kind cluster..."
kind create cluster --name $CLUSTER

echo "Loading image into kind..."
kind load image-archive $IMAGE --name $CLUSTER

echo "Applying Kubernetes manifests..."
kubectl apply -f ./deployment.yaml

echo "Deployment complete."
kubectl get pods
kubectl get service

echo "Waiting for pods to become ready..."
kubectl wait --for=condition=ready pod -l app=warpnet --timeout=120s

echo "Portforwarding service to host port $PORT"
kubectl port-forward service/warpnet-service $PORT:5000

