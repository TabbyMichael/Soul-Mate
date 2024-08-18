import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();

  // Selected interests and lifestyle
  List<String> _selectedInterests = [];
  List<String> _selectedLifestyle = [];

  // Options for interests and lifestyle
  final List<String> _interestOptions = [
    'Hobbies',
    'Favorite Activities',
    'Music Preferences',
    'Movies/TV Shows',
    'Books/Reading',
    'Sports',
    'Travel Destinations'
  ];

  final List<String> _lifestyleOptions = [
    'Drinking Habits',
    'Smoking Habits',
    'Dietary Preferences',
    'Exercise Habits',
    'Sleep Schedule',
    'Pets',
    'Living Situation',
    'Relationship Goals'
  ];

  @override
  void initState() {
    super.initState();
    // Initialize controllers with current profile data if needed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Handle back navigation
          },
        ),
        title: const Center(
          child: Text(
            'Edit Profile',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Colors.red,
        actions: [
          TextButton(
            onPressed: () {
              // Handle save action
              _saveProfile();
            },
            child: const Text(
              'Save',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Handle cancel action
            },
            child: const Text(
              'Cancel',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Picture
              GestureDetector(
                onTap: () {
                  // Handle profile picture change
                },
                child: const CircleAvatar(
                  radius: 50,
                  backgroundImage:
                      AssetImage('assets/profile_pic.jpg'), // Placeholder
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Icon(Icons.camera_alt, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Username
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: TextField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              // Bio
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: TextField(
                  controller: _bioController,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    labelText: 'Bio',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              // Interests Section
              _buildSectionTitle('Interests'),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: _buildSelectableOptions(
                  title: 'Interests',
                  options: _interestOptions,
                  selectedOptions: _selectedInterests,
                  onSelectionChanged: (selected) {
                    setState(() {
                      _selectedInterests = selected;
                    });
                  },
                ),
              ),
              // Lifestyle Section
              _buildSectionTitle('Lifestyle'),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: _buildSelectableOptions(
                  title: 'Lifestyle',
                  options: _lifestyleOptions,
                  selectedOptions: _selectedLifestyle,
                  onSelectionChanged: (selected) {
                    setState(() {
                      _selectedLifestyle = selected;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _saveProfile() {
    // Handle profile saving logic
    // For example, update the profile information in your backend or local storage
    Navigator.pop(context);
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildSelectableOptions({
    required String title,
    required List<String> options,
    required List<String> selectedOptions,
    required ValueChanged<List<String>> onSelectionChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        ...options.map(
          (option) {
            return CheckboxListTile(
              title: Text(option),
              value: selectedOptions.contains(option),
              onChanged: (bool? isSelected) {
                setState(() {
                  if (isSelected == true) {
                    selectedOptions.add(option);
                  } else {
                    selectedOptions.remove(option);
                  }
                  onSelectionChanged(selectedOptions);
                });
              },
            );
          },
        ).toList(),
      ],
    );
  }
}
