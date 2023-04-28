# Ubuntu Desktop Installer

[![CI](https://github.com/canonical/ubuntu-desktop-installer/workflows/Flutter%20CI/badge.svg)](https://github.com/canonical/ubuntu-desktop-installer/actions)
[![codecov](https://codecov.io/gh/canonical/ubuntu-desktop-installer/branch/main/graph/badge.svg)](https://codecov.io/gh/canonical/ubuntu-desktop-installer)

This project is a modern implementation of the Ubuntu Desktop installer, using [subiquity](https://github.com/canonical/subiquity) as a backend and [Flutter](https://flutter.dev/) for the UI.

![Preview Screenshot](.github/docs/images/preview_screenshot.png)

## Availability and release

Ubuntu Desktop Installer replaced [Ubiquity](https://launchpad.net/ubiquity) as the default installer starting from [Ubuntu Desktop 23.04 (Lunar Lobster)](https://ubuntu.com/blog/ubuntu-desktop-23-04-release-roundup).

[![The New Ubuntu Installer | 23.04 Lunar Lobster](https://img.youtube.com/vi/oqohY6wKtcs/0.jpg)](https://www.youtube.com/watch?v=oqohY6wKtcs)

## Test a live image

If you want to test new installer in a live session, you can download the latest
[daily-live](https://cdimage.ubuntu.com/daily-live/current/) image and try it in
a virtual machine.

## Build and dry-run the installer

If you want to build and dry-run the installer in a local Ubuntu installation
for development or testing purposes without performing an actual installation,
follow these steps:

- [Install Flutter](https://flutter.dev/docs/get-started/install/linux)
- Fetch the source code
    ```sh
    git clone https://github.com/canonical/ubuntu-desktop-installer.git
    cd ubuntu-desktop-installer
    git submodule update --init --recursive
    ```
- Install dependencies:
    ```sh
    make install_deps
    ```
- Dry-run the installer either from within your IDE or by executing:
    ```sh
    cd packages/ubuntu_desktop_installer
    flutter run
    ```

## Contributing

See our [contributor guidelines](CONTRIBUTING.md).

## License

The Ubuntu Desktop Installer is licensed under the [GNU General Public License version 3](LICENSE).
