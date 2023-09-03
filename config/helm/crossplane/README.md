# Crossplane

> Crossplane is a framework for building cloud native control planes without needing to write code. It has a highly extensible backend that enables you to build a control plane that can orchestrate applications and infrastructure no matter where they run, and a highly configurable frontend that puts you in control of the schema of the declarative API it offers.

----

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
## Contents

- [Provider Configuration](#provider-configuration)
- [Examples](#examples)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

----

- [Crossplane docs](https://crossplane.io/docs/v1.10.html)
- [Crossplane: provider-aws](https://github.com/crossplane-contrib/provider-aws)

## Provider Configuration

Each provider consists of at least 3 CRDs. Example for `provider-aws`:

- `pkg.crossplane.io/v1alpha1/ControllerConfig` controller configuration
- `pkg.crossplane.io/v1/Provider` requests from Crossplane to add/register a provider
- `aws.crossplane.io/v1beta1/ProviderConfig` configures how AWS controller will connect to AWS API

## Examples

- [Official examples](https://github.com/crossplane-contrib/provider-aws/tree/master/examples)
- [AWS Samples: crossplane gitops](https://github.com/aws-samples/eks-gitops-crossplane-argocd)
- [AWS Labs: crossplane on EKS](https://github.com/awslabs/crossplane-on-eks)
- [AWS Samples: eks flux](https://github.com/aws-samples/eks-gitops-crossplane-flux)
- [Crossplane Kubernetes](https://github.com/crossplane-contrib/provider-kubernetes/tree/main/examples/in-composition)
