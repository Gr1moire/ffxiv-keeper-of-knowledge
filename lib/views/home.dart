import 'package:flutter/material.dart';

import 'package:lorefinder_ffxiv/widgets/AppBar/AppBar.dart';
import 'package:lorefinder_ffxiv/widgets/CenteredView/CenteredView.dart';
import 'package:lorefinder_ffxiv/widgets/Forms/SearchForm.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar().build(context),
        backgroundColor: Colors.grey[900],
        body: CenteredView(
          child: SearchForm(),
        ),
    );
  }
}