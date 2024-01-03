part of 'contacts_bloc.dart';

@immutable
abstract class ContactsEvent {}

class CheckContactsPermission extends ContactsEvent {}
class RequestContactsPermission extends ContactsEvent {}
class LoadContacts extends ContactsEvent {}
