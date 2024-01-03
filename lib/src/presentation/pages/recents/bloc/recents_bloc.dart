import 'dart:async';

import 'package:contacty/src/src.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'recents_event.dart';
part 'recents_state.dart';

class RecentsBloc extends Bloc<RecentsEvent, RecentsState> {
  final ContactsService contactsService;
  final PermissionsService permissionsService;

  RecentsBloc(this.contactsService, this.permissionsService)
      : super(RecentsInitial()) {
    on<CheckCallHistoryPermissions>(checkCallHistoryPermission);
    on<RequestCallHistoryPermissions>(requestCallHistoryPermission);
    on<LoadCallHistory>(loadCallHistory);
  }

  FutureOr<void> checkCallHistoryPermission(event, emit) async {
    if (await permissionsService.checkAllPermissions) {
      await loadCallHistory(event, emit);
    } else {
      emit(NoCallHistoryPermission());
    }
  }

  FutureOr<void> requestCallHistoryPermission(event, emit) async {
    if (await permissionsService.requestAllPermissions) {
      await loadCallHistory(event, emit);
    } else {
      emit(NoContactsPermission());
    }
  }

  FutureOr<void> loadCallHistory(event, emit) async {
    emit(LoadingCallHistory());
    try {
      final List<CallLogModel> calls = await contactsService.getCallLogs();
      emit(LoadedCallHistory(calls));
    } catch (e) {
      emit(ErrorLoadingCallHistory(e.toString()));
    }
  }
}
