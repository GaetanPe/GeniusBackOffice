import 'package:flutter/material.dart';
import 'ItemListTile.dart';  

class CustomExpansionTile extends StatelessWidget {
  final String title;
  final List<ItemListTile> items;  
  final bool isCollapsed;

  const CustomExpansionTile({
    Key? key,
    required this.title,
    required this.items,  // Liste flexible
    required this.isCollapsed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: const Icon(Icons.arrow_right, color: Colors.white),
      title: isCollapsed
          ? const SizedBox.shrink()
          : Text(
              title,
              style: const TextStyle(color: Colors.white),
            ),
      trailing: const SizedBox.shrink(),
      children: items.map((ItemListTile item) {
        return ListTile(
          leading: Icon(item.icon, color: Colors.white),  // Icône personnalisée
          title: isCollapsed
              ? const SizedBox.shrink()
              : Text(
                  item.name,  // Nom personnalisé
                  style: const TextStyle(color: Colors.white),
                ),
          onTap: () {
            // Action personnalisée pour chaque item
          },
        );
      }).toList(),
    );
  }
}
