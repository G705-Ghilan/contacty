import 'package:contacty/src/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

class ContactItem extends StatelessWidget {
  const ContactItem({
    super.key,
    required this.contact,
  });

  final Contact contact;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(contact.displayName),
      subtitle: Text(contact.phones.firstOrNull?.number ?? "?"),
      leading: ContactAvatar(
        id: int.parse(contact.id),
        photo: contact.photo,
        displayName: contact.displayName,
      ),
      trailing: contact.isStarred ? const Icon(Icons.star_rounded) : null,
      onTap: () {},
    );
  }
}
