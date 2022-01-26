import 'package:flutter/material.dart';

class AvatarScreen extends StatelessWidget {
  const AvatarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Avatars'),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            child: CircleAvatar(
              child: const Text('SL'),
              backgroundColor: Colors.green[900],
            ),
          )
        ],
      ),
      body: const Center(
        child: CircleAvatar(
            maxRadius: 100,
            backgroundImage: NetworkImage(
                'https://www.quien.net/wp-content/uploads/cine-quien-es/Stan-Lee-spiderman.jpg')),
      ),
    );
  }
}
