#!/bin/bash

WK_DIR=$(dirname $0)
source ${WK_DIR}/env

flux bootstrap github \
  --context=docker-desktop \
  --owner=${GITHUB_USER} \
  --repository=${GITHUB_REPO} \
  --branch=azure \
  --personal \
  --token-auth \
  --path=clusters/dev/zure

# watch flux get kustomizations

# delete and cleanup
#flux uninstall --namespace=flux-system --context=docker-desktop
#flux uninstall --namespace=hpcc-systems --context=docker-desktop
