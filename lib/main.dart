import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'contacty.dart';
import 'dependency_injection.dart';
import 'src/src.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await serviceLocator();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GetIt.instance<ContactsBloc>()),
        BlocProvider(create: (context) => GetIt.instance<RecentsBloc>()),
        BlocProvider(create: (context) => GetIt.instance<InfoBloc>()),
      ],
      child: const ContactyApp(),
    ),
  );
}
