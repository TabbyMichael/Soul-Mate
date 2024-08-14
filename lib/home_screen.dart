import 'package:flutter/material.dart';
import 'package:soul_mate/notifications_page.dart'; // Ensure you have the provider package imported

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Soul Mate'),
        backgroundColor: Colors.red, // AppBar background color
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationsPage()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              // Handle profile navigation
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Welcome Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Welcome Back!',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          // Matches Carousel filling the rest of the screen
          Expanded(
            child: PageView.builder(
              itemCount: 4, // Number of items in the carousel
              itemBuilder: (context, index) {
                return _buildMatchCard(
                  context: context, // Pass context here
                  title: 'Featured Match ${index + 1}',
                  subtitle: 'Brief info for match ${index + 1}',
                  imageAsset:
                      'assets/images/match${index + 1}.jpg', // Sample image asset
                  isUserInFocus: index == 0, // Example condition for focus
                );
              },
              controller: PageController(
                viewportFraction:
                    0.8, // This determines the visible width of the cards
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Explore'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Messages'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        selectedItemColor: Colors.red, // Highlight selected item
        unselectedItemColor: Colors.grey, // Color for unselected items
      ),
      bottomSheet: Container(
        color: Colors.white, // Background color for the icons area
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.close, color: Colors.red, size: 30),
              onPressed: () {
                // Handle Dislike action
              },
            ),
            IconButton(
              icon: const Icon(Icons.favorite, color: Colors.pink, size: 30),
              onPressed: () {
                // Handle Love action
              },
            ),
            IconButton(
              icon: const Icon(Icons.star, color: Colors.yellow, size: 30),
              onPressed: () {
                // Handle Favorite action
              },
            ),
          ],
        ),
      ),
    );
  }

  // Widget to build match cards with customizable width and height
  Widget _buildMatchCard({
    required BuildContext context, // Add context here
    required String title,
    required String subtitle,
    required String imageAsset,
    required bool
        isUserInFocus, // Determine if the user is in focus for badge display
  }) {
    final size = MediaQuery.of(context).size; // Use context here

    return Container(
      height: size.height * 0.7, // Similar to UserCardWidget
      width: size.width *
          0.9, // Adjust width to be slightly smaller than full width
      margin: const EdgeInsets.symmetric(
          horizontal: 8.0), // Add horizontal margins for visibility
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(imageAsset),
          fit: BoxFit.cover, // Fit image to cover the container
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(color: Colors.black12, spreadRadius: 0.5),
          ],
          gradient: const LinearGradient(
            colors: [Colors.black12, Colors.black87],
            begin: Alignment.center,
            stops: [0.4, 1],
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              right: 10,
              left: 10,
              bottom: 10,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildUserInfo(title: title, subtitle: subtitle),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 16, right: 8),
                    child: Icon(Icons.info, color: Colors.white),
                  )
                ],
              ),
            ),
            if (isUserInFocus) buildLikeBadge(),
          ],
        ),
      ),
    );
  }

  Widget buildUserInfo({required String title, required String subtitle}) =>
      Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 21,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ],
        ),
      );

  Widget buildLikeBadge() {
    return Positioned(
      top: 20,
      right: 20,
      child: Transform.rotate(
        angle: -0.5, // Adjust angle for styling
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.green, width: 2),
          ),
          child: const Text(
            'LIKE',
            style: TextStyle(
              color: Colors.green,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
