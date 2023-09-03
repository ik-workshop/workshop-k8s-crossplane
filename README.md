# Crossplane with Kind

Not clear how to create crossplane test environment, build and create packages. Let's try to simplify it.

---

![](https://img.shields.io/github/commit-activity/m/ik-workshop/workshop-blueprint)
![](https://img.shields.io/github/last-commit/ik-workshop/workshop-blueprint)
[![](https://img.shields.io/github/license/ivankatliarchuk/.github)](https://github.com/ivankatliarchuk/.github/LICENCE)
[![](https://img.shields.io/github/languages/code-size/ik-workshop/workshop-blueprint)](https://github.com/ik-workshop/workshop-blueprint)
[![](https://img.shields.io/github/repo-size/ik-workshop/workshop-blueprint)](https://github.com/ik-workshop/workshop-blueprint)
![](https://img.shields.io/github/languages/top/ik-workshop/workshop-blueprint?color=green&logo=markdown&logoColor=blue)

---

---

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
## Contents

- [Steps to create environment](#steps-to-create-environment)
  - [Deploy Kubernetes Cluster with `kind`](#deploy-kubernetes-cluster-with-kind)
- [Resources](#resources)
  - [Documentation](#documentation)
    - [Crossplane](#crossplane)
    - [Kind](#kind)
- [TODO](#todo)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

---

## Steps to create environment

### Deploy Kubernetes Cluster with `kind`

- [Kind Docs](https://kind.sigs.k8s.io/docs/user/quick-start/)

Install kind

```bash
$ brew install kind
$ kind --version
> kind version 0.20.0
```

Brew install did not work. As I'm using Rancher Desktop. Currently there is an [issue](https://github.com/kubernetes-sigs/kind/issues/3277) with latest kind version

```bash
$ go install sigs.k8s.io/kind@v0.19.0
```

Create a cluster

```bash
$ kind create cluster --config=config/kind/main.yaml
$ kind get clusters
> k8s-kind-local
$ kubectl cluster-info --context kind-local
$ kubectl config set-context kind-local --namespace default
$ k get pods -A
```

Tear down cluster

```bash
$ kind delete cluster -n local
```

### Install Crossplane

- Install [Crossplane](https://docs.crossplane.io/latest/software/install/)

```sh
$ helm repo add crossplane-stable https://charts.crossplane.io/stable
$ helm repo update
$ make upgrade-crossplane
$ kubectl config set-context kind-local --namespace crossplane-system
```

Current crossplane configuration can be found here

[crossplane helm chart](config/helm/crossplane)

#### Uninstall Crossplane

- Uninstall [Crossplane](https://docs.crossplane.io/v1.13/software/uninstall/) resources.

1. Remove all composite resource definitions
1. Remove all remaining managed resources
1. Remove all providers

```sh
$ kubectl get xrd
> compositepostgresqlinstances.database.example.org
$ kubectl delete xrd compositepostgresqlinstances.database.example.org
$ kubectl get managed
> bucket.s3.aws.upbound.io/crossplane-bucket-867737b10
$ kubectl delete bucket.s3.aws.upbound.io/crossplane-bucket-867737b10
$ kubectl get providers
> upbound-provider-aws
$ kubectl delete provider upbound-provider-aws
$ helm uninstall crossplane --namespace crossplane-system
$ kubectl get pods -n crossplane-system
```
### Install Crossplane AWS Provider (or any other)

### Build provider locally

- [Docs](https://github.com/crossplane-contrib/provider-aws/blob/master/INSTALL.md)
- [Push to Docker](https://hub.docker.com/repositories/cloudkats)

## Resources


### Documentation

#### Crossplane

- [Crossplane](https://docs.crossplane.io/)

- [Upbound: migration](https://docs.upbound.io/providers/migration/#migrating-from-community-to-official-providers)
- [Provider AWS: quick start](https://marketplace.upbound.io/providers/upbound/provider-aws/v0.40.0/docs/quickstart)
- [Provider: build a package](https://docs.crossplane.io/latest/concepts/packages/#building-a-package)
- [Crossplane provider configs](https://github.com/crossplane/crossplane/blob/1aa83092172bdf0d2ed64754d33517c612ff7368/design/one-pager-package-format-v2.md)

#### Kind

- [Kind](https://kind.sigs.k8s.io/docs/user/quick-start/)
- [Kind: sources](https://github.com/kubernetes-sigs/kind)
- [Kind configuration](https://medium.com/@talhakhalid101/creating-a-kubernetes-cluster-for-development-with-kind-189df2cb0792)
- [Kind: how to](https://docs.dapr.io/operations/hosting/kubernetes/cluster/setup-kind/)
- [Kind: create kubernetes cluster](https://blog.knoldus.com/how-to-create-kubernetes-cluster-with-kind/)
- [Kind: create kubernets cluster](https://cloudyuga.guru/hands_on_lab/kind-k8s)

<!-- resources -->
[template.generate]: https://github.com/ik-workshop/workshop-blueprint/generate
[code-style.badge]: https://img.shields.io/badge/code_style-prettier-ff69b4.svg?style=flat-square

## TODO

- [] ContainerD `nerdctl info`
