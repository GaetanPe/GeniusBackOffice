import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  final bool isCollapsed;
  final VoidCallback onToggleDrawer;

  const CustomDrawer({super.key, required this.isCollapsed, required this.onToggleDrawer});

  @override
  CustomDrawerState createState() => CustomDrawerState();
}

class CustomDrawerState extends State<CustomDrawer> {
  // Example values for dropdowns
  String selectedOption1 = 'Option 1';
  String selectedOption2 = 'Choice A';

  // Fonction pour générer un DropdownButton réutilisable
  Widget _buildDropdown(List<String> options, String selectedValue, ValueChanged<String?> onChanged) {
    return DropdownButton<String>(
      value: selectedValue,
      onChanged: onChanged,
      icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
      dropdownColor: const Color.fromARGB(255, 22, 29, 72),
      underline: Container(),
      items: options.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: const TextStyle(color: Colors.white),
          ),
        );
      }).toList(),
    );
  }

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
                if (!widget.isCollapsed)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        // Utilisation de la fonction _buildDropdown pour les deux dropdowns
                        _buildDropdown(
                          ['Option 1', 'Option 2', 'Option 3'],
                          selectedOption1,
                          (newValue) {
                            setState(() {
                              selectedOption1 = newValue ?? selectedOption1;
                            });
                          },
                        ),
                        const SizedBox(height: 10),
                        _buildDropdown(
                          ['Choice A', 'Choice B', 'Choice C'],
                          selectedOption2,
                          (newValue) {
                            setState(() {
                              selectedOption2 = newValue ?? selectedOption2;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
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
}
