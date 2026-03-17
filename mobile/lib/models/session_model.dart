class SessionModel {
  const SessionModel({
    required this.sessionId,
    required this.terminalId,
    required this.timestamp,
  });

  final String sessionId;
  final String terminalId;
  final DateTime timestamp;
}
