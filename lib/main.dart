import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:triptrek/services/auth_service.dart';
import 'package:triptrek/services/database_service.dart';
import 'package:triptrek/services/cloudinary_service.dart';
import 'package:triptrek/core/theme.dart';
import 'package:triptrek/screens/onboarding/onboarding_screen.dart';
import 'package:triptrek/screens/auth/login_screen.dart';
import 'package:triptrek/screens/auth/signup_screen.dart';
import 'package:triptrek/screens/preferences/preferences_screen.dart';
import 'package:triptrek/screens/main_wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
  } catch (e) {
    print("Firebase init failed: $e");
  }

  CloudinaryService.init();
  
  runApp(
    MultiProvider(
      providers: [
        Provider<AuthService>(create: (_) => AuthService()),
        Provider<DatabaseService>(create: (_) => DatabaseService()),
      ],
      child: const TripTrekApp(),
    ),
  );
}

class TripTrekApp extends StatelessWidget {
  const TripTrekApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TripTrek',
      debugShowCheckedModeBanner: false,
      theme: TripTrekTheme.darkTheme,
      initialRoute: '/onboarding',
      routes: {
        '/onboarding': (context) => const OnboardingScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/preferences': (context) => const PreferencesScreen(),
        '/home': (context) => const MainWrapperScreen(),
      },
    );
  }
}