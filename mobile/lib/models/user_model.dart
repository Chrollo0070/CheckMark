class UserModel {
  const UserModel({
    required this.userId,
    required this.name,
    required this.email,
    required this.role,
    required this.isEnrolled,
  });

  final String userId;
  final String name;
  final String email;
  final String role;
  final bool isEnrolled;

  factory UserModel.fromMap(Map<String, dynamic> data) {
    return UserModel(
      userId: data['userId'] as String? ?? '',
      name: data['name'] as String? ?? '',
      email: data['email'] as String? ?? '',
      role: data['role'] as String? ?? 'student',
      isEnrolled: data['isEnrolled'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'name': name,
      'email': email,
      'role': role,
      'isEnrolled': isEnrolled,
    };
  }
}
