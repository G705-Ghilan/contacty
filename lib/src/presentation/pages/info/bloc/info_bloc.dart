import 'dart:async';

import 'package:contacty/src/src.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'info_event.dart';
part 'info_state.dart';

class InfoBloc extends Bloc<InfoEvent, InfoState> {
  final ContactsService contactsService;
  final PermissionsService permissionsService;

  InfoBloc(this.contactsService, this.permissionsService)
      : super(InfoInitial()) {
    on<CheckInfoPermissions>(checkInfoPermission);
    on<RequestInfoPermissions>(requestInfoPermission);
    on<LoadInfoData>(loadInfoData);
  }

  FutureOr<void> checkInfoPermission(event, emit) async {
    if (await permissionsService.checkAllPermissions) {
      await loadInfoData(event, emit);
    } else {
      emit(NoInfoPermissions());
    }
  }

  FutureOr<void> requestInfoPermission(event, emit) async {
    if (await permissionsService.requestAllPermissions) {
      await loadInfoData(event, emit);
    } else {
      emit(NoInfoPermissions());
    }
  }

  FutureOr<void> loadInfoData(event, emit) async {
    emit(LoadingInfoData());
    try {
      emit(LoadedInfoData(await contactsService.getContactsInfo()));
    } catch (e) {
      emit(ErrorLoadingInfoData(e.toString()));
    }
  }
}
