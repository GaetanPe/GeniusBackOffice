import 'package:flutter/material.dart';

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
          Container(
            padding: const EdgeInsets.all(16.0),
            alignment: Alignment.topLeft,
            child: IconButton(
              icon: Icon(
                widget.isCollapsed ? Icons.menu : Icons.menu_open,
                color: Colors.white,
                size: 30,
              ),
              onPressed: widget.onToggleDrawer,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: const Icon(Icons.home, color: Colors.white),
                  title: widget.isCollapsed
                      ? null
                      : const Text(
                          'Home',
                          style: TextStyle(color: Colors.white),
                        ),
                  onTap: () {
                    Navigator.pushNamed(context, '/');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.settings, color: Colors.white),
                  title: widget.isCollapsed
                      ? null
                      : const Text(
                          'Settings',
                          style: TextStyle(color: Colors.white),
                        ),
                ),
                ListTile(
                  leading: const Icon(Icons.logout, color: Colors.white),
                  title: widget.isCollapsed
                      ? null
                      : const Text(
                          'Logout',
                          style: TextStyle(color: Colors.white),
                        ),
                ),
                if (!widget.isCollapsed) ...[
                  _buildExpansionTile(
                    'Options',
                    ['Option 1', 'Option 2', 'Option 3'],
                  ),
                  const SizedBox(height: 10),
                  _buildExpansionTile(
                    'Choices',
                    ['Choice A', 'Choice B', 'Choice C'],
                  ),
                ],
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/profile_pic.png'),
                  radius: 20,
                ),
                const SizedBox(width: 10),
                if (!widget.isCollapsed) ...[
                  const Column(
                    children: [
                      Text(
                        'Nom de l\'utilisateur',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        'email@exemple.com',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExpansionTile(String title, List<String> options) {
    return ExpansionTile(
      title: Text(title, style: const TextStyle(color: Colors.white)),
      children: options.map((String option) {
        return ListTile(
          title: Text(
            option,
            style: const TextStyle(color: Colors.white),
          ),
          onTap: () {
            // Handle item selection if needed
          },
        );
      }).toList(),
    );
  }
}
