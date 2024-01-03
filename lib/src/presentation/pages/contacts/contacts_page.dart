import 'package:contacty/src/src.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

import 'widgets/widgets.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Contacts")),
      body: BlocBuilder<ContactsBloc, ContactsState>(
        builder: (context, state) {
          if (state is ContactsInitial) {
            context.read<ContactsBloc>().add(CheckContactsPermission());
            return const SizedBox();
          } else if (state is NoContactsPermission) {
            return _handlePermissions(context);
          } else if (state is LoadingContacts) {
            return const LoadingWidget();
          } else if (state is LoadedContacts) {
            return _handleContacts(state);
          } else if (state is ErrorLoadingContacts) {
            return _handleError(state, context);
          }
          return const SizedBox();
        },
      ),
    );
  }

  NoPermissionWidget _handlePermissions(BuildContext context) {
    return NoPermissionWidget(
      description:
          "This section needs to access the contacts permission allow it to use this section",
      onAllow: () {
        context.read<ContactsBloc>().add(RequestContactsPermission());
      },
    );
  }

  Widget _handleContacts(LoadedContacts state) {
    if (state.contacts.isEmpty) {
      return const Center(child: Text("No Contacts !"));
    }
    return ListView.builder(
      itemCount: state.contacts.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return Header(
            title: "Contacts",
            note: "${state.contacts.length} contact",
          );
        }
        final Contact contact = state.contacts[index - 1];
        return ContactItem(contact: contact);
      },
    );
  }

  ErrorContentWidget _handleError(
    ErrorLoadingContacts state,
    BuildContext context,
  ) {
    return ErrorContentWidget(
      error: "we have got an error when loading contacts\n${state.error}",
      onRetry: () {
        context.read<ContactsBloc>().add(CheckContactsPermission());
      },
    );
  }
}
