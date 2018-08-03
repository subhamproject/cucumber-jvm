#!/bin/bash

export PATH="$PATH:/usr/local/bin"
export USERID=$(id -u)
export GROUPID=$(id -g)
echo "Running as UID=$USERID, GID=$GROUPID"
cd $(dirname $0)
CONTAINER_NAME="builder-$(echo ${JOB_NAME} | tr '/ ' '._').${BRANCH_NAME}"
if [ -n "$CHANGE_ID" ]
then
    CONTAINER_NAME="${CONTAINER_NAME}-PR${CHANGE_ID}"
fi
CONTAINER_NAME="${CONTAINER_NAME}-${BUILD_ID}"


docker-compose -f test-bed.yml run --name maven-${BUILD_NUMBER} --rm -w "$WORKSPACE" --entrypoint "mvn package -DskipTests" maven-app-build
