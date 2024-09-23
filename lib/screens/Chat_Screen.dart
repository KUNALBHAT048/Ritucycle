import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  List<Map<String, String>> chatMessages = [
    {'sender': 'Neha', 'message': 'Hi everyone!'},
    {'sender': 'Priya', 'message': 'Hello Neha!'},
    {'sender': 'Aditi', 'message': 'How is everyone doing today?'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Community Chat'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: chatMessages.length,
              itemBuilder: (context, index) {
                return ChatBubble(
                  sender: chatMessages[index]['sender']!,
                  message: chatMessages[index]['message']!,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                FloatingActionButton(
                  onPressed: () {
                    if (_messageController.text.isNotEmpty) {
                      setState(() {
                        chatMessages.add({
                          'sender': 'You',
                          'message': _messageController.text,
                        });
                        _messageController.clear();
                      });
                    }
                  },
                  backgroundColor: Colors.pinkAccent,
                  child: Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String sender;
  final String message;

  ChatBubble({required this.sender, required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
      child: Align(
        alignment: sender == 'You' ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          decoration: BoxDecoration(
            color: sender == 'You' ? Colors.pinkAccent : Colors.grey.shade300,
            borderRadius: BorderRadius.circular(20.0),
          ),
          padding: EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: sender == 'You'
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            children: [
              Text(
                sender,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: sender == 'You' ? Colors.white : Colors.black,
                ),
              ),
              SizedBox(height: 5),
              Text(
                message,
                style: TextStyle(
                  color: sender == 'You' ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
