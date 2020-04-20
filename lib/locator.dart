import 'package:get_it/get_it.dart';
import 'package:message_app/services/authentication_service.dart';
import 'package:message_app/services/firestore_service.dart';
import 'package:message_app/services/navigator_service.dart';

GetIt locator = GetIt.I;
void registerLocator() {
  locator.registerLazySingleton(() => NavigatorService());
  locator.registerLazySingleton(() => FirestoreService());
  locator.registerLazySingleton(() => AuthenticationService());

}
