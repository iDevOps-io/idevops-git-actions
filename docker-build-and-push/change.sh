#!/usr/bin/env bash
function build_and_push {
  echo "Docker Wasn't Able to Pull Image With Tag. Build Tag Version and Push"
  echo "Build Dockerfile at path: ${INPUT_DOCKER_FILE_LOCATION}"
  echo "Docker Image: ${INPUT_DOCKER_ORG}/${INPUT_DOCKER_IMAGE}:${INPUT_DOCKER_TAG}"
  docker build -t ${INPUT_DOCKER_ORG}/${INPUT_DOCKER_IMAGE}:${INPUT_DOCKER_TAG} ${INPUT_DOCKER_FILE_LOCATION}
  docker push ${INPUT_DOCKER_ORG}/${INPUT_DOCKER_IMAGE}:${INPUT_DOCKER_TAG}
}
docker login --username ${INPUT_DOCKER_USERNAME} --password ${INPUT_DOCKER_PASSWORD}
docker pull ${INPUT_DOCKER_ORG}/${INPUT_DOCKER_IMAGE}:${INPUT_DOCKER_TAG} || build_and_push


