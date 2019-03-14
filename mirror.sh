#!/bin/bash

gsutil cp -r gs://snap-kit-build/scsdk/ios/carthage/* .

SRC_HOST="storage.googleapis.com/snap-kit-build/scsdk/ios/carthage"
DEST_HOST="raw.githubusercontent.com/Snapchat/snap-kit-carthage/repo"

for x in `ls . | grep .json`; do
  sed -i.bak s/${SRC_HOST//\//\\\/}/${DEST_HOST//\//\\\/}/g $x
  rm $x.bak
done

