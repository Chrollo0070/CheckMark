from flask import Blueprint, current_app, jsonify, request

from app.services.session_service import SessionService

sessions_bp = Blueprint("sessions", __name__)


@sessions_bp.get("/session")
def get_session() -> tuple:
    terminal_id = request.args.get("terminalId", "ESP32-DEMO")
    service = SessionService(current_app.config["SESSION_TTL_SECONDS"])
    session = service.create_session(terminal_id=terminal_id)
    return jsonify(session.to_dict()), 200
