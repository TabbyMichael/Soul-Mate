import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.red,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              // Handle more options
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  // Cover Photo
                  Container(
                    width: double.infinity,
                    height: 150,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage('assets/cover_photo.jpg'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  Positioned(
                    bottom: 8,
                    right: 8,
                    child: IconButton(
                      icon: const Icon(Icons.camera_alt, color: Colors.white),
                      onPressed: () {
                        // Handle cover photo update
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Profile Picture
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/profile_pic.jpg'),
              ),
              const SizedBox(height: 16),
              // User Name
              const Text(
                'User Name',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 8),
              // Bio
              const Text(
                'A brief bio about the user goes here. This could include interests, hobbies, or personal statements.',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 20),
              // Edit Profile Button
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/edit-profile');
                },
                child: const Text('Edit Profile'),
              ),
              const SizedBox(height: 20),
              // Interests Section
              _buildSectionTitle('Interests'),
              Container(
                padding: const EdgeInsets.all(12.0),
                margin: const EdgeInsets.only(bottom: 10.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text('Hobbies'),
              ),
              Container(
                padding: const EdgeInsets.all(12.0),
                margin: const EdgeInsets.only(bottom: 10.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text('activities'),
              ),
              const SizedBox(height: 20),
              // Lifestyle Section
              _buildSectionTitle('Lifestyle'),
              Container(
                padding: const EdgeInsets.all(12.0),
                margin: const EdgeInsets.only(bottom: 10.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text('Drinking: Occasional'),
              ),
              Container(
                padding: const EdgeInsets.all(12.0),
                margin: const EdgeInsets.only(bottom: 10.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text('Smoking: Non-smoker'),
              ),
              Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text('Pets: Dog lover'),
              ),
              const SizedBox(height: 20),
              // Verification Badge
              const Row(
                children: [
                  Icon(Icons.verified, color: Colors.blue),
                  SizedBox(width: 8),
                  Text(
                    'Verified Profile',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Recent Activity
              _buildSectionTitle('Recent Activity'),
              const Text('Recent interactions, likes, or messages.'),
              const SizedBox(height: 20),
              // Match History
              _buildSectionTitle('Match History'),
              const Text('Overview of past matches and conversations.'),
              const SizedBox(height: 20),
              // Privacy and Block
              ElevatedButton(
                onPressed: () {
                  // Handle block or report functionality
                },
                child: const Text('Report/Block'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }
}
