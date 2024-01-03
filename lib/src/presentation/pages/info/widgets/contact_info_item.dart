import 'package:contacty/src/src.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ContactInfoItem extends StatelessWidget {
  ContactInfoItem({
    super.key,
    required this.info,
    this.showTime = false,
    required this.percent,
  }) : contact = info.contact;

  final ContactInfoModel info;
  final Contact contact;
  final bool showTime;
  final double percent;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(contact.displayName),
      subtitle: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              NoteText(
                text: showTime
                    ? info.totalDuration.fromat()
                    : "${info.totalCalls} call",
              ),
              const Spacer(),
              Text(
                "${(percent * 100).toStringAsFixed(2)}%",
                style: context.textTheme.labelMedium,
              )
            ],
          ),
          const SizedBox(height: 5),
          LinearPercentIndicator(
            percent: percent,
            padding: EdgeInsets.zero,
            animation: true,
            progressColor: context.colorScheme.primary,
            backgroundColor: context.colorScheme.outlineVariant,
            barRadius: const Radius.circular(100),
          ),
        ],
      ),
      leading: ContactAvatar(
        id: int.parse(contact.id),
        photo: contact.photo,
        displayName: contact.displayName,
      ),
      onTap: () {},
    );
  }
}
