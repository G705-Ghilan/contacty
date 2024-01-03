import 'package:contacty/src/src.dart';
import 'package:flutter/material.dart';

import 'base_note_widget.dart';

class ErrorContentWidget extends StatelessWidget {
  const ErrorContentWidget({
    super.key,
    required this.error,
    this.onRetry,
  });
  final String error;
  final void Function()? onRetry;

  @override
  Widget build(BuildContext context) {
    return BaseNoteWidget(
      title: "Ooops",
      label: "Retry",
      subtitle: error,
      containerColor: context.colorScheme.error,
      textColor: context.colorScheme.onError,
      onTap: onRetry,
    );
  }
}
