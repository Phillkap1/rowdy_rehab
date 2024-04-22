// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MessagingPage extends StatefulWidget {
  @override
  _MessagingPageState createState() => _MessagingPageState();
}

class Message {
  String senderId;
  String text;
  String? imageUrl;
  DateTime sentTime;

  Message({
    required this.senderId,
    required this.text,
    this.imageUrl,
    required this.sentTime,
  });
}

class _MessagingPageState extends State<MessagingPage> {
  final List<Message> _messages = []; // Example messages list
  final TextEditingController _messageController = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  void _sendMessage({String? text, String? imageUrl}) {
    // Here you would add logic to send the message to your backend or Firebase
    print('Message sent: $text, ImageUrl: $imageUrl');
  }

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      _sendMessage(imageUrl: image.path);
    }
  }

  @override
Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              // Assuming you have an imageUrl for the athletic trainer
              backgroundImage: NetworkImage('https://images.sidearmdev.com/fit?url=https%3a%2f%2fdxbhsrqyrr690.cloudfront.net%2fsidearm.nextgen.sites%2fucwvathletics.com%2fimages%2f2010%2f5%2f19%2fSport_Med.jpg&height=207&width=298&type=jpeg'),
            ),
            SizedBox(width: 10),
            Text('Athletic Trainer'),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return ListTile(
                  title: Text(message.text),
                  // Display image if the message has an imageUrl
                  leading: message.imageUrl != null ? Image.network(message.imageUrl!) : null,
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
                    decoration: InputDecoration(hintText: 'Send a message'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.photo),
                  onPressed: _pickImage,
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    _sendMessage(text: _messageController.text);
                    _messageController.clear();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
