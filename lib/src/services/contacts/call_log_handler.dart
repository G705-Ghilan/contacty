import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'models/models.dart';

class CallLogHandler {
  static const MethodChannel _channel = MethodChannel('com.native.contacty');

  static Future<List<CallLogModel>> getAllCallLogs() async {
    try {
      final List<dynamic> callLogs =
          (await _channel.invokeMethod('getAllCallLogs')) ?? [];
      return callLogs.map<CallLogModel>(toCallLogModel).toList();
    } on PlatformException catch (e) {
      debugPrint("Failed to get call logs: '${e.message}'.");
      return [];
    }
  }

  static CallLogModel toCallLogModel(dynamic data) {
    return CallLogModel.fromMap(Map<String, dynamic>.from(data));
  }
}
