# Ubuntu Desktop Installer

[![CI](https://github.com/canonical/ubuntu-desktop-installer/workflows/Flutter%20CI/badge.svg)](https://github.com/canonical/ubuntu-desktop-installer/actions)
[![codecov](https://codecov.io/gh/canonical/ubuntu-desktop-installer/branch/main/graph/badge.svg)](https://codecov.io/gh/canonical/ubuntu-desktop-installer)

This project is a modern implementation of the Ubuntu Desktop installer, using [subiquity](https://github.com/canonical/subiquity) as a backend and [Flutter](https://flutter.dev/) for the UI.

![Preview Screenshot](.github/docs/images/preview_screenshot.png)

## Availability and release

Ubuntu Desktop Installer replaced [Ubiquity](https://launchpad.net/ubiquity) as the default installer starting from [Ubuntu Desktop 23.04 (Lunar Lobster)](https://ubuntu.com/blog/ubuntu-desktop-23-04-release-roundup).

[![The New Ubuntu Installer | 23.04 Lunar Lobster](https://img.youtube.com/vi/oqohY6wKtcs/0.jpg)](https://www.youtube.com/watch?v=oqohY6wKtcs)

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
make install_deps
```

### Dry-run the installer

Run the installer in dry-run mode either from within your IDE or by running the
following command:

```sh
cd packages/ubuntu_desktop_installer
flutter run
```

## Contributing

See our [contributor guidelines](CONTRIBUTING.md).

## License

The Ubuntu Desktop Installer is licensed under the [GNU General Public License version 3](LICENSE).
