import 'package:flutter/material.dart';
import 'customListTile.dart';
import 'customExpensionTile.dart';
import 'UserProfileWidget.dart';

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
                CustomExpansionTile(
                  title: 'Options',
                  options: ['Option 1', 'Option 2', 'Option 3'],
                  isCollapsed: widget.isCollapsed,
                ),
                CustomExpansionTile(
                  title: 'Choices',
                  options: ['Choice A', 'Choice B', 'Choice C'],
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
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
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
