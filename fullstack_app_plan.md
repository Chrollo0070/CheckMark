# Full-Stack App Plan

## Goal
Build the complete AI-based IoT Attendance and Access Control System as a full-stack product using the Flutter plan as the client layer.

## System Layers
- Flutter mobile app for students and admins
- Flask backend API for verification and enrollment
- Firebase Authentication, Firestore, and Storage
- Face embedding and similarity pipeline
- ESP32 terminal for QR generation and door relay control
- Deployment, monitoring, and operations layer

## Core Modules
- Mobile client
- Admin tools
- Authentication and authorization
- QR session management
- Face enrollment and verification
- Attendance logging
- Device control
- Reporting and analytics

## Phase 1: Product and Architecture Baseline
- Freeze the SRS and SDD scope.
- Define the end-to-end request flow from scan to unlock.
- Confirm non-functional requirements:
  - speed
  - security
  - fail-secure behavior
  - privacy
- Define environment split:
  - local
  - staging
  - production

## Phase 2: Repository and Project Structure
- Organize the project into clear modules:
  - `mobile/` for Flutter
  - `backend/` for Flask
  - `firmware/` for ESP32
  - `docs/` for SRS, SDD, API contracts, and setup
- Add shared environment variable conventions and setup docs.
- Add CI-ready lint and test entry points per module.

## Phase 3: Data Design
- Finalize Firestore collections:
  - `users`
  - `face_embeddings`
  - `sessions`
  - `attendance_logs`
- Define document fields, indexes, retention rules, and audit fields.
- Separate raw images from embeddings and delete temporary images after enrollment.
- Decide which writes happen from client, backend, and device.

## Phase 4: Authentication and Access Control
- Use Firebase Authentication for app users.
- Use role-based authorization for student/admin access.
- Verify Firebase ID tokens in Flask for protected endpoints.
- Use service credentials only on trusted backend processes.
- Enforce Firestore security rules and Storage rules.

## Phase 5: Flutter Client Delivery
- Build the Flutter app using the `flutter_execution_plan.md` plan.
- Implement:
  - authentication
  - QR scanning
  - face capture
  - attendance history
  - enrollment
  - admin dashboard
- Integrate the app with backend APIs and Firebase.

## Phase 6: Flask Backend Delivery
- Create Flask app structure:
  - `app.py`
  - `routes/`
  - `services/`
  - `models/`
  - `middleware/`
  - `tests/`
- Implement endpoints:
  - `POST /api/verify`
  - `POST /api/enroll`
  - `GET /api/session`
  - optional admin/report endpoints
- Validate Firebase bearer tokens on every protected request.
- Return typed, consistent JSON responses and error codes.

## Phase 7: Face Recognition Pipeline
- Decide embedding implementation:
  - local inference service
  - Python face recognition model
  - external ML service if justified
- Enrollment flow:
  - receive image URLs or image payloads
  - validate one face per image
  - generate 128-dim embedding
  - store only embedding
- Verification flow:
  - receive current face data
  - generate/compare embedding
  - apply similarity threshold
  - return success/failure and unlock decision
- Log confidence score for audit.

## Phase 8: QR Session and Replay Protection
- Generate short-lived QR sessions per terminal.
- Store session metadata with:
  - terminal ID
  - session ID
  - created time
  - expiry time
  - used flag
- Reject:
  - malformed sessions
  - expired sessions
  - reused sessions
- Add cooldown logic to prevent duplicate attendance in the defined time window.

## Phase 9: ESP32 and Access Hardware
- Build ESP32 firmware to:
  - identify terminal
  - request or generate session tokens
  - render QR code
  - poll or receive unlock response
  - actuate relay only on approved verification
- Keep default state locked on failure or timeout.
- Add terminal health checks and configurable QR refresh intervals.

## Phase 10: Logging, Analytics, and Admin Operations
- Store append-only attendance logs.
- Provide admin queries for:
  - recent activity
  - failed verifications
  - attendance trends
  - enrollment coverage
- Support export to CSV.
- Add audit logging for sensitive admin actions.

## Phase 11: Reliability and Security
- Enforce HTTPS everywhere.
- Add request timeouts, retry policy, and structured error handling.
- Rate-limit sensitive endpoints if exposed publicly.
- Validate payload schemas server-side.
- Protect secrets with environment variables and deployment secret storage.
- Add monitoring for backend errors, auth failures, and device communication issues.

## Phase 12: Testing Strategy
- Flutter:
  - unit tests
  - widget tests
  - integration tests
- Flask:
  - route tests
  - service tests
  - auth middleware tests
  - face pipeline tests
- ESP32:
  - session generation tests
  - unlock/fail-secure tests
- End-to-end:
  - valid attendance
  - expired QR
  - reused QR
  - wrong face
  - liveness failure
  - backend timeout
  - offline client
  - relay remains locked on failure

## Phase 13: Deployment
- Deploy Flask backend to a secure host.
- Configure production Firebase project and rules.
- Configure environment variables per environment.
- Build Flutter release artifacts.
- Provision ESP32 devices with terminal IDs and environment-specific endpoints.
- Add backup, rollback, and release notes process.

## Phase 14: Final Acceptance
- Confirm every SRS requirement maps to a working implementation.
- Verify privacy requirements:
  - no permanent raw image storage
  - embeddings isolated from user profile data
- Verify operational readiness:
  - logs
  - dashboards
  - alerting
  - recovery steps
- Run a full demo from enrollment to unlock to reporting.

## Primary Deliverables
- Flutter mobile app
- Flask verification and enrollment backend
- Firebase project and rules
- ESP32 terminal firmware
- Deployment and test documentation

## Recommended Build Order
1. Finalize data contracts and architecture
2. Set up Firebase and backend skeleton
3. Implement Flutter auth and routing
4. Implement backend auth and API contracts
5. Implement QR session handling
6. Implement face enrollment and verification
7. Integrate Flutter with backend
8. Build admin features
9. Build ESP32 session and unlock flow
10. Complete testing, hardening, and deployment
