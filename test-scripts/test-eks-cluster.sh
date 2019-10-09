#!/bin/bash

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
        exit 0
    else
        exit 100
    fi
    
fi
