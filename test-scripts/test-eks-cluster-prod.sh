#!/bin/bash

export  KUBECONFIG=/root/.kube/config_prod
kubectl apply -f /root/.kube/config_map_aws_auth_prod.yml
kubectl version > op.txt
val=`cat op.txt | grep "Server"`
if [ -z "$val" ]
then
    echo "Server is not created"
    exit 127
else
    nodesop=`kubectl get nodes -o wide`
    if [ -z "$nodesop" ]
    then
        exit 100
    else
        exit 0
    fi
    
fi
