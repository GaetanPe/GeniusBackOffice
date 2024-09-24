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
      leading: const Icon(Icons.arrow_right, color: Colors.white), // Icône principale pour l'ExpansionTile
      title: isCollapsed 
          ? const SizedBox.shrink()  // Cache le titre quand isCollapsed est true
          : Text(
              title,
              style: const TextStyle(color: Colors.white),
            ),
      trailing: const SizedBox.shrink(), // Supprime la flèche à droite
      children: options.map((String option) {
        return ListTile(
          leading: const Icon(Icons.access_alarm, color: Colors.white), // Icône pour chaque option interne
          title: isCollapsed
              ? const SizedBox.shrink()  // Cache le texte de chaque option si isCollapsed est true
              : Text(
                  option,
                  style: const TextStyle(color: Colors.white),
                ),
          onTap: () {
            // Action pour chaque option
          },
        );
      }).toList(),
    );
  }
}
