import 'package:contacty/src/core/core.dart';
import 'package:flutter/material.dart';

import 'note_text_widget.dart';

class Header extends StatelessWidget {
  const Header({super.key, required this.title, this.note});
  final String title;
  final String? note;

  @override
  Widget build(BuildContext context) {
    final Text text = Text(title, style: context.textTheme.labelMedium);
    if (note == null) {
      return text;
    }

    return Padding(
      padding: const EdgeInsets.all(12),
      child: note == null
          ? text
          : Row(
              children: [
                text,
                const SizedBox(width: 10),
                NoteText(text: note!),
              ],
            ),
    );
  }
}
