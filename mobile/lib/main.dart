import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'providers/app_providers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await dotenv.load(fileName: '.env');
  } catch (_) {
    // Allow local development without a populated .env file.
  }

  runApp(const CheckMarkBootstrap());
}

class CheckMarkBootstrap extends StatelessWidget {
  const CheckMarkBootstrap({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: appProviders,
      child: const CheckMarkApp(),
    );
  }
}
