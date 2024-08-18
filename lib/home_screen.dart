import 'package:flutter/material.dart';
import 'package:soul_mate/CHAT/chat_screen.dart';
import 'package:soul_mate/custom_bottom_navbar.dart';
import 'package:soul_mate/notifications_page.dart';
import 'package:soul_mate/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onNavBarItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onAddButtonPressed() {
    // Handle add button press
  }

  void _navigateToPage(int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
        break;
      // Add more cases as needed
      case 3:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => InboxScreen()),
        );
        break;
      case 4:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ProfileScreen()),
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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Welcome Back!',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          Expanded(
            child: PageView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return _buildMatchCard(
                  context: context,
                  title: 'Featured Match ${index + 1}',
                  subtitle: 'Brief info for match ${index + 1}',
                  imageAsset: 'assets/images/match${index + 1}.jpg',
                  isUserInFocus: index == 0,
                );
              },
              controller: PageController(viewportFraction: 0.8),
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
        onAddButtonPressed: _onAddButtonPressed,
      ),
    );
  }

  Widget _buildMatchCard({
    required BuildContext context,
    required String title,
    required String subtitle,
    required String imageAsset,
    required bool isUserInFocus,
  }) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.7,
      width: size.width * 0.9,
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(imageAsset),
          fit: BoxFit.cover,
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
        angle: -0.5,
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
