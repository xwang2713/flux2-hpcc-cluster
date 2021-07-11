#!/bin/bash

WK_DIR=$(dirname $0)
source ${WK_DIR}/env

# delete and cleanup
flux uninstall -s --namespace=flux-system 
flux uninstall -s --namespace=hpcc-systems
