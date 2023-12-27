## 0.0.1

Initial release of Paw library

- `info` to log informational messages
- `warn` to log warning messages
- `debug` to log various data objects
- `error` to log errors with message with optional error and stacktrace

## 0.0.2

- Fixed issues to improve pub score, more details [here](https://github.com/AdityaMotale/paw/issues/1)
- Improved documentation for better usability, more details [here](https://github.com/AdityaMotale/paw/issues/2)

## 0.0.3

Major Changes and Improvements:

- **Introduced Non-Singleton Paw Class**: The `Paw` class is no longer a singleton. Users can now create separate instances of `Paw` for different parts of their application or in different libraries, thus avoiding the issues caused by shared instances.
- **Enhanced PawInterface for Custom Logger Implementations**: The `PawInterface` has been introduced to provide more flexibility. Users can extend this interface to create custom loggers, allowing for more advanced and tailored logging solutions.

Breaking Changes:

- Removal of Paw.init() Singleton Initialization:

  - The `Paw.init()` method, which was previously used to initialize a singleton instance of `Paw`, has been removed.
  - Users should now create instances of `Paw` using its constructor, which allows for independent logger instances.

- Updated Usage Pattern:

  - The way `Paw` is used in the application has changed. Instead of accessing a singleton instance, users should create and manage their own instances of `Paw`.
  - This change might require refactoring in existing codebases where `Paw.init()` was used.

Migration Guide:

1. Replacing Singleton Usage:

   - Wherever `Paw.init()` was used, replace it with `Paw()` constructor to create a new instance.
   - Ensure that each part of the application or library that requires logging has its own `Paw` instance.

2. Adopting `PawInterface`:

   - For advanced logging needs, extend `PawInterface` to create a custom logger.
   - Implement the required methods and add custom functionality as needed.

For more details refer [here](https://github.com/AdityaMotale/paw/issues/3)
