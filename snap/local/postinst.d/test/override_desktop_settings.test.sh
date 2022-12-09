#!/usr/bin/env bash
set -euo pipefail
source "bach.sh"

src=$(realpath "$(dirname $0)/..")

test-override-desktop-settings() {
    @mockfalse [ ! -d /usr/share/glib-2.0/schemas ]
    @mockfalse [ ! -d /target//usr/share/glib-2.0/schemas ]
    @mocktrue id ubuntu
    @mock tee /target//usr/share/glib-2.0/schemas/20_ubuntu-desktop-installer-a11y.gschema.override

    @mockfalse [ -s /target//usr/share/glib-2.0/schemas/20_ubuntu-desktop-installer-a11y.gschema.override ]
    @mockfalse [ -s /target//usr/share/glib-2.0/schemas/20_ubuntu-desktop-installer-interface.gschema.override ]
    @mockfalse [ -s /target//usr/share/glib-2.0/schemas/20_ubuntu-desktop-installer-input-sources.gschema.override ]
    @mockfalse [ -s /target//usr/share/glib-2.0/schemas/20_ubuntu-desktop-installer-peripherals.gschema.override ]

    @mocktrue [ -s /target//usr/share/glib-2.0/schemas/20_ubuntu-desktop-installer-wm.gschema.override ]

    @run "$src/10_override_desktop_settings"
}

test-override-desktop-settings-assert() {
    sudo -u ubuntu dconf dump /org/gnome/desktop/a11y/
    sed -i -E "s/^\[([^/]*)\]/\[org.gnome.desktop.a11y.\1\]/g" /target//usr/share/glib-2.0/schemas/20_ubuntu-desktop-installer-a11y.gschema.override
    sed -i -E "s/^\[\/\]$/\[org.gnome.desktop.a11y\]/g" /target//usr/share/glib-2.0/schemas/20_ubuntu-desktop-installer-a11y.gschema.override
    rm /target//usr/share/glib-2.0/schemas/20_ubuntu-desktop-installer-a11y.gschema.override

    sudo -u ubuntu dconf dump /org/gnome/desktop/interface/
    tee /target//usr/share/glib-2.0/schemas/20_ubuntu-desktop-installer-interface.gschema.override
    sed -i -E "s/^\[([^/]*)\]/\[org.gnome.desktop.interface.\1\]/g" /target//usr/share/glib-2.0/schemas/20_ubuntu-desktop-installer-interface.gschema.override
    sed -i -E "s/^\[\/\]$/\[org.gnome.desktop.interface\]/g" /target//usr/share/glib-2.0/schemas/20_ubuntu-desktop-installer-interface.gschema.override
    rm /target//usr/share/glib-2.0/schemas/20_ubuntu-desktop-installer-interface.gschema.override

    sudo -u ubuntu dconf dump /org/gnome/desktop/input-sources/
    tee /target//usr/share/glib-2.0/schemas/20_ubuntu-desktop-installer-input-sources.gschema.override
    sed -i -E "s/^\[([^/]*)\]/\[org.gnome.desktop.input-sources.\1\]/g" /target//usr/share/glib-2.0/schemas/20_ubuntu-desktop-installer-input-sources.gschema.override
    sed -i -E "s/^\[\/\]$/\[org.gnome.desktop.input-sources\]/g" /target//usr/share/glib-2.0/schemas/20_ubuntu-desktop-installer-input-sources.gschema.override
    rm /target//usr/share/glib-2.0/schemas/20_ubuntu-desktop-installer-input-sources.gschema.override

    sudo -u ubuntu dconf dump /org/gnome/desktop/peripherals/
    tee /target//usr/share/glib-2.0/schemas/20_ubuntu-desktop-installer-peripherals.gschema.override
    sed -i -E "s/^\[([^/]*)\]/\[org.gnome.desktop.peripherals.\1\]/g" /target//usr/share/glib-2.0/schemas/20_ubuntu-desktop-installer-peripherals.gschema.override
    sed -i -E "s/^\[\/\]$/\[org.gnome.desktop.peripherals\]/g" /target//usr/share/glib-2.0/schemas/20_ubuntu-desktop-installer-peripherals.gschema.override
    rm /target//usr/share/glib-2.0/schemas/20_ubuntu-desktop-installer-peripherals.gschema.override

    sudo -u ubuntu dconf dump /org/gnome/desktop/wm/
    tee /target//usr/share/glib-2.0/schemas/20_ubuntu-desktop-installer-wm.gschema.override
    sed -i -E "s/^\[([^/]*)\]/\[org.gnome.desktop.wm.\1\]/g" /target//usr/share/glib-2.0/schemas/20_ubuntu-desktop-installer-wm.gschema.override
    sed -i -E "s/^\[\/\]$/\[org.gnome.desktop.wm\]/g" /target//usr/share/glib-2.0/schemas/20_ubuntu-desktop-installer-wm.gschema.override
    # rm /target//usr/share/glib-2.0/schemas/20_ubuntu-desktop-installer-wm.gschema.override

    glib-compile-schemas /target//usr/share/glib-2.0/schemas
}

test-missing-source-schemas() {
    @mockfalse [ -d /usr/share/glib-2.0/schemas ]
    @mocktrue [ -d /target//usr/share/glib-2.0/schemas ]
    @mocktrue id ubuntu

    @run "$src/10_override_desktop_settings"
}

test-missing-source-schemas-assert() {
    @do-nothing
}

test-missing-target-schemas() {
    @mocktrue [ -d /usr/share/glib-2.0/schemas ]
    @mockfalse [ -d /target//usr/share/glib-2.0/schemas ]
    @mocktrue id ubuntu

    @run "$src/10_override_desktop_settings"
}

test-missing-target-schemas-assert() {
    @do-nothing
}
