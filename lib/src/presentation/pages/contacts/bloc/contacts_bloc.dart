import 'dart:async';

import 'package:contacty/src/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

part 'contacts_event.dart';
part 'contacts_state.dart';

class ContactsBloc extends Bloc<ContactsEvent, ContactsState> {
  final ContactsService contactsService;
  final PermissionsService permissionsService;

  ContactsBloc(this.contactsService, this.permissionsService)
      : super(ContactsInitial()) {
    on<CheckContactsPermission>(checkContactsPermission);
    on<RequestContactsPermission>(requestContactsPermission);
    on<LoadContacts>(loadContacts);
  }

  FutureOr<void> checkContactsPermission(event, emit) async {
    if (await permissionsService.checkContactsPermission) {
      await loadContacts(event, emit);
    } else {
      emit(NoContactsPermission());
    }
  }

  FutureOr<void> requestContactsPermission(event, emit) async {
    if (await permissionsService.requestContactsPermission()) {
      await loadContacts(event, emit);
    } else {
      emit(NoContactsPermission());
    }
  }

  FutureOr<void> loadContacts(event, emit) async {
    emit(LoadingContacts());
    try {
      final List<Contact> contacts = await contactsService.getContacts();
      emit(LoadedContacts(contacts));
    } catch (e) {
      emit(ErrorLoadingContacts(e.toString()));
    }
  }
}
