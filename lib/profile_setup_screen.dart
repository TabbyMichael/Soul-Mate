import 'package:flutter/material.dart';

class ProfileSetupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile Setup')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(labelText: 'Location'),
            ),
            const TextField(
              decoration: InputDecoration(labelText: 'Interests'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              child: const Text('Complete Setup'),
            ),
          ],
        ),
      ),
    );
  }
}
