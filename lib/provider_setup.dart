import 'package:message_app/services/authentication_service.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> provider = [
  ...independentServices,
  ...dependentServices
];
List<SingleChildWidget> independentServices = [
  Provider(create: (_) => AuthenticationService())
];

List<SingleChildWidget> dependentServices = [];
