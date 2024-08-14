import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              title: const Text('Privacy Settings'),
              onTap: () {
                Navigator.pushNamed(context, '/privacy-settings');
              },
            ),
            ListTile(
              title: const Text('Account Management'),
              onTap: () {
                Navigator.pushNamed(context, '/account-management');
              },
            ),
            ListTile(
              title: const Text('Notification Preferences'),
              onTap: () {
                Navigator.pushNamed(context, '/notification-preferences');
              },
            ),
          ],
        ),
      ),
    );
  }
}
