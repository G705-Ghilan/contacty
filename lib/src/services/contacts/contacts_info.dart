import 'package:contacty/src/src.dart';

class ContactsInfo {
  List<ContactInfoModel>? _info;
  int totalCalls = 0;
  Duration totalDuration = Duration.zero;
  List<ContactInfoModel> topCalls = [];
  List<ContactInfoModel> topTalks = [];

  List<ContactInfoModel> fillterContacts(List<CallLogModel> calls) {
    if (_info != null) {
      return _info!;
    }
    totalCalls = calls.length;
    final Map<String, ContactInfoModel> filteredData = {};
    for (CallLogModel call in calls) {
      if (call.contact == null) continue;
      totalDuration += call.duration;
      final String id = call.contact!.id;
      if (filteredData.containsKey(id)) {
        filteredData[id] = filteredData[id]!.mergeWithCallLog(call);
      } else {
        filteredData[id] = ContactInfoModel.fromCallLog(call);
      }
    }
    _info = filteredData.values.toList();
    topCalls = getLast(
      _info!..sort((a, b) => b.totalCalls.compareTo(a.totalCalls)),
      11,
    );
    topTalks = getLast(
      _info!..sort((a, b) => b.totalDuration.compareTo(a.totalDuration)),
      11,
    );
    return _info!;
  }

  List<T> getLast<T>(List<T> array, int length) {
    if (array.length > length) {
      return array.sublist(0, length);
    }
    return array;
  }

  bool get isEmpty => topTalks.isEmpty && topCalls.isEmpty;
  int get length => topTalks.length + topCalls.length;
}
