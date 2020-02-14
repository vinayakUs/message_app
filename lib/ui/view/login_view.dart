import 'package:flutter/material.dart';
import 'package:message_app/ui/widget/busy_button.dart';
import 'package:message_app/viewmodel/view/login_viewmodel.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginViewModel>.value(
      value: LoginViewModel(authenticationService: Provider.of(context)),
      child: Consumer<LoginViewModel>(
        builder: (context, model, child) => SafeArea(
          child: Scaffold(
            body: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  controller: _emailController,
                ),
                TextField(
                  controller: _passwordController,
                ),
                BusyButton(
                  child: Text("Login"),
                  onPressed: () {
                    model.login(
                        email: _emailController.text,
                        password: _passwordController.text);
                  },
                  busy: model.busy,
                )
              ],
            )),
          ),
        ),
      ),
    );
  }
}
