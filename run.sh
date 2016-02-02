#!/bin/bash

UPLOAD_LATEST_FLAG=""
if [ -n "$WERCKER_MHOOK_UPLOAD_USE_LATEST" ]; then
    UPLOAD_LATEST_FLAG="--latest"
fi

curl -o mhook https://s3.amazonaws.com/wercker-development/mhook/master/latest/linux_amd64/build
chmod +x mhook

if [ -z "$WERCKER_MHOOK_UPLOAD_BUCKET" ]; then
    fail 'missing or empty option bucket, please check wercker.yml'
fi

if [ -z "$WERCKER_MHOOK_UPLOAD_KEY_ID" ]; then
    fail 'missing or empty option key_id, please check wercker.yml'
fi

if [ -z "$WERCKER_MHOOK_UPLOAD_KEY_SECRET" ]; then
    fail 'missing or empty option key_secret, please check wercker.yml'
fi

export AWS_ACCESS_KEY_ID=$WERCKER_MHOOK_UPLOAD_KEY_ID
export AWS_SECRET_ACCESS_KEY=$WERCKER_MHOOK_UPLOAD_KEY_SECRET


./mhook upload \
    --bucket $WERCKER_MHOOK_UPLOAD_BUCKET \
    --project $WERCKER_GIT_REPOSITORY \
    --branch $WERCKER_GIT_BRANCH
    --commit $WERCKER_GIT_COMMIT \
    $UPLOAD_LATEST_FLAG \
    $WERCKER_MHOOK_UPLOAD_SOURCE \
    $WERCKER_MHOOK_UPLOAD_PREFIX
