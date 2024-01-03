part of 'info_bloc.dart';

@immutable
abstract class InfoState {}

class InfoInitial extends InfoState {}

class NoInfoPermissions extends InfoState {}

class LoadingInfoData extends InfoState {}

class LoadedInfoData extends InfoState {
  final ContactsInfo contactsInfo;
  LoadedInfoData(this.contactsInfo);
}

class ErrorLoadingInfoData extends InfoState {
  final String error;
  ErrorLoadingInfoData(this.error);
}
