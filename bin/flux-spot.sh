#!/bin/bash

WK_DIR=$(dirname $0)
source ${WK_DIR}/env

# flux azure : https://fluxcd.io/docs/use-cases/azure/

flux bootstrap github \
  --owner=${GITHUB_USER} \
  --repository=${GITHUB_REPO} \
  --branch=nginx-ingress \
  --personal \
  --token-auth \
  --path=clusters/dev/azure \
  --network-policy=true \
  --toleration-keys="kubernetes.azure.com/scalesetpriority"

#  --toleration-keys="HPCCCriticalOnly"
#  --toleration-keys="kubernetes.azure.com/scalesetpriority"
# --context=aks-flux2-wangxi01-canadacentral-admin \
# --toleration-keys="kubernetes.azure.com/scalesetpriority,HPCCCriticalOnly"
#  --context=docker-desktop \
# watch flux get kustomizations

# delete and cleanup
#flux uninstall --namespace=flux-system --context=docker-desktop
#flux uninstall --namespace=hpcc-systems --context=docker-desktop
