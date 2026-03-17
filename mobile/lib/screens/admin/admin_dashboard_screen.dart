import 'package:flutter/material.dart';

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Admin Dashboard')),
      body: const Padding(
        padding: EdgeInsets.all(24),
        child: Text(
          'Admin dashboard scaffolded. Metrics, logs, charts, and enrollment management are next.',
        ),
      ),
    );
  }
}
