import 'package:flutter/material.dart';

class InvalidPage extends StatefulWidget {
  @override
  _InvalidPageState createState() => _InvalidPageState();
}

class _InvalidPageState extends State<InvalidPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text("invalid Screen"),
      ),
    );
  }
}
