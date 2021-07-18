# DevOps experiments on Jenkins CI platform executing in a lightweight K8 cluster aka K3S via K3D

DevOps experimentation with a continuous integration platform in Kubernetes.

# Initiate the k8 cluster with Jenkins CI platform

```bash
docker-compose -f docker-compose.yaml up -d --build --force-recreate
```

# Configure the Jenkins server

Go to http://localhost/login and follow the instructions for setting up the Jenkins server.


