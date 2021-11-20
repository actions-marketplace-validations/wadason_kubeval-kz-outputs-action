#!/usr/bin/env bash
set -e
set -o pipefail

for path in ${INPUT_PATHLIST//,/ }; do
  for env in ${INPUT_ENVLIST//,/ }; do
    echo "==> Check target path : ${path}/overlays/${env}"
    kustomize build ${path}/overlays/${env} | \
    kubeval --ignore-missing-schemas --force-color
  done
done