#!/bin/bash

export  KUBECONFIG=/root/.kube/config
kubectl apply -f /root/.kube/config_map_aws_auth.yml
kubectl get deployments > dep.txt

val=`cat dep.txt| wc -l`

if [ "$val" -ne 7 ]
then
    echo "Deployments Not Found"
    exit 127
else
    echo "Images Deployed"
    exit 0
fi
