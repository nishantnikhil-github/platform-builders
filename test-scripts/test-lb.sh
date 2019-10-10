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

kubectl get svc | tee lb.txt

val=`cat lb.txt|grep "LoadBalancer"`

if [ -z "$val" ]
then
    echo "Service Not Found"
    exit 127
else
    echo "Service Located"
    exit 0
fi
