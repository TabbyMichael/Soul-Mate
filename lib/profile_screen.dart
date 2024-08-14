import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/profile_pic.jpg'),
            ),
            const SizedBox(height: 20),
            Text('User Name', style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/edit-profile');
              },
              child: const Text('Edit Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
