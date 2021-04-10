#!/bin/sh

path=$(realpath "$(dirname $0)/..")

(cd $path && dart run build_runner build --delete-conflicting-outputs)
