import 'package:flutter/material.dart';
import 'UserProfileDialog.dart';
class UserProfileWidget extends StatelessWidget {
  final bool isCollapsed;

  const UserProfileWidget({Key? key, required this.isCollapsed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showProfileDialog(context),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage('assets/profile_pic.png'),
              radius: 20,
            ),
            if (!isCollapsed) ...[
              const SizedBox(width: 10),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nom de l\'utilisateur', style: TextStyle(color: Colors.white)),
                  Text('email@exemple.com', style: TextStyle(color: Colors.white70)),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  void _showProfileDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const UserProfileDialog();
      },
    );
  }
}
