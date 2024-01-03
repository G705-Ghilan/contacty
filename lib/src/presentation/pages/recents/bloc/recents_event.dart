part of 'recents_bloc.dart';

@immutable
abstract class RecentsEvent {}

class CheckCallHistoryPermissions extends RecentsEvent {}

class RequestCallHistoryPermissions extends RecentsEvent {}

class LoadCallHistory extends RecentsEvent {}
