import 'package:flutter/material.dart';

class ProfileAvatarSection extends StatelessWidget {
  const ProfileAvatarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          const CircleAvatar(
            radius: 60,
            backgroundImage:
                NetworkImage('https://www.w3schools.com/howto/img_avatar.png'),
          ),
          Positioned(
            bottom: 0,
            right: 4,
            child: CircleAvatar(
              radius: 16,
              backgroundColor: Colors.blue,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.edit, size: 16, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
