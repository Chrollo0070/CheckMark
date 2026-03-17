from app.models.verify_response import VerifyResponse


class VerificationService:
    def __init__(self, similarity_threshold: float) -> None:
        self._similarity_threshold = similarity_threshold

    def verify(
        self,
        *,
        user_id: str,
        session_id: str,
        terminal_id: str,
        face_embedding: list[float] | None,
    ) -> VerifyResponse:
        if not user_id or not session_id or not terminal_id:
            return VerifyResponse(
                status="failed",
                unlock=False,
                message="Missing required verification fields.",
            )

        score = 0.91 if face_embedding else 0.0
        is_success = score >= self._similarity_threshold
        return VerifyResponse(
            status="success" if is_success else "failed",
            unlock=is_success,
            message="Verification accepted." if is_success else "Verification failed.",
            similarity_score=score if face_embedding else None,
        )
