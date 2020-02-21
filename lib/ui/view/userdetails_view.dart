import 'package:flutter/material.dart';
import 'package:message_app/ui/widget/base_widget.dart';
import 'package:message_app/viewmodel/view/userdetails_viewmodel.dart';
import 'package:provider/provider.dart';

class UserDetailsView extends StatefulWidget {
  @override
  _UserDetailsViewState createState() => _UserDetailsViewState();
}

class _UserDetailsViewState extends State<UserDetailsView> {
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _userNameController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      viewModel: UserDetailsViewModel(
        fireStoreService: Provider.of(context),
        authenticationService: Provider.of(context),
      ),
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
              TextField(),
              FlatButton(
                onPressed: model.finish,
                child: Text("Finish"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
