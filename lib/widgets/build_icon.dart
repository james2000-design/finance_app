import 'package:flutter/material.dart';

Widget buildIcon(Object icon) {
  if (icon is AssetImage) {
    return CircleAvatar(
      backgroundColor: const Color.fromARGB(255, 181, 170, 170),
      radius: 24,
      backgroundImage: icon,
    );
  } else if (icon is IconData) {
    return CircleAvatar(
      backgroundColor: Colors.grey[200],
      radius: 24,
      child: Icon(icon, color: Colors.deepPurple),
    );
  } else {
    return const CircleAvatar(
      backgroundColor: Colors.grey,
      child: Icon(Icons.help_outline),
    );
  }
}
