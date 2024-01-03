import 'package:contacty/src/core/core.dart';
import 'package:flutter/material.dart';

class BaseNoteWidget extends StatelessWidget {
  const BaseNoteWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.label,
    this.onTap,
    required this.containerColor,
    required this.textColor,
  });
  final String title;
  final String subtitle;
  final String label;
  final void Function()? onTap;
  final Color containerColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: containerColor,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: context.textTheme.titleMedium?.copyWith(
                    color: textColor,
                  ),
                ),
                Text(
                  subtitle,
                  textAlign: TextAlign.center,
                  style: context.textTheme.labelMedium?.copyWith(
                    color: textColor,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          FilledButton(
            onPressed: onTap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(label),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
