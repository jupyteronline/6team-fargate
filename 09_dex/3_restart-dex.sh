#!/bin/bash

# Restart Dex to pick up the changes in the ConfigMap
kubectl rollout restart deployment dex -n auth
