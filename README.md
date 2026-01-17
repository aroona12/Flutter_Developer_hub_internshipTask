# Developer Hub Flutter Tasks (Week 4–6)

## 📱 Project Overview
This Flutter project is developed as part of **Developer Hub Internship Tasks (Weeks 4–6)**.  

The project demonstrates **advanced Flutter concepts**, including:
- API integration and networking
- Firebase Authentication and Firestore database
- State management using Provider
- Dynamic UI updates, error handling, and basic animations

By the end of Week 6, the project provides a **fully functional application** with:
- User authentication
- Profile management
- Task management
- Real-time UI updates

---

## 🟦 Week 4: API Integration & Networking

### 🔹 Learning Focus
- Fetching data from RESTful APIs using `http` package
- Parsing JSON responses
- Displaying dynamic data using `ListView`
- Handling errors and showing loading indicators

### 🔹 Implemented Features
- **User List Screen**
  - Fetch users from JSONPlaceholder API
  - Display user name, email, and profile picture
  - Loading spinner while fetching data
  - Error messages for failed network requests
- **User Profile Screen**
  - Shows detailed user information including name, email, and profile picture

---

## 🟦 Week 5: Firebase Authentication & Firestore

### 🔹 Learning Focus
- Firebase setup for Flutter
- Firebase Authentication (Email/Password)
- Cloud Firestore database integration

### 🔹 Implemented Features
- **Login & Signup Screens**
  - Email/password authentication
  - Form validation and error handling
  - Navigation to Profile Screen after successful login/signup
- **Profile Screen with Firestore**
  - Stores user data (name and email) in Firestore
  - Fetches and displays user profile data in real time

---

## 🟦 Week 6: State Management with Provider

### 🔹 Learning Focus
- Implementing Provider for reactive state management
- Optimizing performance and app architecture
- Adding basic UI animations

### 🔹 Implemented Features
- **Task Management App**
  - Add, update, and delete tasks
  - Real-time UI updates using Provider
  - Dynamic task list with checkbox for completion
- **UI Enhancements**
  - Custom Floating Action Button (FAB)
  - Simple animations for task add/delete
  - Optimized task list performance

---

## 🛠 Technologies Used
- Flutter (Stable Channel)
- Dart
- `http` (Networking)
- `provider` (State Management)
- `firebase_core` & `firebase_auth` (Authentication)
- `cloud_firestore` (Database)
- Material Design Widgets

## 🚀 How to Run the Project

### 1️⃣ Clone the repository

```bash
git clone <your-repo-url>
cd <project-folder>
````

### 2️⃣ Install Dependencies

```bash
flutter pub get
```

### 3️⃣ Firebase Setup

1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Create a new project
3. Register your app with **package name**: `com.example.task5`
4. Download `google-services.json`
5. Place it inside your project at: `android/app/`

### 4️⃣ Run the App

```bash
flutter run
```

> Make sure an Android device or emulator is connected.

### 5️⃣ Build APK (Optional)

```bash
flutter build apk --debug
```

---

## 📌 Key Learnings

* API integration and JSON parsing
* Firebase Authentication workflow
* Firestore database integration
* State management using Provider
* Error handling and loading indicators
* UI enhancements and basic animations
