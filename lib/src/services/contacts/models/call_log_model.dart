import 'package:flutter_contacts/flutter_contacts.dart';

import 'call_type.dart';

class CallLogModel {
  final DateTime date;
  final Duration duration;
  final String number;
  final CallType callType;
  final String id;
  final int calls;
  bool islastOfRange;
  Contact? contact;

  CallLogModel({
    required this.date,
    required this.duration,
    required this.number,
    required this.callType,
    required this.id,
    this.islastOfRange = false,
    this.calls = 1,
    this.contact,
  });

  factory CallLogModel.fromMap(Map<String, dynamic> map) {
    return CallLogModel(
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
      duration: Duration(seconds: map['duration']),
      number: map['number'].toString(),
      callType: CallType.values[map['type']],
      id: map['id'],
    );
  }

  @override
  String toString() {
    return 'Date: ${date.toString()}, Duration: $duration seconds, Number: $number, Type: $callType, id: $id';
  }

  operator +(CallLogModel other) {
    return CallLogModel(
      date: date,
      duration: duration + other.duration,
      number: number,
      callType: callType,
      id: id,
      calls: calls + other.calls,
      contact: contact ?? other.contact,
    );
  }

  bool equal(CallLogModel other) {
    if (contact != null && other.contact != null) {
      return contact!.id == other.contact!.id ;
    }
    return  number == number;
  }

  bool equalToContact(Contact contact) {
    final Phone? phone = contact.phones.firstOrNull;
    if (phone != null) {
      return phone.number == number || phone.normalizedNumber == number;
    }
    return false;
  }
}
