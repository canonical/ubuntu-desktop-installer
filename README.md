# Ubuntu Desktop Installer

[![CI](https://github.com/canonical/ubuntu-desktop-installer/workflows/Flutter%20CI/badge.svg)](https://github.com/canonical/ubuntu-desktop-installer/actions)
[![codecov](https://codecov.io/gh/canonical/ubuntu-desktop-installer/branch/main/graph/badge.svg)](https://codecov.io/gh/canonical/ubuntu-desktop-installer)

This project is a modern implementation of the Ubuntu Desktop installer, using [subiquity](https://github.com/canonical/subiquity) as a backend and [Flutter](https://flutter.dev/) for the UI.

![Preview Screenshot](.github/docs/images/preview_screenshot.png)

## Availibilty

The new Ubuntu Desktop installer is *planed* to ship with the next Ubuntu Desktpo LTS 22.04 Impish Idri.

## Test the new Ubuntu Desktop installer

If you want to test the new installer before 22.04 goes live, you can download a preview canary image below and install it for example in a virtual machine:

[Download](http://cdimage.ubuntu.com/impish/daily-canary/current/)


## Building and running manually

To build the installer manually you need to have the [Flutter UI toolkit](https://flutter.dev) installed and the source code in this repository downloaded on your computer.

To install Flutter you have two options: a manual installation by cloning the flutter repo and adding it tou your $PATH or installing the Flutter snap.

### Either: Install Flutter manually

Install the Flutter dependencies:
```sh
sudo apt install git curl cmake meson clang cmake pkg-config libgtk-3-dev
```
Install Flutter:
```sh
mkdir ~/development
cd ~/development
git clone https://github.com/flutter/flutter.git -b master
echo 'export PATH="$PATH:$HOME/development/flutter/bin"' >> ~/.bashrc
```

### Or: Install Flutter with Snapd

```
sudo snap install flutter --classic
```

### Configure Flutter

In any case you need to activate the linux desktop support in the flutter SDK.
To do so, run the following commands:

```
flutter upgrade
flutter config --enable-linux-desktop
```

### Download and build the Ubuntu Desktop installer

Grab the source:
```sh
git clone https://github.com/canonical/ubuntu-desktop-installer.git
cd ubuntu-desktop-installer
git submodule update --init --recursive
```

Install the Python (subitquity), Dart and Flutter dependencies:
```sh
cd packages/subiquity_client
dart pub get
cd subiquity
make install_deps
cd ../../udev/
flutter pub get
cd ../ubuntu_wsl_setup/
flutter pub get
cd ../ubuntu_wizard/
flutter pub get
cd ../logger/
flutter pub get
cd ../ubuntu_desktop_installer
flutter pub get
```

### Run the installer

Run the installer either from within your IDE or by running the following command:

```sh
flutter run
```

If you want to test a dedicated page you can run the installer with the argument `-a "--initial-route=/[ROUTE_NAME]"`

For example

```
flutter run -a "--initial-route=/welcome"
```

### Run live installer

In one terminal run:
```sh
cd /path/to/ubuntu-desktop-installer/packages/subiquity_client/subiquity
sudo python3 -m subiquity.cmd.server
```

In another terminal run:
```sh
cd /path/to/ubuntu-desktop-installer/packages/ubuntu_desktop_installer
LIVE_RUN=1 flutter run
```

## Contributing

See our [contributor guidelines](CONTRIBUTING.md).

## License

The Ubuntu Desktop Installer is licensed under the [GNU General Public License version 3](LICENSE).
