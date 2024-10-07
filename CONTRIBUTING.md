# Contributing to Zwiggy

First off, thank you for considering contributing to Zwiggy! It's people like you that make Zwiggy such a great tool. We welcome contributions from everyone.

The following is a set of guidelines for contributing to Zwiggy. These are mostly guidelines, not rules. Use your best judgment, and feel free to propose changes to this document in a pull request.

## Table of Contents

1. [How to Report a Bug](#how-to-report-a-bug)
2. [Feature Requests](#feature-requests)
3. [Setting Up the Development Environment](#setting-up-the-development-environment)
4. [Submitting a Pull Request](#submitting-a-pull-request)
5. [Code Review Process](#code-review-process)

## How to Report a Bug

We use GitHub issues to track bugs. If you discover a bug, please follow these steps:

1. Check if the bug has already been reported by searching on GitHub under [Issues](https://github.com/yazdanhaider/Food-Delivery/issues).
2. If you're unable to find an open issue addressing the problem, [open a new one](https://github.com/yazdanhaider/Food-Delivery/issues/new).
3. Use a clear and descriptive title for the issue to identify the problem.
4. Describe the exact steps which reproduce the problem in as much detail as possible.
5. Provide specific examples to demonstrate the steps. Include links to files or GitHub projects, or copy/pasteable snippets, which you use in those examples.
6. Describe the behavior you observed after following the steps and point out what exactly is the problem with that behavior.
7. Explain which behavior you expected to see instead and why.
8. Include screenshots and animated GIFs which show you following the described steps and clearly demonstrate the problem.

## Feature Requests

We're always looking for suggestions to improve our project. If you have an idea for a new feature:

1. Check if the feature has already been suggested by searching on GitHub under [Issues](https://github.com/yazdanhaider/Food-Delivery/issues).
2. If you don't find an existing suggestion, [open a new issue](https://github.com/yazdanhaider/Food-Delivery/issues/new).
3. Use a clear and descriptive title for the issue to identify the suggestion.
4. Provide a detailed description of the suggested enhancement, including specific use cases and potential implementation ideas if you have them.

## Setting Up the Development Environment

To set up your development environment for Zwiggy:

1. Fork the repository on GitHub.
2. Clone your forked repository to your local machine.
3. Install Flutter by following the [official installation guide](https://flutter.dev/docs/get-started/install).
4. Install dependencies by running `flutter pub get` in the project root directory.
5. Set up Firebase:
    - Create a new Firebase project in the [Firebase Console](https://console.firebase.google.com/).
    - Add an Android and iOS app to your Firebase project and follow the setup instructions.
    - Download the `google-services.json` (for Android) and `GoogleService-Info.plist` (for iOS) files and place them in the appropriate directories in your project.
6. Run the app using `flutter run`.

## Submitting a Pull Request

1. Create a new branch from `main` for your feature or bug fix.
2. Make your changes in your branch.
3. Follow the [Flutter style guide](https://github.com/flutter/flutter/wiki/Style-guide-for-Flutter-repo) in your code.
4. Add or update tests as necessary.
5. Ensure all tests pass by running `flutter test`.
6. Commit your changes using a descriptive commit message.
7. Push your branch to your fork on GitHub.
8. Create a pull request from your branch to the `main` branch of the original repository.
9. In the pull request description, clearly describe the problem and solution. Include the relevant issue number if applicable.

## Code Review Process

The core team looks at pull requests on a regular basis. After feedback has been given, we expect responses within two weeks. After two weeks, we may close the pull request if it isn't showing any activity.

1. At least one core team member must approve the pull request before it can be merged.
2. If changes are requested, make the required updates and push them to your branch.
3. If you disagree with a comment, feel free to reply with your reasoning.
4. Once approved, your pull request will be merged by a core team member.

Thank you for contributing to Zwiggy!