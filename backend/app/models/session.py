from dataclasses import asdict, dataclass


@dataclass
class Session:
    session_id: str
    terminal_id: str
    expires_in_seconds: int

    def to_dict(self) -> dict:
        return asdict(self)
