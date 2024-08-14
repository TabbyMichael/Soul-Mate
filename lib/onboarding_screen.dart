import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Logo or App Name
          Center(
            child: Image.asset('assets/splash_logo-removebg-preview.png',
                height: 300),
          ),
          const SizedBox(height: 20),

          // Welcome Message
          const Center(
            child: Text(
              'Welcome to Soul Mate!',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Brief Description
          const Center(
            child: Padding(
              padding: EdgeInsets.all(30.0),
              child: Text(
                'Discover your perfect match and connect with like-minded people. Get started by creating your profile or logging in if you already have an account.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.white70,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),

          // Get Started Button
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/signup');
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.red,
              backgroundColor: Colors.white,
              textStyle: const TextStyle(
                fontSize: 20,
              ),
            ),
            child: const Text('Get Started'),
          ),
          const SizedBox(height: 20),

          // "Already have an account? Log In" with different styles
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/login'); // Navigate to LoginPage
            },
            child: RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'Already have an account? ',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  TextSpan(
                    text: 'Log In',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
