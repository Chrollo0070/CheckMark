import 'package:provider/provider.dart';

import '../services/auth_service.dart';
import 'auth_provider.dart';

final appProviders = [
  Provider<AuthService>(
    create: (_) => AuthService(),
  ),
  ChangeNotifierProxyProvider<AuthService, AuthProvider>(
    create: (context) => AuthProvider(context.read<AuthService>()),
    update: (context, authService, authProvider) =>
        authProvider ?? AuthProvider(authService),
  ),
];
