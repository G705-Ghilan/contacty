import 'package:permission_handler/permission_handler.dart';

class PermissionsService {
  Future<bool> get checkCallLogsPermission async {
    return (await Permission.phone.status).isGranted;
  }

  Future<bool> get checkContactsPermission async {
    return (await Permission.contacts.status).isGranted;
  }

  Future<bool> requestCallLogsPermission() async {
    return (await Permission.phone.request()).isGranted;
  }

  Future<bool> requestContactsPermission() async {
    return (await Permission.contacts.request()).isGranted;
  }

  Future<bool> get checkAllPermissions async {
    return await checkCallLogsPermission && await checkContactsPermission;
  }

  Future<bool> get requestAllPermissions async {
    return await requestCallLogsPermission() &&
        await requestContactsPermission();
  }
}
