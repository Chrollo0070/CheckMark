# Setup

## Repository layout
- `mobile/`: Flutter client
- `backend/`: Flask API
- `firmware/`: ESP32 placeholder
- `docs/`: repository documentation

## Next steps
1. Install Flutter 3.19+ and Python 3.11+.
2. Configure Firebase for Android and iOS.
3. Copy environment examples:
   - `mobile/.env.example` to `mobile/.env`
   - `backend/.env.example` to `backend/.env`
4. Initialize the Flutter platform folders with `flutter create .` inside `mobile/` if you want a full generated project structure.
5. Create a Python virtual environment in `backend/` and install requirements.

## Current state
This scaffold includes application structure, starter code, and API contracts. Firebase, device firmware, and full feature implementation are still pending.
