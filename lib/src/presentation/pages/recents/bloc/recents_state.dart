part of 'recents_bloc.dart';

@immutable
abstract class RecentsState {}

class RecentsInitial extends RecentsState {}

class NoCallHistoryPermission extends RecentsState {}

class LoadingCallHistory extends RecentsState {}

class LoadedCallHistory extends RecentsState {
  final List<CallLogModel> calls;
  LoadedCallHistory(this.calls);
}

class ErrorLoadingCallHistory extends RecentsState {
  final String error;
  ErrorLoadingCallHistory(this.error);
}
