#!/bin/bash

cd ../eks-setup
terraform init -backend-config=backend.hcl
terraform plan
terraform apply --auto-approve
mkdir -p /root/.kube
terraform output kubeconfig > /root/.kube/config
terraform output config_map_aws_auth > config_map_aws_auth.yml
kubectl apply -f config_map_aws_auth.yml