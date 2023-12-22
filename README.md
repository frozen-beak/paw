# PAW 🐾

[![pub package](https://img.shields.io/pub/v/paw.svg?logo=dart&logoColor=00b9fc)](https://pub.dev/packages/paw)
[![CI](https://img.shields.io/github/actions/workflow/status/AdityaMotale/paw/unit_tests.yaml?branch=main&logo=github-actions&logoColor=white)](https://github.com/AdityaMotale/paw/actions)
[![Last Commits](https://img.shields.io/github/last-commit/AdityaMotale/paw?logo=git&logoColor=white)](https://github.com/AdityaMotale/paw/commits/main)
[![Pull Requests](https://img.shields.io/github/issues-pr/AdityaMotale/paw?logo=github&logoColor=white)](https://github.com/AdityaMotale/paw/pulls)
[![Code size](https://img.shields.io/github/languages/code-size/AdityaMotale/paw?logo=github&logoColor=white)](https://github.com/AdityaMotale/paw)
[![License](https://img.shields.io/github/license/AdityaMotale/paw?logo=open-source-initiative&logoColor=green)](https://github.com/AdityaMotale/paw/blob/main/LICENSE)

Paw is a compact, well-organized, and user-friendly logging tool for your apps. It's designed to log
your code's journey with structure and clarity, leaving a trace of each step like a paw print.

## Features:

- Easy to integrate and use in any Dart or Flutter project.
- Customizable log levels for better control and clarity.
- Lightweight design with a focus on performance.

### Quick Links:

- [Getting Started](#getting-started)
- [Documentation](#documentation)
- [Showcase/Output](#outputs)
- [Contributing](#contributing)
- [GitHub Repository](https://github.com/AdityaMotale/paw)

## Getting Started

Let's get started with Paw!

### Installation

You can directly install it by adding `paw: ^0.0.2` to your _pubspec.yaml_ dependencies section.

You can also add 🐾 to your project by executing,

- Flutter - `flutter pub add paw`
- Dart - `dart pub add paw`

### Setup

To start using Paw in your project first initialize it at the root of your project.

```dart
// Initialize Paw logger at the root of your project
Paw.init(
 name: "myApp",
 maxStackTraces: 5,
 shouldPrintName: true,
 shouldPrintLogs: true,
 shouldIncludeSourceInfo: false,
);
```

That's all! You're good to go to use _paw_ in your apps. Refer to [docs](#documentation) for more info.

## Outputs

Paw provides clear and organized log outputs, making debugging and monitoring an easy task. Here's
an example of what Paw's outputs look like:

![Paw Showcase](./assets/paw_showcase.png)

## Documentation

Also have in depth look at all the public [API references](https://pub.dev/documentation/paw/latest/paw/Paw-class.html#instance-methods)

### `Paw`

`Paw` is a singleton class. Initialize this class at the root of your application and use its
instance anywhere in your code.

```dart
Paw.init({...});
```

Initialization Parameters:

- `name`: The name of your application. Used for better identification in logs. Default is _"paw"_
- `maxStackTraces`: Maximum number of stack traces to log. Useful for in-depth debugging. Default is _5_
- `shouldPrintName`: Determines if the app name should be included in each log. Default is _true_
- `shouldPrintLogs`: Toggle to enable or disable log printing. Default is _true_
- `shouldIncludeSourceInfo`: Include source file and line number information in logs. Default is _true_

### Log Methods

#### `info`

Log informational messages. Ideal for general app behaviors and states.

```dart
Paw().info('This is an informational message');
```

#### `warn`

Log warnings. Use this for non-critical issues that should be noted.

```dart
Paw().warn('This is a warning message');
```

#### `debug`

Log debugging information. Essential for troubleshooting and understanding complex flows.

```dart
Paw().debug({'key': 'value', 'count': 42});
```

#### `error`

Log errors with detailed information, including error objects and stack traces. Critical for error tracking.

```dart
try {
  // Code that might throw an error
} catch (e, stackTrace) {
  Paw().error('An unexpected error occurred', error: e, stackTrace: stackTrace);
}
```

## Contributing

We welcome contributions! If you'd like to improve _Paw_, please open an issue or an PR with your suggested changes on this [repo](https://github.com/AdityaMotale/paw). Happy Coding 🐾!
