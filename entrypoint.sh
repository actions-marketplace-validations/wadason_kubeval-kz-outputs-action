#!/usr/bin/env bash

set -e
set -o pipefail

KUSTOMIZE_VERSION=$3
echo "==> Downloading kubeval ${KUSTOMIZE_VERSION} ..."
curl -sL https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv${KUSTOMIZE_VERSION}/kustomize_v${KUSTOMIZE_VERSION}_linux_amd64.tar.gz | \
  tar xz && \
  mv kustomize /usr/local/bin/kustomize && \
  kustomize version

KUBEVAL_VERSION=$4
echo "==> Downloading kubeval ${KUBEVAL_VERSION} ..."
curl -sL https://github.com/instrumenta/kubeval/releases/download/${KUBEVAL_VERSION}/kubeval-linux-amd64.tar.gz | \
  tar xz && \
  mv kubeval /usr/local/bin/kubeval && \
  kubeval --version

echo ""
echo "==> Checking your k8s manifest ..."
echo ""
bash -c "/check.sh"
