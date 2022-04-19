#!/usr/bin/env bash
docker login --username ${INPUT_DOCKER_USERNAME} --password ${INPUT_DOCKER_PASSWORD}
if docker pull ${INPUT_DOCKER_ORG}/${INPUT_DOCKER_IMAGE}:${INPUT_DOCKER_TAG} > /dev/null; then
else
  docker build -t ${INPUT_DOCKER_ORG}/${INPUT_DOCKER_IMAGE}:${INPUT_DOCKER_TAG} ${INPUT_DOCKER_FILE_LOCATION}
  docker push ${INPUT_DOCKER_ORG}/${INPUT_DOCKER_IMAGE}:${INPUT_DOCKER_TAG}
fi