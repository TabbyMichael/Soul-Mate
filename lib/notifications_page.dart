import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Explore Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Explore',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildExploreButton('People Nearby', Icons.location_on),
                      _buildExploreButton('New Users', Icons.new_releases),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Activity Feed
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Recent Activity',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.favorite),
                    title: Text('Matched with Jane Doe'),
                    subtitle: Text('2 hours ago'),
                  ),
                  ListTile(
                    leading: Icon(Icons.event),
                    title: Text('Upcoming Event: Speed Dating'),
                    subtitle: Text('Tomorrow at 6:00 PM'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget to build explore buttons
  Widget _buildExploreButton(String label, IconData icon) {
    return ElevatedButton.icon(
      onPressed: () {
        // Handle navigation to respective section
      },
      icon: Icon(icon),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        textStyle: const TextStyle(fontSize: 18),
      ),
    );
  }
}
