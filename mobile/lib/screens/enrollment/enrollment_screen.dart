import 'package:flutter/material.dart';

class EnrollmentScreen extends StatelessWidget {
  const EnrollmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Enrollment')),
      body: const Padding(
        padding: EdgeInsets.all(24),
        child: Text(
          'Enrollment flow scaffolded. Camera capture, temporary upload, and embedding generation are next.',
        ),
      ),
    );
  }
}
