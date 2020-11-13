#!/bin/bash

#kubectl get deployment -n kube-system alb-ingress-controller || \
#	kubectl delete -f https://raw.githubusercontent.com/kubernetes-sigs/aws-alb-ingress-controller/v1.1.8/docs/examples/alb-ingress-controller.yaml;
#        kubectl delete -f https://raw.githubusercontent.com/kubernetes-sigs/aws-alb-ingress-controller/v1.1.8/docs/examples/rbac-role.yaml

curl -o iam_policy_v1_to_v2_additional.json https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/main/docs/install/iam_policy_v1_to_v2_additional.json

aws iam create-policy \
  --policy-name AWSLoadBalancerControllerAdditionalIAMPolicy \
  --policy-document file://iam_policy_v1_to_v2_additional.json

aws iam attach-role-policy \
  --role-name eksctl-fargate-addon-iamserviceaccount-kube-Role1-NMFCGHHPE1O0 \
  --policy-arn= arn:aws:iam::004625312447:policy/AWSLoadBalancerControllerAdditionalIAMPolicy # if error, do perform in aws console
