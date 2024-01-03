import 'package:contacty/src/src.dart';
import 'package:flutter/material.dart';

class CallItem extends StatelessWidget {
  const CallItem({super.key, required this.call});

  final CallLogModel call;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      title: Text(call.contact?.displayName ?? call.number),
      subtitle: Row(
        children: [
          Icon(
            call.callType.icon,
            size: 15,
            color: getCallTypeColor(context, call.callType),
          ),
          const SizedBox(width: 10),
          Text(call.date.timeOnlyFormat),
          if (call.calls > 1) ...[
            const SizedBox(width: 5),
            NoteText(text: "${call.calls} call"),
          ]
        ],
      ),
      trailing: Text(call.duration.fromat()),
      leading: ContactAvatar(
        id: int.parse(call.contact?.id ?? call.id),
        photo: call.contact?.photo,
        displayName: call.contact?.displayName ?? "?",
      ),
    );
  }
}
