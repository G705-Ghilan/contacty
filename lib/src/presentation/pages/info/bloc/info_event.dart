part of 'info_bloc.dart';

@immutable
abstract class InfoEvent {}

class CheckInfoPermissions extends InfoEvent{}
class RequestInfoPermissions extends InfoEvent{}
class LoadInfoData extends InfoEvent{}