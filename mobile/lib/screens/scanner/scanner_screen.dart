import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScannerScreen extends StatelessWidget {
  const ScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scanner')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Scanner module scaffolded. Camera, QR parsing, and replay protection are next.',
            ),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: () => context.go('/result'),
              child: const Text('Mock Verification Result'),
            ),
          ],
        ),
      ),
    );
  }
}
