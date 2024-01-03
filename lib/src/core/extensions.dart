import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

extension BuildContextExtension on BuildContext {
  // theme short-calls
  ThemeData get theme => Theme.of(this);
  ColorScheme get colorScheme => theme.colorScheme;
  TextTheme get textTheme => theme.textTheme;

  Color get surfaceContainer {
    return ElevationOverlay.applySurfaceTint(
      colorScheme.surface,
      colorScheme.surfaceTint,
      3.0,
    );
  }

  SystemUiOverlayStyle get sysOverlayStyle {
    return SystemUiOverlayStyle(
      systemNavigationBarIconBrightness: theme.brightness == Brightness.dark
          ? Brightness.light
          : Brightness.dark,
      systemNavigationBarColor: surfaceContainer,
    );
  }
}

extension DurationExtension on Duration {
  String fromat() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(inSeconds.remainder(60));
    return "${twoDigits(inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }
}

extension DateTimeExtension on DateTime {
  String get timeOnlyFormat {
    return DateFormat('hh:mm a').format(this);
  }

  String get fullTimeFotmat {
    final today = DateTime.now();
    final yesterday = today.subtract(const Duration(days: 1));

    if (normatFormat == today.normatFormat) {
      return 'Today';
    } else if (normatFormat == yesterday.normatFormat) {
      return 'Yesterday';
    } else {
      return DateFormat('MMMM d, yyyy').format(this);
    }
  }

  String get normatFormat {
    return DateFormat('yyyy/M/d').format(this);
  }
}

extension StringExtension on String {
  String get debug => "${substring(0, length ~/ 2.8)}...";
}
