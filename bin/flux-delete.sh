#!/bin/bash

WK_DIR=$(dirname $0)
source ${WK_DIR}/env

#CONTEXT=<Kubernetes context name>
# delete and cleanup
#flux uninstall -s --namespace=flux-system --context=${CONTEXT}
#flux uninstall -s --namespace=hpcc-systems --context=${CONTEXT}
flux uninstall -s --namespace=flux-system
flux uninstall -s --namespace=hpcc-systems
kubectl delete pv --all  -n hpcc-systems
kubectl delete clusterrole elk-filebeat-cluster-role
kubectl delete clusterrolebinding elk-filebeat-cluster-role-binding
