import 'package:get_it/get_it.dart';
import 'package:message_app/services/navigator_service.dart';

GetIt locator = GetIt.I;
void registerLocator() {
  locator.registerLazySingleton(() => NavigatorService());
}
