#!/bin/bash
[ -z "$DOCKER_PATH" ] && echo "DOCKER_PATH is not set, exiting..." && exit 1
[ -z "$DOCKER_IMAGE_NAME" ] && echo "DOCKER_IMAGE_NAME is not set, using name 'iigb-deployer' as image name" && \
     DOCKER_IMAGE_NAME=dit

IIGB_BUILD=`date +%s`

DOCKER_IMAGE="$DOCKER_IMAGE_NAME-deployer"

echo "Attempting to delete previous run image if available"

$DOCKER_PATH rmi -f $DOCKER_IMAGE || echo "No image found from previous build"

$DOCKER_PATH images && \
$DOCKER_PATH build --force-rm -t $DOCKER_IMAGE $PWD  && \
$DOCKER_PATH run --rm -i --name $DOCKER_IMAGE -e IIGB_BUILD=$IIGB_BUILD -e BUCKET=$BUCKET -e DID=$DID -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY -e GIT_ACCESS_TOKEN=$GIT_ACCESS_TOKEN -e NO_ROBOTS=$NO_ROBOTS -e NO_CACHE=$NO_CACHE $DOCKER_IMAGE /bin/bash -c "npm run deploy"

result=$?

$DOCKER_PATH images && \
$DOCKER_PATH rmi --force $DOCKER_IMAGE

if [ $result -ne 0 ]; then
     echo "Deployment failed!! See above for error details"
     exit 1
fi
