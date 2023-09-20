#!/bin/bash
set -e

source .microk8s
#if false; then
docker-compose --env-file .microk8s -f docker-compose-microk8s.yml build

docker push $REGISTRY/identity.api:$TAG
docker push $REGISTRY/basket.api:$TAG
docker push $REGISTRY/catalog.api:$TAG
docker push $REGISTRY/ordering.api:$TAG
docker push $REGISTRY/ordering.backgroundtasks:$TAG
docker push $REGISTRY/payment.api:$TAG
docker push $REGISTRY/webhooks.api:$TAG
docker push $REGISTRY/mobileshoppingagg:$TAG
docker push $REGISTRY/webshoppingagg:$TAG
docker push $REGISTRY/ordering.signalrhub:$TAG
docker push $REGISTRY/webstatus:$TAG
docker push $REGISTRY/webspa:$TAG
docker push $REGISTRY/webmvc:$TAG
docker push $REGISTRY/webhooks.client:$TAG
#fi

#helm install eshop ../deploy/microk8s/chart --set registry.url=$REGISTRY --namespace $NAMESPACE
helm upgrade eshop ../deploy/microk8s/chart --set registry.url=$REGISTRY --namespace $NAMESPACE

#helm uninstall eshop --namespace $NAMESPACE
