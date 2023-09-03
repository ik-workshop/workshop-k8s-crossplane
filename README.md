# Workshop Blueprint

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
$ k get pods -A
```


Tear down cluster

```bash
$ kind delete cluster -n kind-local
```

## Resources


### Documentation

#### Crossplane

- [Crossplane](https://docs.crossplane.io/)

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
