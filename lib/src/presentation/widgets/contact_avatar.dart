import 'dart:typed_data';

import 'package:flutter/material.dart';

class ContactAvatar extends StatelessWidget {
  const ContactAvatar({
    super.key,
    required this.id,
    this.photo,
    required this.displayName,
  });

  final Uint8List? photo;
  final int id;
  final String displayName;

  @override
  Widget build(BuildContext context) {
    if (photo != null) {
      return CircleAvatar(backgroundImage: MemoryImage(photo!));
    }
    Color color = Colors.primaries[id % Colors.primaries.length].shade500;

    return CircleAvatar(
      backgroundColor: Colors.transparent,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: color.withOpacity(0.5), width: 3.7),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Text(
          displayName[0],
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: color,
          ),
        ),
      ),
    );
  }
}
