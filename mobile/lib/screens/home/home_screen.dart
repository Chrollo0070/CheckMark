import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../providers/auth_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthProvider>();
    final user = auth.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            onPressed: () async {
              await context.read<AuthProvider>().signOut();
              if (context.mounted) context.go('/login');
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello, ${user?.name ?? 'User'}!',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 12),
            Chip(
              label: Text(user?.isEnrolled == true
                  ? 'Face Enrolled'
                  : 'Enrollment Required'),
            ),
            const SizedBox(height: 24),
            FilledButton(
              onPressed:
                  user?.isEnrolled == true ? () => context.go('/scanner') : null,
              child: const Text('Scan QR to Mark Attendance'),
            ),
            const SizedBox(height: 16),
            OutlinedButton(
              onPressed: () => context.go('/history'),
              child: const Text('View Attendance History'),
            ),
          ],
        ),
      ),
    );
  }
}
