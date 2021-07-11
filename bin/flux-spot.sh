#!/bin/bash

WK_DIR=$(dirname $0)
source ${WK_DIR}/env

flux bootstrap github \
  --owner=${GITHUB_USER} \
  --repository=${GITHUB_REPO} \
  --branch=azure \
  --personal \
  --token-auth \
  --path=clusters/dev/azure \
  --toleration-keys=kubernetes.azure.com/scalesetpriority

#  --context=docker-desktop \
# watch flux get kustomizations

# delete and cleanup
#flux uninstall --namespace=flux-system --context=docker-desktop
#flux uninstall --namespace=hpcc-systems --context=docker-desktop
