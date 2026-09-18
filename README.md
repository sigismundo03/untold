# Flutter Streaming App

Flutter streaming application focused on authentication, user profiles and video content, built with a layered structure and repository abstractions.

This repository is part of my public mobile portfolio and highlights practical use of Flutter, state management, dependency injection, REST integration, Firebase services and automated tests.

## Tech stack

- **Flutter / Dart**
- **MobX** for state management
- **GetIt** for dependency injection
- **Dio** for HTTP communication
- **Firebase Auth** and **Google Sign-In**
- **Cloud Firestore**
- **SharedPreferences** for local persistence
- **video_player** for media playback
- **Mocktail** and **flutter_test** for automated tests
- **build_runner / json_serializable** for code generation

## Main flows

The current codebase includes flows for:

- authentication with e-mail and Google;
- sign up and password recovery;
- onboarding;
- profile viewing and editing;
- password change and account actions;
- video playback;
- comments and reactions;
- content retrieval through API and Firestore.

## Project organization

```text
lib/
├── data/
│   ├── model/
│   ├── repositories/
│   └── services/
├── domain/
│   └── model/
├── routing/
├── ui/
│   ├── core/
│   ├── home/
│   ├── login/
│   ├── onboarding/
│   ├── profile/
│   ├── sign_up/
│   └── video_app/
├── utils/
└── main.dart
```

### Data layer

Contains API clients, persistence helpers and repository implementations. Repository interfaces help keep external services separated from presentation code.

### Domain

Contains the models shared by the application's business and presentation flows.

### UI

Screens and view models are organized by feature. MobX is used to represent state and react to changes in the UI.

### Dependency injection

Application dependencies are registered centrally with GetIt, including repositories, services and view models.

## Automated tests

The repository contains unit tests for authentication behavior using mocks for Firebase Auth, Google Sign-In, the API client and local persistence.

Run the test suite with:

```bash
flutter test
```

Run static analysis with:

```bash
flutter analyze
```

## Continuous Integration

The repository includes a GitHub Actions workflow that installs Flutter dependencies, runs static analysis and executes the automated test suite on pushes and pull requests.

## Running locally

### Requirements

- Flutter SDK compatible with Dart `^3.6.1`
- Android Studio, VS Code or another Flutter-compatible IDE
- A configured Android/iOS device or emulator
- Firebase configuration for the target platform

### Setup

```bash
git clone https://github.com/sigismundo03/untold.git
cd untold
flutter pub get
flutter run
```

Some application flows depend on external Firebase/API configuration and may require environment-specific setup.

## Engineering topics demonstrated

- asynchronous programming with Dart;
- repository abstractions;
- REST API integration;
- authentication flows;
- local persistence;
- dependency injection;
- reactive state management;
- testing with mocks and fakes;
- separation between data and presentation concerns;
- Git-based development workflow.

## Author

**Sigismundo Barbosa dos Santos**  
Flutter Software Engineer / Mobile Developer

- [LinkedIn](https://www.linkedin.com/in/sigismundo-santos/)
- [GitHub](https://github.com/sigismundo03)
