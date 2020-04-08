import 'package:flutter/material.dart';

class MyOutlineButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final bool focus;

  const MyOutlineButton({
    Key key,
    @required this.text,
    @required this.onPressed,
    this.focus = false,
  }) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    return OutlineButton(
        focusNode: FocusNode(canRequestFocus: focus),
        color: Colors.deepPurpleAccent,
        disabledBorderColor: Colors.deepPurpleAccent,
        highlightedBorderColor: Colors.grey[200],
        borderSide: BorderSide(color: Colors.deepPurpleAccent, style: BorderStyle.solid, width: 2.2),
        disabledTextColor: Colors.grey[200],
        highlightColor: Colors.deepPurpleAccent,
        onPressed: onPressed,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.grey[200],
          ),
        ));
  }
}
