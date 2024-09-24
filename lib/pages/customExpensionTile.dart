import 'package:flutter/material.dart';
class CustomExpansionTile extends StatelessWidget {
  final String title;
  final List<String> options;
  final bool isCollapsed;

  const CustomExpansionTile({
    Key? key,
    required this.title,
    required this.options,
    required this.isCollapsed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: const Icon(Icons.arrow_right, color: Colors.white),
      title: isCollapsed 
          ? const SizedBox.shrink()
          : Text(title, style: const TextStyle(color: Colors.white)),
      trailing: const SizedBox.shrink(), // Supprime la flèche à droite
      children: isCollapsed
          ? []
          : options.map((String option) {
              return ListTile(
                leading: const Icon(Icons.arrow_right, color: Colors.white),
                title: Text(option, style: const TextStyle(color: Colors.white)),
                onTap: () {
                  // Action pour les options
                },
              );
            }).toList(),
    );
  }
}
