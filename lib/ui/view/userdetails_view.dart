import 'package:flutter/material.dart';
import 'package:message_app/ui/widget/base_widget.dart';
import 'package:message_app/ui/widget/busy_button.dart';
import 'file:///D:/message_app/lib/ui/viewmodel/userdetails_viewmodel.dart';

class UserDetailsView extends StatefulWidget {
  @override
  _UserDetailsViewState createState() => _UserDetailsViewState();
}

class _UserDetailsViewState extends State<UserDetailsView> {
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _userNameController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseWidget<UserDetailsViewModel>(
      viewModel: UserDetailsViewModel(),
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _nameController,
                decoration: InputDecoration(hintText: "Name"),
              ),
              TextField(
                controller: _userNameController,
                decoration: InputDecoration(hintText: "Username"),
              ),
              BusyButton(
                child: Text("finish"),
                busy: model.busy,
                onPressed: () {
                  model.finish(
                    name: _nameController.text,
                    userName: _userNameController.text,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
