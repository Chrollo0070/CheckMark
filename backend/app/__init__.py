from flask import Flask

from .config import Config
from .routes.health import health_bp
from .routes.sessions import sessions_bp
from .routes.verify import verify_bp


def create_app() -> Flask:
    app = Flask(__name__)
    app.config.from_object(Config())

    app.register_blueprint(health_bp)
    app.register_blueprint(sessions_bp, url_prefix="/api")
    app.register_blueprint(verify_bp, url_prefix="/api")

    return app
