import 'package:flutter/material.dart';
import 'package:message_app/ui/widget/base_widget.dart';
import 'package:message_app/viewmodel/view/home_viewmodel.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<HomeViewModel>(
      viewModel: HomeViewModel(),
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          body: Column(
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  model.getcurr();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
