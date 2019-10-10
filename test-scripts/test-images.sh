#!/bin/bash

aws ecr describe-repositories > rop.txt

val=`cat rop.txt|grep "repositoryName"|egrep "position-simulator|queue|position-tracker|api-gateway|webapp"|wc -l`

if [ "$val" -ne 10 ]
then
    echo "Repositories Not Created"
    exit 127
else
    echo "Repositories Created"
    exit 0
fi
