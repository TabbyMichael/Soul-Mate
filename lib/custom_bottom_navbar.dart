import 'package:flutter/material.dart';
import 'package:soul_mate/CHAT/chat_screen.dart';
import 'package:soul_mate/home_screen.dart';
import 'package:soul_mate/PROFILE/profile_screen.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;
  final VoidCallback onAddButtonPressed;

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
    required this.onAddButtonPressed,
  });

  void _navigateToPage(int index, BuildContext context) {
    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
        break;
      // case 1:
      //   Navigator.pushReplacement(
      //     context,
      //     MaterialPageRoute(builder: (context) => FriendsScreen()),
      //   );
      //   break;
      case 3:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => InboxScreen()),
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
    return Stack(
      clipBehavior: Clip.none,
      children: [
        BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Likes',
            ),
            BottomNavigationBarItem(
              icon: SizedBox.shrink(),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message_outlined),
              label: 'Inbox',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: selectedIndex,
          onTap: (index) {
            if (index == 2) {
              onAddButtonPressed();
            } else {
              onItemTapped(index);
              _navigateToPage(index, context); // Navigate to the selected page
            }
          },
          backgroundColor: Colors.red,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: const TextStyle(
            fontSize: 14,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 12,
          ),
        ),
        Positioned(
          bottom: 30,
          left: MediaQuery.of(context).size.width / 2 - 28,
          child: FloatingActionButton(
            onPressed: onAddButtonPressed,
            backgroundColor: const Color(0xFFC0C0C0),
            child: const Icon(
              Icons.add,
              size: 36,
            ),
          ),
        ),
      ],
    );
  }
}
