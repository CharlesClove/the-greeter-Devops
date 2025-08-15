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


 
#Here in future could be other commands needed for build process.
echo "Build script finished."
