#!/bin/bash

snap_local=$(cd "$(dirname "$0")/.." && pwd)
version="$1"

pushd /tmp > /dev/null
if [ -z "$version" ]; then
  curl -s -o releases_linux.json https://storage.googleapis.com/flutter_infra_release/releases/releases_linux.json
  base_url=$(cat releases_linux.json | jq -r '.base_url')
  stable=$(cat releases_linux.json | jq -r '.current_release' | jq '.stable')
  archive=$(cat releases_linux.json | jq -r --arg stable "$stable" '[.releases[] | select(.hash=='$stable')][0].archive')
  url=$base_url/$archive
else
  url=https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_$version-stable.tar.xz
fi

echo "Downloading $url"
curl -o flutter-stable.tar.xz $url
echo "Extracting shader_lib"
tar -xvf flutter-stable.tar.xz flutter/bin/cache/artifacts/engine/linux-x64/shader_lib
echo "Updating shader_lib"
rsync -avu --delete flutter/bin/cache/artifacts/engine/linux-x64/shader_lib $snap_local/flutter
popd  > /dev/null
