import 'package:flutter/material.dart';

class UserProfileDialog extends StatelessWidget {
  const UserProfileDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      contentPadding: const EdgeInsets.all(16.0),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/profile_pic.png'),
                radius: 30,
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nom de l\'utilisateur', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Text('Basic Plan', style: TextStyle(color: Colors.grey, fontSize: 14)),
                ],
              ),
            ],
          ),
          const Divider(height: 20),
          _buildProfileOption(Icons.settings, 'Account Settings'),
          _buildProfileOption(Icons.bar_chart, 'Activity'),
          _buildProfileOption(Icons.apps, 'Integrations'),
          _buildProfileOption(Icons.help, 'Help Center'),
          const Divider(height: 20),
          _buildProfileOption(Icons.logout, 'Logout'),
        ],
      ),
    );
  }

  Widget _buildProfileOption(IconData icon, String label) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      onTap: () {
        // Action pour chaque option du profil
      },
    );
  }
}
