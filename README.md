# e-Doctor Mobile Application

A comprehensive telemedicine mobile application built with Flutter and C# backend.

## Quick Start

1. Install dependencies:
```bash
flutter pub get
```

2. Update API endpoint in `lib/data/services/api_service.dart`

3. Run the app:
```bash
flutter run
```

## Project Structure

- `/lib/core` - Core utilities and constants
- `/lib/data` - Data models, repositories, and services
- `/lib/presentation` - UI screens, widgets, and providers
- `/lib/config` - App configuration and theme

## Features

- User authentication (Login/Signup)
- Patient dashboard with doctor listings
- Book appointments
- Doctor dashboard with patient queue
- Admin/Super-admin management portal

## Setup Instructions

1. Ensure Flutter SDK is installed (version 3.0.0 or higher)
2. Run `flutter pub get` to install dependencies
3. Update the API base URL in `lib/data/services/api_service.dart`
4. For video calling features, add your Agora App ID in `lib/core/constants/api_constants.dart`
5. Run the app using `flutter run`

## User Roles

- **Patient**: Browse doctors, book appointments, video consultations
- **Doctor**: Manage patient queue, conduct consultations
- **Admin**: Manage doctors and patients
- **Super Admin**: Full platform management and analytics
