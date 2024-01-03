part of 'contacts_bloc.dart';

@immutable
abstract class ContactsState {}

class ContactsInitial extends ContactsState {}

class LoadingContacts extends ContactsState {}

class LoadedContacts extends ContactsState {
  final List<Contact> contacts;
  LoadedContacts(this.contacts);
}

class ErrorLoadingContacts extends ContactsState {
  final String error;
  ErrorLoadingContacts(this.error);
}

class NoContactsPermission extends ContactsState {}
