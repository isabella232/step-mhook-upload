#!/bin/bash

UPLOAD_LATEST_FLAG=""
if [ -n "$WERCKER_MHOOK_UPLOAD_USE_LATEST" ]; then
    UPLOAD_LATEST_FLAG="--latest"
fi

curl -o mhook https://s3.amazonaws.com/wercker-development/mhook/master/latest/linux_amd64/build
chmod +x mhook

./mhook upload \
    --bucket $WERCKER_MHOOK_UPLOAD_BUCKET \
    --project $WERCKER_GIT_REPOSITORY \
    --branch $WERCKER_GIT_BRANCH
    --commit $WERCKER_GIT_COMMIT \
    $UPLOAD_LATEST_FLAG \
    $WERCKER_MHOOK_UPLOAD_SOURCE \
    $WERCKER_MHOOK_UPLOAD_PREFIX
