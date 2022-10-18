#!/usr/bin/env bash
set -euo pipefail
source "bach.sh"

src=$(realpath "$(dirname $0)/..")

test-copy-network-config() {
    @mocktrue test -d /etc/NetworkManager/system-connections
    @mocktrue test -d /target//etc/NetworkManager/system-connections

    @run "$src/10_copy_network_config"
}

test-copy-network-config-assert() {
    cp -anr /etc/NetworkManager/system-connections/. /target//etc/NetworkManager/system-connections
}

test-missing-network-source-config() {
    @mockfalse test -d /etc/NetworkManager/system-connections
    @mocktrue test -d /target//etc/NetworkManager/system-connections

    @run "$src/10_copy_network_config"
}

test-missing-network-source-config-assert() {
    @do-nothing
}

test-missing-network-target-config() {
    @mocktrue test -d /etc/NetworkManager/system-connections
    @mockfalse test -d /target//etc/NetworkManager/system-connections

    @run "$src/10_copy_network_config"
}

test-missing-network-target-config-assert() {
    @do-nothing
}
