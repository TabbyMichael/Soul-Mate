import 'package:flutter/material.dart';

class Message {
  final String sender;
  final String content;
  final String time;
  final bool isRead;

  Message({
    required this.sender,
    required this.content,
    required this.time,
    this.isRead = false,
  });
}

class MessageDetailScreen extends StatefulWidget {
  final Message message;

  const MessageDetailScreen({super.key, required this.message});

  @override
  _MessageDetailScreenState createState() => _MessageDetailScreenState();
}

class _MessageDetailScreenState extends State<MessageDetailScreen> {
  final TextEditingController _replyController = TextEditingController();
  final List<Map<String, dynamic>> _messages = [];

  void _sendReply() {
    final reply = _replyController.text;
    if (reply.isNotEmpty) {
      setState(() {
        _messages.insert(0, {
          'message': reply,
          'timestamp': DateTime.now().toString().substring(11, 16),
          'isSent': true,
        });
        _replyController.clear();
      });

      // Show a snackbar to confirm the reply was sent
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Reply sent: $reply')),
      );
    }
  }

  Widget _buildMessageBubble(Map<String, dynamic> messageData) {
    bool isSent = messageData['isSent'];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment:
            isSent ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isSent)
            const CircleAvatar(
              backgroundImage: AssetImage('assets/images/avatar.png'),
            ),
          const SizedBox(width: 10),
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: isSent ? Colors.redAccent : Colors.grey[300],
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    messageData['message'],
                    style: TextStyle(
                      color: isSent ? Colors.white : Colors.black,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    messageData['timestamp'],
                    style: TextStyle(
                      color: isSent ? Colors.white60 : Colors.black45,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (isSent) const SizedBox(width: 10),
          if (isSent)
            const CircleAvatar(
              backgroundImage: AssetImage('assets/images/avatar.png'),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left,
            size: 30.0,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(widget.message.sender),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_horiz),
            onPressed: () {
              // Action for the '...' button
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return _buildMessageBubble(_messages[index]);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.message.content,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                Text(
                  'Received at ${widget.message.time}',
                  style: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _replyController,
                            decoration: const InputDecoration(
                              hintText: 'Type your reply here...',
                              border: OutlineInputBorder(),
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 16.0),
                            ),
                            maxLines: null,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.send),
                          onPressed: _sendReply,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
