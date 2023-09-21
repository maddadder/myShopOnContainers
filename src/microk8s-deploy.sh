#!/bin/bash

set -e

source .microk8s

#if false; then
docker-compose --env-file .microk8s build
docker push $REGISTRY/identity.api:linux-$TAG
docker push $REGISTRY/basket.api:linux-$TAG
docker push $REGISTRY/catalog.api:linux-$TAG
docker push $REGISTRY/ordering.api:linux-$TAG
docker push $REGISTRY/ordering.backgroundtasks:linux-$TAG
docker push $REGISTRY/payment.api:linux-$TAG
docker push $REGISTRY/webhooks.api:linux-$TAG
docker push $REGISTRY/mobileshoppingagg:linux-$TAG
docker push $REGISTRY/webshoppingagg:linux-$TAG
docker push $REGISTRY/ordering.signalrhub:linux-$TAG
docker push $REGISTRY/webstatus:linux-$TAG
docker push $REGISTRY/webspa:linux-$TAG
docker push $REGISTRY/webmvc:linux-$TAG
docker push $REGISTRY/webhooks.client:linux-$TAG
#fi

helm install eshop ../deploy/microk8s/chart --set registry.url=$REGISTRY --set image.tag=linux-$TAG --set appNamespace=$NAMESPACE --set rootDomainName=$ROOT_DOMAIN_NAME --namespace $NAMESPACE
#helm upgrade eshop ../deploy/microk8s/chart --set registry.url=$REGISTRY --set image.tag=linux-$TAG --set appNamespace=$NAMESPACE --set rootDomainName=$ROOT_DOMAIN_NAME --namespace $NAMESPACE

#helm uninstall eshop --namespace $NAMESPACE
