class AttendanceModel {
  const AttendanceModel({
    required this.userId,
    required this.userName,
    required this.terminalId,
    required this.status,
    required this.timestamp,
  });

  final String userId;
  final String userName;
  final String terminalId;
  final String status;
  final DateTime timestamp;
}
