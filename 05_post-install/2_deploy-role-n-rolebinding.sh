#!/bin/bash

cat << EOF | kubectl apply -f -
---
kind: Role
apiVersion: rbac.authorization.k8s.io/v1beta1
metadata:
  namespace: jih
  name: notebook-access
rules:
- apiGroups: ["*"] # "" indicates the core API group
  resources: ["*"]
  verbs: ["*"]
---
kind: RoleBinding
apiVersion: rbac.authorization.k8s.io/v1beta1
metadata:
  name: notebook-access-binding
  namespace: jih
subjects:
- kind: ServiceAccount
  name: default-editor
  namespace: jih
roleRef:
  kind: Role
  name: notebook-access
  apiGroup: rbac.authorization.k8s.io
---
EOF
