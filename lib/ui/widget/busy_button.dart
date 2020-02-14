import 'package:flutter/material.dart';

class BusyButton extends StatefulWidget {
  final bool busy;
  final Widget child;
  final Function onPressed;
  final bool enabled;

  const BusyButton(
      {this.busy = false,
      @required this.child,
      @required this.onPressed,
      this.enabled = true});

  @override
  _BusyButtonState createState() => _BusyButtonState();
}

class _BusyButtonState extends State<BusyButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        child: FlatButton(
            child: !widget.busy ? widget.child : CircularProgressIndicator(),
            onPressed: !widget.busy ? widget.onPressed : () {}),
      ),
    );
  }
}
