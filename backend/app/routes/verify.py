from flask import Blueprint, current_app, jsonify, request

from app.services.verification_service import VerificationService

verify_bp = Blueprint("verify", __name__)


@verify_bp.post("/verify")
def verify() -> tuple:
    payload = request.get_json(silent=True) or {}
    service = VerificationService(current_app.config["FACE_SIMILARITY_THRESHOLD"])
    response = service.verify(
        user_id=payload.get("userId", ""),
        session_id=payload.get("sessionId", ""),
        terminal_id=payload.get("terminalId", ""),
        face_embedding=payload.get("faceEmbedding"),
    )

    status_code = 200 if response.unlock else 403
    return jsonify(response.to_dict()), status_code
