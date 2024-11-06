import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snapp/core/constants/application_strings.dart';
import 'package:snapp/core/themes/application_theme.dart';
import 'package:snapp/core/helpers/firebase_options.dart';
import 'package:snapp/features/authentication/views/pages/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

// TODO: Email verification
// TODO: Password reset feature

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ApplicationTheme.light,
      darkTheme: ApplicationTheme.dark,
      themeMode: ThemeMode.system,
      title: ApplicationStrings.applicationName,
      home: const SplashPage(),
    );
  }
}
