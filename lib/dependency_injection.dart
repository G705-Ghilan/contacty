import 'package:contacty/src/src.dart';
import 'package:get_it/get_it.dart';

Future<void> serviceLocator() async {
  final sl = GetIt.instance;
  
  // services
  sl.registerFactory(() => ContactsService());
  sl.registerFactory(() => PermissionsService());

  // blocs
  sl.registerFactory(() => ContactsBloc(sl(), sl()));
  sl.registerFactory(() => RecentsBloc(sl(), sl()));
  sl.registerFactory(() => InfoBloc(sl(), sl()));
}
