import '../core/constants.dart';
import '../models/user_model.dart';

class AuthService {
  Future<UserModel> signIn({
    required String email,
    required String password,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 300));

    return UserModel(
      userId: 'demo-user',
      name: 'Demo User',
      email: email,
      role: email.contains('admin')
          ? AppConstants.adminRole
          : AppConstants.defaultRole,
      isEnrolled: true,
    );
  }

  Future<UserModel> register({
    required String name,
    required String email,
    required String password,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 300));

    return UserModel(
      userId: 'new-user',
      name: name,
      email: email,
      role: AppConstants.defaultRole,
      isEnrolled: false,
    );
  }

  Future<void> signOut() async {
    await Future<void>.delayed(const Duration(milliseconds: 150));
  }
}
