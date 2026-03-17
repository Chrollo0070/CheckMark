import uuid

from app.models.session import Session


class SessionService:
    def __init__(self, ttl_seconds: int) -> None:
        self._ttl_seconds = ttl_seconds

    def create_session(self, terminal_id: str) -> Session:
        return Session(
          session_id=str(uuid.uuid4()),
          terminal_id=terminal_id,
          expires_in_seconds=self._ttl_seconds,
        )
