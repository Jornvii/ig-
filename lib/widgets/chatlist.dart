import 'package:flutter/material.dart';
class ChatItem extends StatelessWidget {
  final int index;
  final String username;
  final String message;
  final String avatarPath;
  const ChatItem({super.key, required this.index, required this.username, required this.message, required this.avatarPath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(avatarPath), 
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  username, 
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16), 
                ),
                Text(
                  message,
                  style: const TextStyle(color: Colors.grey),
                  overflow: TextOverflow.ellipsis,
                ), 
              ],
            ),
          ),
          Text(
            '2:3$index PM', 
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}