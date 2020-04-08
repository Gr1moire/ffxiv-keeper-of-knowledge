import 'package:flutter/material.dart';
import 'package:lorefinder_ffxiv/theme/MainTheme.dart';

import 'package:lorefinder_ffxiv/widgets/AppBar/AppBar.dart';
import 'package:lorefinder_ffxiv/widgets/CenteredView/CenteredView.dart';
import 'package:lorefinder_ffxiv/widgets/ResultsDisplay/ResultsDisplay.dart';

class ResultScreen extends StatelessWidget {
  final String searchString;
  final String xivApiURL =
      'https://xivapi.com/lore?private_key=ad4a062f83684b47993ba57a2e290c09335d9e1f80524e4a9682bc80b60ada9b&language=fr&columns=Context,Text,Source,Data,SourceID&filters=Source=Quest&string=';

  ResultScreen({Key key, @required this.searchString}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String requestURL;

    requestURL = xivApiURL + searchString;
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
