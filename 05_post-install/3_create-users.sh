#!/bin/bash

cat << EOF | kubectl apply -f -
---
apiVersion: kubeflow.org/v1beta1
kind: Profile
metadata:
  name: kubeflow-user
spec:
  owner:
    kind: User
    name: kubeflow-user@amazon.com
subjects:
  - properties:
      request.headers[kubeflow-userid]: kubeflow-user@amazon.com
---
EOF
