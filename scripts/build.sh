#!/bin/bash
set -e #stop the script if error ever happens.

VERSION_FILE=$(find . -name VERSION) #Find VERSION FILE AND SET IT AS VARIABLE

if [[ -z "$VERSION_FILE" ]]; then  #CHECK IF VARIABLE IS EMPTY OR NOT
    echo "ERROR: version file was not found"
    exit 1
fi 

APP_VERSION=$(cat $VERSION_FILE | tr -d '[:space:]') #READ THE FILE, REMOVE WHITE CHARACTERS
echo "Building application version: $APP_VERSION"
echo "This is a placeholder for build process."

DOCKER_USERNAME="clovedockerhub"
IMAGE_NAME="${DOCKER_USERNAME}/the-greeter"

echo "Building docker image: ${IMAGE_NAME}:${APP_VERSION}"
docker build -t "${IMAGE_NAME}:${APP_VERSION}" .

echo "Tagging with latest..."
docker tag "${IMAGE_NAME}:${APP_VERSION}" "${IMAGE_NAME}:latest"

echo "Docker build complete. Run 'docker images' to see results."
 
#Here in future could be other commands needed for build process.
echo "Build script finished."
