import 'package:flutter/material.dart';
import 'package:message_app/ui/widget/base_widget.dart';
import 'file:///D:/message_app/lib/ui/viewmodel/home_viewmodel.dart';

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
          floatingActionButtonLocation:
              FloatingActionButtonLocation.endFloat,
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
          ),
          bottomNavigationBar: BottomAppBar(
            shape: CircularNotchedRectangle(),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(Icons.add_circle_outline)
              ],
            ),
            color: Colors.blueGrey,
          ),
          body: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
//                  IconButton(
//                    icon: Icon(Icons.search),
//                  ),
                  CircleAvatar(
                    child: Icon(Icons.account_circle),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
