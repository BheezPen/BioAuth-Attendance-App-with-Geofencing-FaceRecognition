# BioAuth-Attendance-App-with-Geofencing-FaceRecognition

<p align="center">
   <img alt="App Banner" height="450" width="900" src="./screenshots/bioauthBanner.jpg" />
</p>>

A comprehensive student attendance system built with Flutter and Firebase. This project utilizes face recognition technology and geofencing to provide a seamless, secure, and efficient way for students to mark their attendance.

---

## Overview

BioAuth aims to revolutionize student attendance tracking through advanced features like face recognition check-in, geofencing technology, push notifications, and detailed attendance analytics. An optional admin panel allows administrators to manage students, classes, and records.

---

## Features

### Core Features
- **Secure login and registration** using Firebase Authentication.
- **Face recognition** for accurate and convenient attendance check-in, powered by Google ML Kit.
- **Geofencing** to ensure students are within the designated location during check-in.
- Personalized class schedules for quick access to upcoming classes.
- **Detailed attendance history** with filtering options.
- **Push notifications** for class reminders and important announcements.
- **Admin panel** for managing students, classes, and attendance records.

---

## Technologies Used
- **Flutter**: Cross-platform mobile app development.
- **Firebase**: Backend services for authentication, database, and cloud storage.
- **Google ML Kit**: For facial recognition.
- **Geofencing Service**: To track user location during attendance check-in.

---

## Core Use Cases
1. **Login as Student/Admin**: Secure login for students and administrators, with role-based access.
2. **Confirm Location**: Geofencing verifies students' presence in the predefined area before attendance marking.
3. **Confirm Face Recognition**: After location verification, the system prompts students to verify their identity through facial recognition.
4. **Take Attendance**: Attendance is marked after successful location and identity verification.
5. **View Attendance Record**: Students can view their attendance history, while admins can manage attendance records.
6. **Generate Attendance Report**: Admins and students can export attendance records in PDF format.
7. **Geofencing and Course Selection**: Admins manage geofenced areas and course data.
8. **Password Management**: Users can reset or change their password through the app.

---

## Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/BheezPen/BioAuth-Attendance-App-with-Geofencing-FaceRecognition
   cd BioAuth-Attendance-App-with-Geofencing-FaceRecognition
   ```

2. **Install dependencies**:
   ```bash
   flutter pub get
   ```

3. **Run the application**:
   ```bash
   flutter run
   ```

---

## Screenshots

Here are screenshots showing various features of the BioAuth Attendance System:
<br/>
<br/>
Student Pages
<p align="center">
   <img alt="Login Screen" height="330" width="150" src="./screenshots/auth_page.png" />
   <img alt="Face Recognition" height="330" width="150" src="./screenshots/student_home_page.png" />
   <img alt="Face Recognition" height="330" width="150" src="./screenshots/face_recognition_check.png" />
</p>
<p align="center">
   <br/><br/>
   <img alt="Face Recognition" height="330" width="150" src="./screenshots/geonfencing_check.png" />
   <img alt="Geofencing Check-In" height="330" width="150" src="./screenshots/drawer.png" />
   <img alt="Attendance History" height="330" width="150" src="./screenshots/profile.png" />
</p>
<br/>
<br/>
Admin Pages
<p align="center">
   <img alt="Geofencing Check-In" height="330" width="150" src="./screenshots/admin_switching.png" />
   <img alt="Attendance History" height="330" width="150" src="./screenshots/admin_homepage.png" />
</p>

---

## Download and Usage

- **Download the app** via [GitHub](https://github.com/BheezPen/BioAuth-Attendance-System-with-Geofencing) or [Google Drive](https://drive.google.com/file/d/1_5Zna2o_LPbgFdoKJc2mShnPb4iF9tRS/view?usp=sharing).
- **Open the app** and register by providing necessary details, including a clear facial image for recognition.
- **Proceed to check-in** by confirming your location through geofencing and verifying your identity with face recognition.

---

## Acknowledgments
- **Flutter** for cross-platform mobile development.
- **Firebase** for robust backend services.
- **Google ML Kit** for facial recognition.
- **Geofencing Service** for location-based features.
