import 'package:flutter/material.dart';

class SearchButtons extends StatefulWidget {
  SearchButtons({Key key}) : super(key: key);

  @override
  _SearchButtonsState createState() => _SearchButtonsState();
}

class _SearchButtonsState extends State<SearchButtons> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Row(
         children: [
           OutlineButton(onPressed: null)
         ]
       ),
    );
  }
}