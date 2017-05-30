#!/bin/bash
echo "$KUBERNETES"

if [ $KUBERNETES = "true" ]
then
    hugo serve  --bind=0.0.0.0  --port=1313 --baseURL=http://blog.cescoferraro.xyz:1313  --appendPort=false
    echo "KUBERNETES HUGO"
else
    hugo serve  --bind=0.0.0.0  --port=1313 --baseURL=http://localhost:1313  --appendPort=false
    echo "DOCKER HUGO"
fi
