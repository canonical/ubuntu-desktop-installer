# Ubuntu Desktop Installer

[![CI](https://github.com/canonical/ubuntu-desktop-installer/workflows/Flutter%20CI/badge.svg)](https://github.com/canonical/ubuntu-desktop-installer/actions)
[![codecov](https://codecov.io/gh/canonical/ubuntu-desktop-installer/branch/main/graph/badge.svg)](https://codecov.io/gh/canonical/ubuntu-desktop-installer)

This project is a modern implementation of the Ubuntu Desktop installer, using [subiquity](https://github.com/canonical/subiquity) as a backend and [Flutter](https://flutter.dev/) for the UI.

![Preview Screenshot](.github/docs/images/preview_screenshot.png)

## Availability and release

Ubuntu Desktop Installer will replace Ubiquity as the default installer starting from Ubuntu Desktop 23.04 (Lunar Lobster).

Ubuntu Desktop Installer was originally planned to ship with Ubuntu Desktop LTS 22.04 Jammy Jellyfish, however given that the new installer needs to exceed Ubiquity in terms of features and stability, the plan is now to mature the installer in 23.04 and 23.10 before it is ready for the 24.04 LTS.

## Test a live image

If you want to test the new installer before 23.04 goes live, you can download a daily preview image below and install it for example in a virtual machine:

[Download](https://cdimage.ubuntu.com/daily-live/current/)


## Building and running manually

If you prefer to build and run the installer from source you need to install Flutter.

### Either: Install Flutter with Snapd

```
sudo snap install flutter --classic
```

### Or: Install Flutter manually

Please follow the [official Linux setup instructions from flutter.dev](https://flutter.dev/docs/get-started/install/linux) to install Flutter and its dependencies for the Linux desktop support manually.

### Download and build the Ubuntu Desktop installer

Grab the source:
```sh
git clone https://github.com/canonical/ubuntu-desktop-installer.git
cd ubuntu-desktop-installer
git submodule update --init --recursive
```

Install Subiquity dependencies:
```sh
make -C packages/subiquity_client/subiquity install_deps
```

### Run the installer

Run the installer either from within your IDE or by running the following command:

```sh
cd packages/ubuntu_desktop_installer
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
