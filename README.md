# Movie App

[![Ask DeepWiki](https://devin.ai/assets/askdeepwiki.png)](https://deepwiki.com/mariam2MOHMED/Movie_app)

A feature-rich movie browsing application built with Flutter. This project demonstrates modern app development practices, including Clean Architecture, BLoC for state management, and Firebase integration for user authentication and data persistence.

## Features

-   **User Authentication**: Secure registration and login using Firebase Authentication.
-   **Movie Discovery**: Browse through curated lists of Popular, New Releases, and Top-Rated movies.
-   **Detailed Movie Information**: View comprehensive details for each movie, including a synopsis, ratings, runtime, genres, and a list of similar movies.
-   **Personal Watchlist**: Add movies to a personal watchlist, powered by Cloud Firestore. Users can easily view and remove movies from their list.
-   **Advanced Search**: Find movies dynamically by title with a responsive search interface.
-   **Browse by Genre**: Discover movies categorized by different genres, each leading to a dedicated list of films.
-   **Trailer Playback**: Watch movie trailers directly within the app using the YouTube player.

## Architecture

This application is built following the principles of **Clean Architecture**, promoting a separation of concerns and creating a scalable and maintainable codebase. The project is divided into feature-based modules, each containing distinct layers:

-   **Data Layer**: Responsible for fetching data from remote sources (TMDB API, Firebase) and local sources. It contains repository implementations.
-   **Domain Layer**: Contains the core business logic, entities, and use cases. This layer is independent of the UI and data layers.
-   **Presentation Layer**: Handles the UI and state management. It uses the **BLoC (Business Logic Component)** pattern to separate UI from business logic, making the state of the application predictable and easy to manage.

Dependency injection is managed using the `get_it` package, which helps in decoupling the layers and managing dependencies efficiently.

## Tech Stack & Dependencies

-   **Core**: Flutter, Dart
-   **State Management**: `flutter_bloc`
-   **Backend & Database**: Firebase Authentication, Cloud Firestore
-   **Networking**: `dio` for making HTTP requests to the TMDB API.
-   **Dependency Injection**: `get_it`
-   **Asynchronous Programming**: `dartz` for functional error handling with `Either`.
-   **UI & Animations**:
    -   `flutter_screenutil`: For adapting UI to different screen sizes.
    -   `cached_network_image`: To cache network images.
    -   `carousel_slider`: For the popular movies slider on the home screen.
    -   `shimmer` & `loading_animation_widget`: For loading state indicators.
    -   `animate_do`: For simple UI animations.
-   **Video**: `youtube_player_flutter` for embedded video playback.

## Setup and Installation

### 1. Prerequisites

-   Flutter SDK installed.
-   An editor like VS Code or Android Studio.
-   A Firebase project.

### 2. Clone the Repository

```bash
git clone https://github.com/mariam2mohmed/Movie_app.git
cd Movie_app
```

### 3. Install Dependencies

```bash
flutter pub get
```

### 4. Firebase Setup

This project uses Firebase for authentication and the watchlist feature.

1.  Create a new project on the [Firebase Console](https://console.firebase.google.com/).
2.  Add an Android and/or iOS application to your Firebase project.
3.  Follow the setup instructions to download your configuration files:
    -   For Android, download `google-services.json` and place it in the `android/app/` directory.
    -   For iOS, download `GoogleService-Info.plist` and place it in the `ios/Runner/` directory.
4.  Enable **Email/Password** sign-in method in Firebase Authentication.
5.  Set up **Cloud Firestore** and ensure the security rules are configured for development.

### 5. API Key

The application uses **The Movie Database (TMDB) API**. The API key is currently stored in `lib/core/utils/app_constants.dart`. You should replace the placeholder with your own key from TMDB.

### 6. Run the Application

Connect a device or start an emulator and run the following command:

```bash
flutter run
