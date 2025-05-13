#!/bin/sh

pushd ..

# Deploy the Gateway
#KGateway gateway deployment
kubectl create namespace ingress-gw --dry-run=client -o yaml | kubectl apply -f -
kubectl apply -f gateways/tcp-gw.yaml

# Label the default namespace, so the gateway will accept the HTTPRoute from that namespace.
printf "\nLabel default namespace ...\n"
kubectl label namespaces default --overwrite shared-gateway-access="true"

# Static Backend
kubectl apply -f backends/tcpbin-com-backend.yaml

# Requires experimental GW API channel
 kubectl apply -f https://github.com/kubernetes-sigs/gateway-api/releases/download/v1.2.1/experimental-install.yaml

# HTTPRoute
printf "\nDeploy TCPRoute ...\n"
kubectl apply -f routes/external-echo-tcproute.yaml

popd