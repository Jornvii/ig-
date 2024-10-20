import 'package:flutter/material.dart';

class MessengerScreen extends StatelessWidget {
  MessengerScreen({super.key});

  final List<String> khmerNames = [
    "ខឹម​ វាសនា",
    "Chantha",
    "Dara",
    "Vanna",
    "Sothea",
    "Rathana",
    "Chenda",
    "Pisey",
    "Sovann",
    "Samnang"
  ];

  final List<String> khmerMessages = [
    "សួស្តី! សុខសប្បាយទេ?",
    "ខ្ញុំពិតជាដឹងសរសើរអ្នក!",
    "ប៉ុន្មានម៉ោងទៀតមែន?",
    "អរគុណ!",
    "តើពេលណាអ្នកអាចមក?",
    "ឈ្មោះរបស់ខ្ញុំគឺ ចន្ទា។",
    "ខ្ញុំពិតជាអរគុណចំពោះការជួយ!",
    "ចង់ធ្វើអ្វី?",
    "ខ្ញុំពិតជាស្រឡាញ់ការងាររបស់អ្នក!",
    "តើយើងអាចជួបគ្នាថ្ងៃនេះ?"
  ];

  final List<String> avatarImagePaths = [
    'assets/images/dog.jpg',
    'assets/images/dog.jpg',
    'assets/images/dog.jpg',
    'assets/images/dog.jpg',
    'assets/images/dog.jpg',
    'assets/images/dog.jpg',
    'assets/images/dog.jpg',
    'assets/images/dog.jpg',
    'assets/images/dog.jpg',
    'assets/images/dog.jpg',
    'assets/images/dog.jpg',
    'assets/images/dog.jpg',
    'assets/images/dog.jpg',
    'assets/images/dog.jpg',
    'assets/images/dog.jpg',
  ];

  // final ImagePicker _picker = ImagePicker();

  // Future<void> _openCamera(BuildContext context) async {
  //   final XFile? image = await _picker.pickImage(source: ImageSource.camera);
  //   if (image != null) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text('Picture taken: ${image.name}')));
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'IG Messenger',
          style: TextStyle(color: Colors.orange,fontWeight: FontWeight.bold,fontSize: 28),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.camera_alt, color: Colors.black),
          onPressed: () {
            // _openCamera(context); 
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_horiz, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Stories",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10, // Dummy count for stories
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StoryViewScreen(
                          avatarPath:
                              avatarImagePaths[index % avatarImagePaths.length],
                          username: khmerNames[index % khmerNames.length],
                        ),
                      ),
                    );
                  },
                  child: StoryAvatar(
                    index: index,
                    username: khmerNames[index % khmerNames.length],
                    avatarPath:
                        avatarImagePaths[index % avatarImagePaths.length],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Chats",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 15, // Dummy count for chats
              itemBuilder: (context, index) {
                return ChatItem(
                  index: index,
                  username: khmerNames[index % khmerNames.length],
                  message: khmerMessages[index % khmerMessages.length],
                  avatarPath: avatarImagePaths[index % avatarImagePaths.length],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class StoryAvatar extends StatelessWidget {
  final int index;
  final String username;
  final String avatarPath;

  const StoryAvatar(
      {super.key,
      required this.index,
      required this.username,
      required this.avatarPath});

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

class ChatItem extends StatelessWidget {
  final int index;
  final String username;
  final String message;
  final String avatarPath;

  const ChatItem(
      {super.key,
      required this.index,
      required this.username,
      required this.message,
      required this.avatarPath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(2),
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.orange, width: 3),
              ),
              child: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(avatarPath),
              ),
            ),
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
          const Text(
            '2:30 PM',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}


class StoryViewScreen extends StatefulWidget {
  final String avatarPath;
  final String username;

  const StoryViewScreen(
      {super.key, required this.avatarPath, required this.username});

  @override
  _StoryViewScreenState createState() => _StoryViewScreenState();
}

class _StoryViewScreenState extends State<StoryViewScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) {
        Navigator.of(context).pop();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onVerticalDragEnd: (details) {
          if (details.primaryVelocity! > 0) {
            Navigator.of(context).pop();
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Story by ${widget.username}',
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Image.asset(
                widget.avatarPath,
                fit: BoxFit.cover,
                width: 300,
                height: 300,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
