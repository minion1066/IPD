#!/bin/bash

# FORGE K3s Container Deployment
# Prerequisites: Run setup_cluster.sh first
#
# Additional consideration: ensure bare-metal ollama agents are stopped on target machines:
#   ansible -K -i inventory.ini nickel,zinc,copper -m shell -a "systemctl stop ollama.service" --become

echo "=== FORGE K3s Deployment ==="

echo "Creating persistent storage..."
kubectl apply -f forge-db-storage.yml

echo "Deploying ForgeDB..."
kubectl apply -f forge-db.yml
echo "=== Database deployed ==="

echo "Verifying deployment..."
kubectl get pods
kubectl get services

# Deploy Ollama nodes individually as needed:
# kubectl apply -f ollama-tungsten.yml
kubectl apply -f ollama-iron.yml
kubectl apply -f ollama-copper.yml
kubectl apply -f ollama-nickel.yml
kubectl apply -f ollama-zinc.yml


echo ""
echo "=== Deployment complete ==="

echo ""
echo "To launch a FORGE code container for interactive use:"
echo "  ./forge-shell.sh"