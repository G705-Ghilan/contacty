import 'package:contacty/src/src.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

class ContactInfoModel {
  final Contact contact;
  final Duration totalDuration;
  final int totalCalls;

  ContactInfoModel({
    required this.contact,
    required this.totalDuration,
    required this.totalCalls,
  });

  factory ContactInfoModel.fromCallLog(CallLogModel call) {
    return ContactInfoModel(
      contact: call.contact!,
      totalDuration: call.duration,
      totalCalls: call.calls,
    );
  }

  ContactInfoModel mergeWithCallLog(CallLogModel call) {
    return ContactInfoModel(
      contact: contact,
      totalDuration: totalDuration + call.duration,
      totalCalls: totalCalls + call.calls,
    );
  }

  @override
  String toString() {
    return "ContactInfoModel(contact: ..., totalDuration: $totalDuration, totalCalls: $totalCalls)";
  }
}
