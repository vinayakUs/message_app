import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:message_app/ui/view/home_view.dart';
import 'package:message_app/ui/view/userdetails_view.dart';
import 'package:message_app/ui/view/welcome_view.dart';
import 'package:message_app/ui/widget/base_widget.dart';
import 'package:message_app/viewmodel/view/startup_viewmodel.dart';
import 'package:provider/provider.dart';

class StartUpView extends StatefulWidget {
  @override
  _StartUpViewState createState() => _StartUpViewState();
}

class _StartUpViewState extends State<StartUpView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget<StartUpViewModel>(
      viewModel: StartUpViewModel(
        fireStoreService: Provider.of(context),
        authenticationService: Provider.of(context),
      ),
      builder: (context, model, child) => StreamBuilder(
        stream: model.startUpLogic(),
        builder: (context, snapshot) {
          print("snap data ${snapshot.data}");
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              child: FlareActor(
                'images/splash.flr',
                fit: BoxFit.scaleDown,
                animation: "Untitled",
              ),
              decoration: BoxDecoration(
                color: Color(0xFF247BA0),
              ),
            );
          } else if (snapshot.data == Status.hasUserData) {
            return HomeView();
          } else if (snapshot.data == Status.notUserData) {
            return UserDetailsView();
          } else if (snapshot.data == Status.noUser) {
            return WelcomeView();
          }
        },
      ),
    );
  }
}
