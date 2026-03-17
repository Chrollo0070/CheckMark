import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'providers/auth_provider.dart';
import 'screens/admin/admin_dashboard_screen.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/register_screen.dart';
import 'screens/enrollment/enrollment_screen.dart';
import 'screens/history/attendance_history_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/result/result_screen.dart';
import 'screens/scanner/scanner_screen.dart';
import 'screens/settings/settings_screen.dart';
import 'screens/splash/splash_screen.dart';

class CheckMarkApp extends StatelessWidget {
  const CheckMarkApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GoRouter(
      initialLocation: '/splash',
      refreshListenable: context.read<AuthProvider>(),
      redirect: (context, state) {
        final auth = context.read<AuthProvider>();
        final isLoggedIn = auth.isAuthenticated;
        final authRoutes = {'/login', '/register', '/splash'};

        if (!isLoggedIn && !authRoutes.contains(state.matchedLocation)) {
          return '/login';
        }

        if (isLoggedIn &&
            (state.matchedLocation == '/login' ||
                state.matchedLocation == '/register')) {
          return auth.isAdmin ? '/admin-dashboard' : '/home';
        }

        return null;
      },
      routes: [
        GoRoute(
          path: '/splash',
          builder: (context, state) => const SplashScreen(),
        ),
        GoRoute(
          path: '/login',
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: '/register',
          builder: (context, state) => const RegisterScreen(),
        ),
        GoRoute(
          path: '/home',
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: '/scanner',
          builder: (context, state) => const ScannerScreen(),
        ),
        GoRoute(
          path: '/result',
          builder: (context, state) => const ResultScreen(),
        ),
        GoRoute(
          path: '/history',
          builder: (context, state) => const AttendanceHistoryScreen(),
        ),
        GoRoute(
          path: '/enrollment',
          builder: (context, state) => const EnrollmentScreen(),
        ),
        GoRoute(
          path: '/admin-dashboard',
          builder: (context, state) => const AdminDashboardScreen(),
        ),
        GoRoute(
          path: '/settings',
          builder: (context, state) => const SettingsScreen(),
        ),
      ],
    );

    return MaterialApp.router(
      title: 'CheckMark',
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0C6B58)),
        useMaterial3: true,
      ),
    );
  }
}
