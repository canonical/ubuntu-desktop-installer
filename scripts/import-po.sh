#!/bin/bash

set -e

if [ $# -eq 0 ]; then
    echo "Usage: $(basename $0) dir1 dir2 ..."
    exit 1
fi

if ! dart --version >/dev/null 2>&1; then
    echo "Dart is not installed"
    exit 1
fi

project_dir=$(realpath $(dirname "$0")/..)
arbgen_dir="$project_dir/tool/arbgen"
arbgen_bin="$arbgen_dir/bin/arbgen.dart"

(cd "$arbgen_dir" && dart pub get)

# find dirs that contain .arb files
arb_dirs=$(find "$project_dir" -type f -name "*.arb" -exec dirname {} \; | uniq)
echo "Resolving ARB directories..."
for arb_dir in $arb_dirs; do
    # app_en.arb -> app, ubuntu_en.arb -> ubuntu
    prefix=$(basename $(find "$arb_dir" -name "*_en.arb") "_en.arb")
    echo "+ $(realpath $arb_dir --relative-to="$project_dir") ($prefix)"
done

for import_dir in "$@"; do
    if [ ! -d "$import_dir" ]; then
        echo "Error: $import_dir is not a directory"
        exit 1
    fi

    # find dirs that contain .po files
    po_dirs=$(find "$import_dir" -type f -name "*.po" -exec dirname {} \; | uniq)

    # import all .po dirs to all .arb dirs
    for po_dir in $po_dirs; do
        echo "Importing $(realpath "$po_dir" --relative-to="$import_dir")..."
        for arb_dir in $arb_dirs; do
            # app_en.arb -> app, ubuntu_en.arb -> ubuntu
            prefix=$(basename $(find "$arb_dir" -name "*_en.arb") "_en.arb")

            dart run "$arbgen_bin" "$po_dir" --verbose --prefix $prefix \
              --output "$(realpath $arb_dir --relative-to="$project_dir")" 
        done
    done
done

echo "Cleaning up ARB directories..."
# https://github.com/flutter/flutter/issues/92818
for arb_dir in $arb_dirs; do
    arb_files=$(find $arb_dir -name "*.arb")
    for arb_file in $arb_files; do
      lang=$(cut -d '_' -f 2 <<< $(basename "$arb_file" ".arb"))
      if [ ${#lang} -gt 2 ]; then
        echo "D $(realpath $arb_file --relative-to="$project_dir")"
        rm "$arb_file"
      fi
    done
done
