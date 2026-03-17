from dataclasses import asdict, dataclass


@dataclass
class VerifyResponse:
    status: str
    unlock: bool
    message: str
    similarity_score: float | None = None

    def to_dict(self) -> dict:
        return asdict(self)
