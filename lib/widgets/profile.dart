import 'package:flutter/material.dart';

class StoryAvatar extends StatelessWidget {
  final int index;
  final String username;
  final String avatarPath;
  const StoryAvatar({super.key, required this.index, required this.username, required this.avatarPath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.green, width: 3),
            ),
            child: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(avatarPath), 
            ),
          ),
          const SizedBox(height: 5),
          Text(
            username, 
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
