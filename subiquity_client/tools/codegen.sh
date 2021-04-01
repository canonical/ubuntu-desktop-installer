#!/bin/sh

path=$(realpath "$(dirname $0)/..")

(cd $path && flutter pub run build_runner build --delete-conflicting-outputs)
