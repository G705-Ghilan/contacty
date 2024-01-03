import 'package:contacty/src/src.dart';
import 'package:flutter/material.dart';

enum CallType {
  incoming(Icons.call_received),
  outgoing(Icons.phone_callback_rounded),
  missed(Icons.phone_missed),
  voiceMail(Icons.voicemail),
  rejected(Icons.call_end),
  blocked(Icons.block),
  answeredExternally(Icons.phone_forwarded),
  unknown(Icons.help_outline),
  wifiIncoming(Icons.wifi_calling),
  wifiOutgoing(Icons.wifi_calling);

  final IconData icon;
  const CallType(this.icon);
}

Color getCallTypeColor(BuildContext context, CallType type) {
  switch (type) {
    case CallType.incoming:
      return context.colorScheme.primary;
    case CallType.outgoing:
      return context.colorScheme.primary;
    case CallType.missed:
      return context.colorScheme.error;
    case CallType.voiceMail:
      return context.colorScheme.outline;
    case CallType.rejected:
      return context.colorScheme.outline;
    case CallType.blocked:
      return context.colorScheme.error;
    case CallType.answeredExternally:
      return context.colorScheme.primary;
    case CallType.unknown:
      return context.colorScheme.primary;
    case CallType.wifiIncoming:
      return context.colorScheme.primary;
    case CallType.wifiOutgoing:
      return context.colorScheme.error;
    default:
      return context.colorScheme.outline;
  }
}
