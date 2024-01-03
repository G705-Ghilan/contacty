import 'package:contacty/src/src.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/widgets.dart';

class RecentsPage extends StatelessWidget {
  const RecentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Recents")),
      body: BlocBuilder<RecentsBloc, RecentsState>(
        builder: (context, state) {
          if (state is RecentsInitial) {
            context.read<RecentsBloc>().add(CheckCallHistoryPermissions());
            return const SizedBox();
          } else if (state is NoCallHistoryPermission) {
            return _handlePermissions(context);
          } else if (state is LoadingCallHistory) {
            return const LoadingWidget();
          } else if (state is LoadedCallHistory) {
            return _handleContacts(state);
          } else if (state is ErrorLoadingCallHistory) {
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
          "This section needs to access the call logs, contacts permissions allow it to use this section",
      onAllow: () {
        context.read<RecentsBloc>().add(RequestCallHistoryPermissions());
      },
    );
  }

  Widget _handleContacts(LoadedCallHistory state) {
    if (state.calls.isEmpty) {
      return const Center(child: Text("No call history !"));
    }
    return ListView.builder(
      itemCount: state.calls.length,
      itemBuilder: (context, index) {
        final CallLogModel call = state.calls[index];
        if (call.islastOfRange) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  call.date.fullTimeFotmat,
                  style: context.textTheme.labelMedium,
                ),
              ),
              CallItem(call: call),
            ],
          );
        }
        return CallItem(call: call);
      },
    );
  }

  ErrorContentWidget _handleError(
    ErrorLoadingCallHistory state,
    BuildContext context,
  ) {
    return ErrorContentWidget(
      error: "we have got an error when loading call history\n${state.error}",
      onRetry: () {
        context.read<RecentsBloc>().add(CheckCallHistoryPermissions());
      },
    );
  }
}
