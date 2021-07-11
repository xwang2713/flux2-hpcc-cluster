# GitOps/flux for HPCC Systems Cloud Deployment

## Introduction
- https://github.com/fluxcd/flux2
- https://fluxcd.io/docs/get-started/

## Examples Reference
- https://github.com/fluxcd/flux2-kustomize-helm-example

## Steps
### Kubernetes cluster
You should have a Kubernetes cluster ready to use. We currently tested on local Docker Desktop and Azure AKS
You should set which Kubernetes cluster to use if you have multiple ones by
```code
kubectl config use-context <context name>
```
Or you can modify flux bootstrap/delete scripts under bin/ to have "--context=<context name>"

### github 
- Create a github account
- Create a token
- Create github a repo for HPCC cluster deployment or fork this one
- fill bin/env

### Prepare HPCC cluster deployment
Follow the Example or this repo to HPCC cluster settings <br/>
The general structure

```tree
\# HPCC and related resources, such as storage, logging
apps/

\# Helm Chart Sources and third party charts or yaml files
infrastures/

\# Cluster and Flux settings. Currently tested dev/local and dev/azure. Change apps.yaml to point a different cluster setup
clusters/

```
### Bootstrap

In bin directory, make sure env has correct information about your github repo.  Edit flux.sh to point your github repo, branch and cluster path in the repo. Use flux-spot.sh spot node pool <br/>
To start:
```code
./flux.sh
```
Check the status:
```code
flux get all
```
See "flux --help" for more flux commands <br/>
You also can use helm and kubectl commands to get the status of the cluster. The default namespace is "hpcc-systems"

### Bootstrap
To delete the cluster in bin directory run
```code
./delete-flux.sh
```
For Azure you also need delete PV with kubectl:
```code
kubectl delete pv -all -n hpcc-systems
```




