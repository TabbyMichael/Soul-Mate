import 'package:flutter/material.dart';
import 'package:soul_mate/AUTH/login_page.dart';
import 'package:soul_mate/splash_screen.dart';
import 'onboarding_screen.dart';
import 'AUTH/signup_screen.dart';
import 'profile_setup_screen.dart';
import 'home_screen.dart';
import 'profile_screen.dart';
import 'search_screen.dart';
import 'CHAT/chat_screen.dart';
import 'settings_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Soul Mate',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => SplashScreen(),
        '/OnboardingScreen': (context) => OnboardingScreen(),
        '/signup': (context) => const SignUpPage(),
        '/login': (context) => const LoginPage(),
        '/profile-setup': (context) => ProfileSetupScreen(),
        '/home': (context) => HomeScreen(),
        '/profile': (context) => ProfileScreen(),
        '/search': (context) => SearchScreen(),
        '/chat': (context) => InboxScreen(),
        '/settings': (context) => SettingsScreen(),
      },
    );
  }
}
