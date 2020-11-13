#!/bin/bash

eksctl delete cluster -f cluster-fargate.yaml
#eksctl create fargateprofile --cluster aiplatform --name kubeflow --namespace kube-system
