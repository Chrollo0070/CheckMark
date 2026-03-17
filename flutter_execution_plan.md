# Flutter Execution Plan

## Goal
Build the Flutter client for the AI-based IoT Attendance and Access Control System using the existing master build plan as the source of truth.

## Scope
- Student mobile app
- Admin mobile app flows
- Firebase integration
- QR scan to face verification flow
- Enrollment flow
- Reporting and history UI

## Phase 1: Foundation
- Create Flutter project with the required package name and minimum SDKs.
- Configure Android and iOS build settings, multidex, permissions, and Firebase platform files.
- Add all required dependencies from `build_plan.txt`.
- Set up `.env`, `.gitignore`, and `firebase_options.dart`.
- Create the base folder structure under `lib/`.

## Phase 2: App Architecture
- Create core constants, theme, error, and environment loading.
- Define models:
  - `UserModel`
  - `SessionModel`
  - `AttendanceModel`
  - `FaceEmbeddingModel`
- Implement serialization, validation, and typed parsing.

## Phase 3: Services Layer
- Implement:
  - `AuthService`
  - `FirestoreService`
  - `APIService`
  - `FaceService`
  - `QRService`
  - `PermissionService`
- Keep all Firestore and HTTP logic out of screens.
- Add typed exceptions and timeout handling.

## Phase 4: State Management
- Create providers:
  - `AuthProvider`
  - `AttendanceProvider`
  - `SessionProvider`
  - Optional connectivity/global app provider
- Wire providers in `main.dart`.
- Expose loading, error, and user/session state cleanly.

## Phase 5: Routing and App Shell
- Build `app.dart` with `GoRouter`.
- Add auth-aware redirects.
- Define routes for:
  - splash
  - login
  - register
  - home
  - scanner
  - face capture
  - result
  - history
  - enrollment
  - admin dashboard
  - settings

## Phase 6: Authentication UX
- Build splash routing logic.
- Build login and register screens with validation.
- Persist minimal local state safely.
- Route by role:
  - student
  - admin
- Handle unenrolled students explicitly.

## Phase 7: QR Attendance Flow
- Implement QR parsing and validation rules.
- Build scanner screen with camera permission handling.
- Add:
  - overlay frame
  - torch toggle
  - camera flip
  - debounce
  - expired/reused/invalid QR handling
- Pass parsed session data into face capture flow.

## Phase 8: Face Verification Flow
- Build face capture screen with front camera.
- Detect face with ML Kit.
- Enforce:
  - exactly one face
  - liveness check
  - cooldown check
- Send verification request through `APIService`.
- Navigate to result screen with structured response.

## Phase 9: Enrollment Flow
- Build student enrollment-required screen.
- Build enrollment flow to capture three images.
- Upload temporary images, trigger embedding generation, store embedding, then delete images.
- Update `isEnrolled` state in Firestore.
- Add admin enrollment management and re-enrollment support.

## Phase 10: Student Experience
- Build home screen with:
  - greeting
  - enrollment badge
  - scan CTA
  - recent attendance
  - offline banner
- Build attendance history with filters and grouped dates.
- Add logout and session cleanup.

## Phase 11: Admin Experience
- Build admin dashboard summary cards and charts.
- Build user management.
- Build attendance logs with filters and CSV export.
- Build enrollment management and settings access.

## Phase 12: Security and Reliability
- Add Firestore rules from the master plan.
- Enforce HTTPS and Firebase ID token auth for API calls.
- Store tokens only in secure storage.
- Delete raw face images after enrollment.
- Block duplicate attendance with cooldown logic.
- Add global error handling and offline handling.

## Phase 13: Testing
- Unit tests for models and service logic.
- Widget tests for login, scanner, and result screens.
- Manual end-to-end validation for:
  - success path
  - expired QR
  - replay attack
  - liveness fail
  - wrong face
  - cooldown
  - offline
  - admin enrollment

## Phase 14: Release Readiness
- Run:
  - `flutter pub get`
  - `flutter analyze`
  - `flutter test`
  - release builds
- Confirm app metadata, permissions, and platform configs.
- Remove debug prints and ensure `.env` is not committed.

## Deliverables
- Production-ready Flutter app
- Student and admin flows
- Firebase-integrated client
- Tested QR-to-face attendance pipeline

## Build Order
1. Setup
2. Models
3. Services
4. Providers
5. Routing
6. Auth screens
7. Scanner
8. Face verification
9. Enrollment
10. Home/history
11. Admin dashboard
12. Security/offline
13. Tests
14. Release build
