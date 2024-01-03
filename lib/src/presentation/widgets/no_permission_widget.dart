import 'package:contacty/src/core/core.dart';
import 'package:contacty/src/presentation/widgets/base_note_widget.dart';
import 'package:flutter/material.dart';

class NoPermissionWidget extends StatelessWidget {
  const NoPermissionWidget({
    super.key,
    required this.description,
    this.onAllow,
  });
  final String description;
  final void Function()? onAllow;

  @override
  Widget build(BuildContext context) {
    return BaseNoteWidget(
      title: "Permission Required",
      label: "Allow",
      subtitle: description,
      containerColor: context.colorScheme.secondary,
      textColor: context.colorScheme.onSecondary,
      onTap: onAllow,
    );
  }
}
