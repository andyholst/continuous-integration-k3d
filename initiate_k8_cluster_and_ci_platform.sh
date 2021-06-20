#!/usr/bin/env bash

k3d cluster create jenkins
tail -f /dev/null

# docker exec k3dcontainer helm repo add jenkinsci https://charts.jenkins.io
