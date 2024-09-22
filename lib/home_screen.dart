import 'package:flutter/material.dart';
import 'package:soul_mate/API/pexel_api.dart';
import 'package:soul_mate/CHAT/chat_screen.dart';
import 'package:soul_mate/PROFILE/profile_screen.dart';
import 'package:soul_mate/custom_bottom_navbar.dart';
import 'package:soul_mate/notifications_page.dart';
import 'package:tcard/tcard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TCardController _controller = TCardController();
  List<Map<String, dynamic>> _matches = [];
  bool _isLoading = true;
  bool _hasError = false;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _fetchImages();
  }

  // Fetch images using the PexelsImageService
  Future<void> _fetchImages() async {
    setState(() {
      _isLoading = true;
      _hasError = false;
    });

    final apiService = PexelsImageService();
    try {
      // Fetch profile-like images
      final images =
          await apiService.fetchImages(query: 'portrait', count: 100);

      setState(() {
        _matches = images.map((image) {
          final imageUrl = image['src']['medium'] ??
              'https://via.placeholder.com/150'; // Fallback image if URL is null

          return {
            'name': 'User ${_matches.length + 1}', // Generate placeholder names
            'image': imageUrl,
          };
        }).toList();
        _isLoading = false;
      });
    } catch (e) {
      print('Error fetching images: $e');
      setState(() {
        _hasError = true;
        _isLoading = false;
      });
    }
  }

  // Handle navigation bar item tapped
  void _onNavBarItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Handle navigation between pages
  void _navigateToPage(int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
        break;
      case 3:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  InboxScreen()), // Assuming InboxScreen exists
        );
        break;
      case 4:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ProfileScreen()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Soul Mate'),
        backgroundColor: Colors.red,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const NotificationsPage()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _hasError
                    ? const Center(
                        child: Text(
                          'Error fetching images. Please try again later.',
                          style: TextStyle(fontSize: 18.0),
                        ),
                      )
                    : _matches.isNotEmpty
                        ? Stack(
                            children: [
                              TCard(
                                controller: _controller,
                                size: Size(
                                  MediaQuery.of(context).size.width,
                                  MediaQuery.of(context).size.height * 0.81,
                                ),
                                cards: _matches.map((match) {
                                  return Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    elevation: 5.0,
                                    child: Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          child: Image.network(
                                            match['image'] as String,
                                            fit: BoxFit.cover,
                                            width: double.infinity,
                                            height: double.infinity,
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              return Image.network(
                                                'https://via.placeholder.com/150',
                                                fit: BoxFit.cover,
                                                width: double.infinity,
                                                height: double.infinity,
                                              );
                                            },
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 0,
                                          left: 0,
                                          right: 0,
                                          child: ClipRRect(
                                            borderRadius:
                                                const BorderRadius.only(
                                              bottomLeft: Radius.circular(20.0),
                                              bottomRight:
                                                  Radius.circular(20.0),
                                            ),
                                            child: Container(
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                              padding:
                                                  const EdgeInsets.all(16.0),
                                              child: Text(
                                                match['name'] as String,
                                                style: const TextStyle(
                                                  fontSize: 24.0,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                                onForward: (index, info) {
                                  print('Swiped forward on card index: $index');
                                },
                                onBack: (index, info) {
                                  print('Swiped back on card index: $index');
                                },
                                onEnd: () {
                                  print(
                                      'You have reached the end of the cards.');
                                },
                              ),
                            ],
                          )
                        : const Center(
                            child: Text(
                              'No images found. Please try again later.',
                              style: TextStyle(fontSize: 18.0),
                            ),
                          ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: (index) {
          _onNavBarItemTapped(index);
          _navigateToPage(index);
        },
        onAddButtonPressed: () {
          // Handle add button action
        },
      ),
    );
  }
}
