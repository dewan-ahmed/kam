#!/bin/sh

# fail if some commands fails
set -e
# show commands
set -x

export CI="prow"
make prepare-test-cluster
make bin

INSTALL_ARGOCD="./scripts/install-argocd.sh"
sh $INSTALL_ARGOCD

export PATH="$PATH:$(pwd)/bin"
export ARTIFACTS_DIR="/tmp/artifacts"
export CUSTOM_HOMEDIR=$ARTIFACTS_DIR

kam version
