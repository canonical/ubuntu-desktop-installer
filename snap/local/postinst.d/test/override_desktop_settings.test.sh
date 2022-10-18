#!/usr/bin/env bash
set -euo pipefail
source "bach.sh"

src=$(realpath "$(dirname $0)/..")

test-override-desktop-settings() {
    @mocktrue test -d /usr/share/glib-2.0/schemas
    @mocktrue test -d /target//usr/share/glib-2.0/schemas
    @mocktrue id ubuntu
    @ignore sed

    @run "$src/10_override_desktop_settings"
}

test-override-desktop-settings-assert() {
    sudo -u ubuntu dconf dump /org/gnome/desktop/a11y/
    test -s /target//usr/share/glib-2.0/schemas/20_ubuntu-desktop-installer-a11y.gschema.override

    sudo -u ubuntu dconf dump /org/gnome/desktop/interface/
    test -s /target//usr/share/glib-2.0/schemas/20_ubuntu-desktop-installer-interface.gschema.override

    sudo -u ubuntu dconf dump /org/gnome/desktop/input-sources/
    test -s /target//usr/share/glib-2.0/schemas/20_ubuntu-desktop-installer-input-sources.gschema.override

    sudo -u ubuntu dconf dump /org/gnome/desktop/peripherals/
    test -s /target//usr/share/glib-2.0/schemas/20_ubuntu-desktop-installer-peripherals.gschema.override

    sudo -u ubuntu dconf dump /org/gnome/desktop/wm/
    test -s /target//usr/share/glib-2.0/schemas/20_ubuntu-desktop-installer-wm.gschema.override

    glib-compile-schemas /target//usr/share/glib-2.0/schemas
}

test-missing-source-schemas() {
    @mockfalse test -d /usr/share/glib-2.0/schemas
    @mocktrue test -d /target//usr/share/glib-2.0/schemas
    @mocktrue id ubuntu

    @run "$src/10_override_desktop_settings"
}

test-missing-source-schemas-assert() {
    @do-nothing
}

test-missing-target-schemas() {
    @mocktrue test -d /usr/share/glib-2.0/schemas
    @mockfalse test -d /target//usr/share/glib-2.0/schemas
    @mocktrue id ubuntu

    @run "$src/10_override_desktop_settings"
}

test-missing-target-schemas-assert() {
    @do-nothing
}
