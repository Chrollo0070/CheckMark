import os
from dataclasses import dataclass


@dataclass
class Config:
    PORT: int = int(os.getenv("PORT", "5000"))
    FACE_SIMILARITY_THRESHOLD: float = float(
        os.getenv("FACE_SIMILARITY_THRESHOLD", "0.6")
    )
    SESSION_TTL_SECONDS: int = int(os.getenv("SESSION_TTL_SECONDS", "15"))
    COOLDOWN_MINUTES: int = int(os.getenv("COOLDOWN_MINUTES", "30"))
