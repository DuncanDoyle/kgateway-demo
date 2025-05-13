
#!/bin/sh

# export KGATEWAY_VERSION="v2.0.0"
export KGATEWAY_VERSION="v2.1.0-main"
export KGATEWAY_HELM_VALUES_FILE="kgateway-helm-values.yaml"

# if [ -z "$GLOO_GATEWAY_LICENSE_KEY" ]
# then
#    echo "Gloo Gateway License Key not specified. Please configure the environment variable 'GLOO_GATEWAY_LICENSE_KEY' with your Gloo Gateway License Key."
#    exit 1
# fi

#----------------------------------------- Install Gloo Gateway with K8S Gateway API support -----------------------------------------

printf "\nApply K8S Gateway CRDs ....\n"
kubectl apply -f https://github.com/kubernetes-sigs/gateway-api/releases/download/v1.2.1/standard-install.yaml

# helm upgrade --install gloo glooe/gloo-ee --namespace gloo-system --create-namespace --set-string license_key=$GLOO_GATEWAY_LICENSE_KEY -f $GLOO_GATEWAY_HELM_VALUES_FILE --version $GLOO_GATEWAY_VERSION

printf "\nInstall KGateway CRDs ....\n"
helm install kgateway-crds oci://cr.kgateway.dev/kgateway-dev/charts/kgateway-crds --version $KGATEWAY_VERSION --namespace kgateway-system --create-namespace

printf "\nInstall KGateway ...\n"
helm install kgateway oci://cr.kgateway.dev/kgateway-dev/charts/kgateway --version $KGATEWAY_VERSION --namespace kgateway-system --create-namespace



