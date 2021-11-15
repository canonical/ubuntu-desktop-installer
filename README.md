# Ubuntu Desktop Installer

[![CI](https://github.com/canonical/ubuntu-desktop-installer/workflows/Flutter%20CI/badge.svg)](https://github.com/canonical/ubuntu-desktop-installer/actions)
[![codecov](https://codecov.io/gh/canonical/ubuntu-desktop-installer/branch/main/graph/badge.svg)](https://codecov.io/gh/canonical/ubuntu-desktop-installer)

This project is a modern implementation of the Ubuntu Desktop installer, using [subiquity](https://github.com/canonical/subiquity) as a backend and [Flutter](https://flutter.dev/) for the UI.

![Preview Screenshot](.github/docs/images/preview_screenshot.png)

## Availability

The new Ubuntu Desktop installer is *planned* to ship with the next Ubuntu Desktop LTS 22.04 Jammy Jellyfish.

## Test the new Ubuntu Desktop installer

If you want to test the new installer before 22.04 goes live, you can download a preview canary image below and install it for example in a virtual machine:

[Download](https://cdimage.ubuntu.com/daily-canary/current/)


## Building and running manually

Please follow the [official Linux setup instructions from flutter.dev](https://flutter.dev/docs/get-started/install/linux) to install Flutter on your computer.

### Configure Flutter

You need to activate the linux desktop support in the flutter SDK.
To do so, run the following commands:

```
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
