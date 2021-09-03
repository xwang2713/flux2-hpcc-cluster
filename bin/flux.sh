#!/bin/bash

WK_DIR=$(dirname $0)
source ${WK_DIR}/env

flux bootstrap github \
  --owner=${GITHUB_USER} \
  --repository=${GITHUB_REPO} \
  --branch=nginx-ingress \
  --personal \
  --token-auth \
  --network-policy=true \
  --path=clusters/dev/azure

#  --context=docker-desktop \
# watch flux get kustomizations

# delete and cleanup
#flux uninstall --namespace=flux-system --context=docker-desktop
#flux uninstall --namespace=hpcc-systems --context=docker-desktop
