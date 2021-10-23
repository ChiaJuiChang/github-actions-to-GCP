#!/bin/bash

set -ex

REVISION_ID="$(git log -1 --format=%H)"
SH_DIR="$(cd "$(dirname "$0")"; pwd -P)"
ROOT_DIR="$(dirname $SH_DIR)"
BUILD_DIR="${ROOT_DIR}/build"
DOCKERFILE="${BUILD_DIR}/Dockerfile"

source ${BUILD_DIR}/build-image.properties

docker build \
  --build-arg REVISION_ID=${REVISION_ID} \
  --tag ${IMAGE_NAME} \
  --file ${DOCKERFILE} \
  ${ROOT_DIR}