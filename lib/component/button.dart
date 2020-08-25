import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class BuildButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  BuildButton({@required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: CupertinoButton(
          child: Text(text, style: TextStyle(color: Color(0xff616161))),
          color: Color(0xffeeeeee),
          onPressed: onPressed),
    );
  }
}
