import 'package:flutter/material.dart';
import 'package:lorefinder_ffxiv/theme/MainTheme.dart';

import 'package:lorefinder_ffxiv/widgets/AppBar/AppBar.dart';
import 'package:lorefinder_ffxiv/widgets/CenteredView/CenteredView.dart';
import 'package:lorefinder_ffxiv/widgets/ResultsDisplay/ResultsDisplay.dart';

class ResultScreen extends StatelessWidget {
  static String _pKey =
      "private_key=ad4a062f83684b47993ba57a2e290c09335d9e1f80524e4a9682bc80b60ada9b";
  static String _columns = "columns=Context,Text,Source,Data,SourceID";
  static String _language = "language=fr"; // Eventually won't be static anymore
  static String xivApiURL =
      'https://xivapi.com/lore?$_pKey&$_columns&$_language&string=';
  static String _filter = "filters=Source=";
  final String searchString;
  final int searchType;

  ResultScreen(
      {Key key, @required this.searchString, @required this.searchType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String requestURL;

    switch (searchType) {
      case 0:
        requestURL = xivApiURL + searchString;
        break;
      case 1:
        requestURL = xivApiURL + searchString + "&" + _filter + "Quest";
        break;
      case 2:
        requestURL = xivApiURL + searchString + "&" + _filter + "Item";
        break;
    }

    return MaterialApp(
      title: "Recherche",
      theme: mainTheme(),
      home: Scaffold(
        appBar: MyAppBar().build(context),
        backgroundColor: Colors.grey[900],
        body: CenteredView(
          child: ResultsDisplay(
            requestURL: requestURL,
          ),
        ),
      ),
    );
  }
}
