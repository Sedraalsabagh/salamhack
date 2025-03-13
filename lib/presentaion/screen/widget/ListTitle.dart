import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const MyListTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: const Color.fromARGB(255, 96, 102, 106)),

      title: Text(title, style: const TextStyle(fontSize: 14)),
      //   trailing: const Icon(Icons.arrow_forward_ios,
      //     size: 16, color: Color.fromARGB(255, 107, 105, 105)),
      onTap: onTap,
    );
  }
}
