# Ubuntu Desktop Installer

[![CI](https://github.com/canonical/ubuntu-desktop-installer/workflows/Flutter%20CI/badge.svg)](https://github.com/canonical/ubuntu-desktop-installer/actions)
[![codecov](https://codecov.io/gh/canonical/ubuntu-desktop-installer/branch/main/graph/badge.svg)](https://codecov.io/gh/canonical/ubuntu-desktop-installer)

This project is a modern implementation of the Ubuntu Desktop installer, using [subiquity](https://github.com/canonical/subiquity) as a backend and [Flutter](https://flutter.dev/) for the UI.

## Checkout & Run

Grab the source:
```sh
git clone https://github.com/canonical/ubuntu-desktop-installer.git
cd ubuntu-desktop-installer
git submodule update --init --recursive
```

Install and configure Flutter:
```sh
snap install flutter --classic
flutter channel dev
flutter upgrade
flutter config --enable-linux-desktop
```

Install dependencies:
```sh
cd packages/subiquity_client
dart pub get
cd subiquity
make install_deps
sudo apt install python3-curtin
cd ../../ubuntu_desktop_installer
flutter pub get
```

Run:
```sh
flutter run
```

## Run Live Installer

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
