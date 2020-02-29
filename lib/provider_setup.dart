import 'package:message_app/services/authentication_service.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'services/authentication_service.dart';
import 'services/firestore_service.dart';

List<SingleChildWidget> provider = [
  ...independentServices,
  ...dependentServices,
  ...uiConsumableProviders,
];
List<SingleChildWidget> independentServices = [
  Provider(create: (_) => FirestoreService()),
];

List<SingleChildWidget> dependentServices = [
  ProxyProvider0<AuthenticationService>(
    update: (context, authenticationService) {
      final a = Provider.of<FirestoreService>(context);
      return AuthenticationService(fireStoreService: a);
    },
  ),
];
List<SingleChildWidget> uiConsumableProviders = [];
