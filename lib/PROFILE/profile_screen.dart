import 'package:flutter/material.dart';
import 'package:soul_mate/CHAT/chat_screen.dart';
import 'package:soul_mate/custom_bottom_navbar.dart';
import 'package:soul_mate/home_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedIndex = 4; // Set to 4 for the Profile tab

  void _onNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Update the navigation based on the selected index
    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
        break;
      case 1:
        // Handle the Likes screen navigation
        break;
      case 3:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => InboxScreen()),
        );
        break;
      case 4:
        // Already on the Profile screen, no need to navigate
        break;
    }
  }

  void _onAddButtonPressed() {
    // Handle the add button press action
  }

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
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {
              // Handle more options
            },
          ),
        ],
        // Remove leading property to ensure no back arrow is shown
        automaticallyImplyLeading: false,
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
                    height: 250,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage(
                            'assets/nature-field-flowers-355663.jpg'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  Positioned(
                    bottom: 8,
                    right: 8,
                    child: IconButton(
                      icon: const Icon(
                        Icons.camera_alt,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        // Handle cover photo update
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 16,
                    left: 16,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: const AssetImage('assets/profile.jpg'),
                      backgroundColor: Colors.white,
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: IconButton(
                          icon: const Icon(
                            Icons.camera_alt,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            // Handle profile picture update
                          },
                        ),
                      ),
                    ),
                  ),
                ],
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
                child: const Text('Activities'),
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
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: (index) {
          _onNavItemTapped(index);
        },
        onAddButtonPressed: _onAddButtonPressed,
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
