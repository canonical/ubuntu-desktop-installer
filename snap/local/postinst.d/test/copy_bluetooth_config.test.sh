#!/usr/bin/env bash
set -euo pipefail
source "bach.sh"

src=$(realpath "$(dirname $0)/..")

test-copy-bluetooth-config() {
    @mocktrue [ -d /var/lib/bluetooth ]

    @run "$src/10_copy_bluetooth_config"
}

test-copy-bluetooth-config-assert() {
    rm -rf /target//var/lib/bluetooth
    cp -a /var/lib/bluetooth /target//var/lib/bluetooth
}

test-missing-bluetooth-config() {
    @mockfalse [ -d /var/lib/bluetooth ]

    @run "$src/10_copy_bluetooth_config"
}

test-missing-bluetooth-config-assert() {
    @do-nothing
}
