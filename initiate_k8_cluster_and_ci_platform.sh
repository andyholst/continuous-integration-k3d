#!/usr/bin/env bash

k3d cluster create ci-platform --api-port 6443 --port 80:80@loadbalancer --k3s-server-arg '--no-deploy=traefik'

helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm install my-nginx ingress-nginx/ingress-nginx --version 3.34.0 --set controller.admissionWebhooks.enabled=false

kubectl config use-context k3d-ci-platform
kubectl cluster-info

kubectl apply -f deployment/jenkins/volume.yaml
kubectl apply -f deployment/jenkins/serviceAccount.yaml
kubectl apply -f deployment/jenkins/deployment.yaml
kubectl apply -f deployment/jenkins/service.yaml
kubectl apply -f deployment/jenkins/ingress.yaml

tail -f /dev/null