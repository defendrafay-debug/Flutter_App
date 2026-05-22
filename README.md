# Flutter Multi-Screen Authentication & Course API Integration

## Student Information
* **Student Name:** Abdul Rafay
* **Student ID:** se221038
* **Submission Branch:** `feature-course-api-integration`

---

## Project Overview
This application is an extension of the previously completed Flutter multi-screen authentication application. While maintaining existing features like user registration, login authentication, form validation, and session persistence, this version integrates REST APIs to perform full CRUD (Create, Read, Update, Delete) operations for course management.

The project strictly follows a clean architecture style by separating UI screens, models, validators, controllers, and a dedicated service layer for API communication.

---

## New API & CRUD Features
In this extension, the application interacts with a remote REST API to manage course data dynamically:

1. **Fetch Courses (Read - GET):** Retrieves the course list from the API and displays the title, ID, and description in a clean list format with a loading indicator and proper error handling.
2. **Add Course (Create - POST):** Allows users to create a new course via a form, sending a POST request to the API and updating the UI dynamically.
3. **Update Course (Update - PUT/PATCH):** Edits existing course details by pre-filling the form with existing data and updating it via the API.
4. **Delete Course (Delete - DELETE):** Provides an option to delete a course, prompts the user with a confirmation dialog, and removes the item from the UI upon a successful API response.

### API Reference
* **API Used:** JSONPlaceholder API
* **Documentation Followed:** [JSONPlaceholder Guide](https://jsonplaceholder.typicode.com/guide)

---

## Architecture & State Handling
* **Separate Service Layer:** All network requests (`GET`, `POST`, `PUT`, `DELETE`) are encapsulated within a dedicated service file (`course_service.dart`), keeping the UI layers clean and decoupled from business/network logic.
* **State Management:** Explicit handling of `Loading`, `Success`, and `Error` states during API calls to ensure a smooth user experience.

---

## Existing Features
* **Authentication Screens:** User Registration & Login Screens.
* **Form Validation:** Real-time email format, password criteria, and confirm password matching.
* **Session Persistence:** "Remember Me" functionality using `SharedPreferences`.
* **UI Controls:** Show/hide password toggle, gender dropdown using enums.
* **Navigation:** Clean navigation paths with data passing between screens.

### Password Requirements
* Minimum 6 characters
* At least 1 uppercase letter
* At least 1 special character

---

## Application Screenshots

### 1. Authentication & Session
| Login Screen | Registration Screen |
|---|---|
| ![Login](https://via.placeholder.com/150) | ![Register](https://via.placeholder.com/150) |

### 2. Course API Integration (CRUD)
| Course List (GET) | Add/Edit Course (POST/PUT) | Delete Confirmation (DELETE) |
|---|---|---|
| ![Course List](https://via.placeholder.com/150) | ![Add Course](https://via.placeholder.com/150) | ![Delete Course](https://via.placeholder.com/150) |
