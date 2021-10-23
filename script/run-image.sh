#!/bin/bash

set -ex

REVISION_ID="$(git log -1 --format=%H)"
SH_DIR="$(cd "$(dirname "$0")"; pwd -P)"
ROOT_DIR="$(dirname $SH_DIR)"
BUILD_DIR="${ROOT_DIR}/build"
CONTAINER_NAME=simple-web
PORT=8080

source ${BUILD_DIR}/build-image.properties

docker run \
  -d \
  -p ${PORT}:${PORT} \
  --name ${CONTAINER_NAME} \
  ${IMAGE_NAME}
