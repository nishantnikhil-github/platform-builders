#!/bin/bash


function kubectl {
  docker run -v $PWD:/work \
    -w /work \
    -v /usr/bin/aws-iam-authenticator:/usr/bin/aws-iam-authenticator \
    -v /root/.kube/config:/config \
    --rm --name kubectl \
    bitnami/kubectl:latest \
    --kubeconfig /config $@
}

kubectl get deployments | tee dep.txt

val=`cat dep.txt| wc -l`

if [ "$val" -ne 7 ]
then
    echo "Deployments Not Found"
    exit 127
else
    echo "Images Deployed"
    exit 0
fi
