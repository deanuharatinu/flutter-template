# flutter_template

Template for Flutter project to boost development from scratch.

## 🚀 Prerequisite

- [Flutter v3.24.0](https://docs.flutter.dev/get-started/install)
- [Dart v3.5.0](https://dart.dev/get-dart)

## Recommended VSCode Extensions

- [BLOC](https://marketplace.visualstudio.com/items?itemName=FelixAngelov.bloc)
- [Dart](https://marketplace.visualstudio.com/items?itemName=Dart-Code.dart-code)
- [Flutter](https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter)

## Setup Project

Run the following commands:

```
make project

```

## Project Overview

### UI Presentation

- BLOC

### Architecture Pattern

- Clean architecture
- Repository pattern

### Modularization Strategy

- Repository

### Mobile OS Version

- **Android** version 5.0 and later
- **iOS** version 11 and later

### Security
- Root & Jailbreak detection

## Environment Setup

### FVM (Flutter Version Management)

- [FVM](https://fvm.app/documentation/getting-started/installation) installation on local machine
- MacOS user, make sure to modify zsh environment to run `flutter` command as `fvm flutter`

```
sudo echo 'fvm flutter ${@:1}' > "<path_to_flutter>/bin flutter" && sudo chmod +x <path_to_flutter>/bin/flutter

sudo echo 'fvm dart ${@:1}' > "<path_to_flutter>/bin/dart" && sudo chmod +x <path_to_flutter>/bin/dart
```
