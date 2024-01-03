import 'package:contacty/src/core/core.dart';
import 'package:contacty/src/services/contacts/contacts_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

import 'call_log_handler.dart';
import 'models/models.dart';

class ContactsService {
  List<Contact>? _contacts;
  List<CallLogModel>? _calls;
  ContactsInfo? _contactsInfo;

  Future<List<Contact>> getContacts() async {
    _contacts ??= await FlutterContacts.getContacts(
      withPhoto: true,
      withProperties: true,
    );
    return _contacts ?? [];
  }

  Future<List<CallLogModel>> getCallLogs() async {
    if (_calls != null) return _calls!;

    final List<CallLogModel> calls = await CallLogHandler.getAllCallLogs();
    if (calls.isEmpty) return calls;

    await getContacts();

    _calls = calls.map<CallLogModel>(findCallContact).toList();
    debugPrint(_calls.toString());
    _calls = formatCallsDateTime(_calls!);

    return _calls!;
  }

  Future<ContactsInfo> getContactsInfo() async {
    if (_contactsInfo != null) return _contactsInfo!;
    if (_calls == null) await getCallLogs();
    _contactsInfo = ContactsInfo();
    _contactsInfo!.fillterContacts(_calls!);
    return _contactsInfo!;
  }

  CallLogModel findCallContact(CallLogModel call) {
    int index = _contacts!.indexWhere(call.equalToContact);
    if (index >= 0) call.contact = _contacts![index];
    return call;
  }

  List<CallLogModel> formatCallsDateTime(List<CallLogModel> calls) {
    Map<String, List<CallLogModel>> formattedDays = {};
    for (CallLogModel call in calls) {
      final String key = call.date.normatFormat;
      if (formattedDays.containsKey(key)) {
        if (formattedDays[key]!.last.equal(call)) {
          formattedDays[key]!.last = formattedDays[key]!.last + call;
        } else {
          formattedDays[key]!.add(call);
        }
      } else {
        formattedDays[key] = [call];
      }
    }

    final List<CallLogModel> formattedCallLogs = [];
    for (List<CallLogModel> callLogs in formattedDays.values) {
      callLogs.first.islastOfRange = true;
      formattedCallLogs.addAll(callLogs);
    }
    return formattedCallLogs;
  }
}
