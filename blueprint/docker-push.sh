#!/bin/bash
docker pull $1
docker tag $1 $2
docker push $2
status=$?
if [ $status -eq 1 ]; then
    echo "Error from this image $1 push/pull"
fi

