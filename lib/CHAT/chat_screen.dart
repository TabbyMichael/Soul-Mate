// lib/Bottom Navbar/inbox_screen.dart
import 'package:flutter/material.dart';
import 'package:soul_mate/CHAT/message_detail_screen.dart';
import 'package:soul_mate/custom_bottom_navbar.dart';

class InboxScreen extends StatelessWidget {
  final List<Message> messages = [
    Message(
        sender: 'Alice',
        content: 'Hello! How are you?',
        time: '10:45 AM',
        isRead: false),
    Message(
        sender: 'Bob',
        content: 'Are we still on for tonight?',
        time: '09:30 AM',
        isRead: true),
    Message(
        sender: 'Charlie',
        content: 'Check out this link!',
        time: 'Yesterday',
        isRead: false),
    // Add more messages here
  ];

  InboxScreen({super.key});

  void _showMessageDetail(BuildContext context, Message message) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MessageDetailScreen(message: message),
      ),
    );
  }

  void _onLongPress(BuildContext context, Message message) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Wrap(
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.mark_as_unread),
              title: Text(message.isRead ? 'Mark as Unread' : 'Mark as Read'),
              onTap: () {
                // Implement Mark as Read/Unread functionality
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.delete),
              title: const Text('Delete'),
              onTap: () {
                // Implement Delete functionality
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red,
            ),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.add, color: Colors.white),
            ),
          ),
          onPressed: () {
            // Action for the + button
          },
        ),
        title: const Text('Inbox'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Action for the search button
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          final message = messages[index];
          return ListTile(
            leading: const CircleAvatar(
              child: Icon(Icons.person), // Replace with actual avatar
            ),
            title: Text(
              message.sender,
              style: TextStyle(
                fontWeight:
                    message.isRead ? FontWeight.normal : FontWeight.bold,
              ),
            ),
            subtitle: Text(
              message.content,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Text(
              message.time,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
            onTap: () => _showMessageDetail(context, message),
            onLongPress: () => _onLongPress(context, message),
          );
        },
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: 0, // Adjust index to reflect the correct tab
        onItemTapped: (index) {
          // Handle bottom nav bar tap
        },
        onAddButtonPressed: () {
          // Handle FAB action
        },
      ),
    );
  }
}
