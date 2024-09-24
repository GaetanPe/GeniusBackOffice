import 'package:flutter/material.dart';
import 'customListTile.dart';
import 'customExpensionTile.dart';
import 'UserProfileWidget.dart';
import 'ItemListTile.dart';  // Importation de MenuItem

class CustomDrawer extends StatefulWidget {
  final bool isCollapsed;
  final VoidCallback onToggleDrawer;

  const CustomDrawer({super.key, required this.isCollapsed, required this.onToggleDrawer});

  @override
  CustomDrawerState createState() => CustomDrawerState();
}

class CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    double drawerWidth = widget.isCollapsed ? 80 : 250;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: drawerWidth,
      color: const Color.fromARGB(255, 17, 25, 89),
      child: Column(
        children: [
          _buildMenuButton(),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                CustomListTile(
                  icon: Icons.home,
                  label: 'Home',
                  isCollapsed: widget.isCollapsed,
                  onTap: () => Navigator.pushNamed(context, '/'),
                ),
                CustomListTile(
                  icon: Icons.settings,
                  label: 'Settings',
                  isCollapsed: widget.isCollapsed,
                ),
                CustomListTile(
                  icon: Icons.logout,
                  label: 'Logout',
                  isCollapsed: widget.isCollapsed,
                ),
                // Utilisation d'une seule structure pour options et choices
                CustomExpansionTile(
                  title: 'Options ',
                  items: [
                    ItemListTile(name: 'Profil', icon: Icons.person),
                    ItemListTile(name: 'Paramètres', icon: Icons.settings),
                    ItemListTile(name: 'Aide', icon: Icons.help),
                  ],
                  isCollapsed: widget.isCollapsed,
                ),
                CustomExpansionTile(
                  title: 'Choices ',
                  items: [
                    ItemListTile(name: 'Choix A', icon: Icons.check_circle),
                    ItemListTile(name: 'Choix B', icon: Icons.radio_button_checked),
                    ItemListTile(name: 'Choix C', icon: Icons.done),
                  ],
                  isCollapsed: widget.isCollapsed,
                ),
              ],
            ),
          ),
          UserProfileWidget(isCollapsed: widget.isCollapsed),
        ],
      ),
    );
  }

  // Widget pour le bouton du menu burger
  Widget _buildMenuButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8.0),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.white, size: 30),
            onPressed: widget.onToggleDrawer,
          ),
          if (!widget.isCollapsed)
            const Text(
              'Menu',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
        ],
      ),
    );
  }
}
