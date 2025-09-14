# KGateway Demo

## Installation

Install KGateway:
```
cd install
./install-kgateway-with-helm.sh
./create-tls-cert-secret-api-example-com.sh
```

> NOTE
> The KGateway version that will be installed is set in a variable at the top of the `install/install-gloo-gateway-with-helm.sh` installation script.

## Setup the environment

Run the `install/setup.sh` script to setup the environment:

- Create the required namespaces
- Deploy the Gateway
- Deploy the Reference Grants
- Deploy the HTTPBin application
- Deploy the HTTPRoute (K8S Gateway API)

```
./setup.sh
```

## Access the HTTPBin application

__K8S Gateway API:__

```
./curl-request-g8s-gw-api.sh
```

or

```
curl -v http://api.example.com/get
```
