import 'package:flutter/material.dart';
import 'package:lorefinder_ffxiv/widgets/Forms/SearchForm.dart';

class SelectSearchCategory extends StatefulWidget {
  final int searchType;
  final void Function(int value) parentAction;

  SelectSearchCategory({Key key, this.searchType, this.parentAction}) : super(key: key);

  @override
  _SelectSearchCategoryState createState() => _SelectSearchCategoryState();
}

class _SelectSearchCategoryState extends State<SelectSearchCategory> {
  int _radioValue = 0;

  void _radioOnChange(int value) {
    _radioValue = value;

    widget.parentAction(value);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Radio(
          value: 0,
          groupValue: _radioValue,
          onChanged: _radioOnChange,
          activeColor: Colors.deepPurpleAccent,
          focusColor: Colors.deepPurpleAccent,
        ),
        Text(
          "Tout",
          style: TextStyle(color: Colors.grey[200]),
        ),
        Radio(
          value: 1,
          groupValue: _radioValue,
          onChanged: _radioOnChange,
          activeColor: Colors.deepPurpleAccent,
          focusColor: Colors.deepPurpleAccent,
        ),
        Text(
          "Quêtes",
          style: TextStyle(color: Colors.grey[200]),
        ),
        Radio(
          value: 2,
          groupValue: _radioValue,
          onChanged: _radioOnChange,
          activeColor: Colors.deepPurpleAccent,
          focusColor: Colors.deepPurpleAccent,
        ),
        Text(
          "Objets",
          style: TextStyle(color: Colors.grey[200]),
        ),
        SizedBox(width: 30,)
      ],
    ));
  }
}
