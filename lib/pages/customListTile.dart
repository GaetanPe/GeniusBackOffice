import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isCollapsed;
  final VoidCallback? onTap;

  const CustomListTile({
    Key? key,
    required this.icon,
    required this.label,
    required this.isCollapsed,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: isCollapsed ? null : Text(label, style: const TextStyle(color: Colors.white)),
      onTap: onTap,
    );
  }
}
