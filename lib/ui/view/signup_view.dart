import 'package:flutter/material.dart';
import 'package:message_app/ui/widget/base_widget.dart';
import 'package:message_app/ui/widget/busy_button.dart';
import 'file:///D:/message_app/lib/ui/viewmodel/signup_viewmodel.dart';

class SignUpView extends StatefulWidget {
  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget<SignUpViewModel>(
      viewModel: SignUpViewModel(),
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(hintText: "email"),
                ),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(hintText: "password"),
                ),
                BusyButton(
                  child: Text("Sign Up"),
                  busy: model.busy,
                  onPressed: () {
                    model.signUp(
                        email: emailController.text,
                        password: passwordController.text);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
