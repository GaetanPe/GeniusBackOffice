import 'package:flutter/material.dart';

class UserProfileDialog extends StatelessWidget {
  const UserProfileDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final drawerWidth = screenWidth * 0.13; 
    
    return Stack(
      children: [
        Positioned(
          left: drawerWidth, // Dynamique par rapport à la largeur du Drawer
          bottom: screenHeight * 0.01, // X% du haut de l'écran
          child: Material(
            color: Colors.transparent,
            child: Container(
              width: screenWidth * 0.2, //X% de la largeur de l'écran pour le dialogue 
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey[300],
                      radius: 20,
                    ),
                    title: const Text(
                      "Nom de l'utilisateur",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Divider(),
                  _buildMenuItem(
                    icon: Icons.settings,
                    label: "Account Settings",
                  ),
                  _buildMenuItem(
                    icon: Icons.bar_chart,
                    label: "Activity",
                  ),
                  _buildMenuItem(
                    icon: Icons.apps,
                    label: "Integrations",
                  ),
                  _buildMenuItem(
                    icon: Icons.help,
                    label: "Help Center",
                  ),
                  const Divider(),
                  _buildMenuItem(
                    icon: Icons.logout,
                    label: "Logout",
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMenuItem({required IconData icon, required String label}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.black54),
          const SizedBox(width: 10),
          Text(label, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
