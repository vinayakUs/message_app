import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.of(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
