import 'package:contacty/src/src.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/widgets.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Info")),
      body: BlocBuilder<InfoBloc, InfoState>(
        builder: (context, state) {
          if (state is InfoInitial) {
            context.read<InfoBloc>().add(CheckInfoPermissions());
            return const SizedBox();
          } else if (state is NoInfoPermissions) {
            return _handlePermissions(context);
          } else if (state is LoadingInfoData) {
            return const LoadingWidget();
          } else if (state is LoadedInfoData) {
            return _handleContacts(context, state);
          } else if (state is ErrorLoadingInfoData) {
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
        context.read<InfoBloc>().add(RequestInfoPermissions());
      },
    );
  }

  Widget _handleContacts(BuildContext context, LoadedInfoData state) {
    if (state.contactsInfo.isEmpty) {
      return const Center(child: Text("No info data !"));
    }
    return ListView.builder(
      itemCount: state.contactsInfo.length,
      itemBuilder: (context, index) {
        if (index == 0) {
          return Header(
            title: "Top Calls",
            note: "compared to ${state.contactsInfo.totalCalls} call",
          );
        } else if (index < state.contactsInfo.topCalls.length) {
          final ContactInfoModel call = state.contactsInfo.topCalls[index - 1];
          return ContactInfoItem(
            info: call,
            percent: call.totalCalls / state.contactsInfo.totalCalls,
          );
        }
        index -= state.contactsInfo.topCalls.length;
        if (index == 0) {
          return Header(
            title: "Top Talk",
            note: "compared to ${state.contactsInfo.totalDuration.fromat()}",
          );
        }
        final ContactInfoModel call = state.contactsInfo.topTalks[index - 1];
        // debugPrint("$index--");
        return ContactInfoItem(
          info: call,
          showTime: true,
          percent: call.totalDuration.inSeconds /
              state.contactsInfo.totalDuration.inSeconds,
        );
      },
    );
  }

  ErrorContentWidget _handleError(
    ErrorLoadingInfoData state,
    BuildContext context,
  ) {
    return ErrorContentWidget(
      error: "we have got an error when loading info data\n${state.error}",
      onRetry: () {
        context.read<InfoBloc>().add(CheckInfoPermissions());
      },
    );
  }
}
