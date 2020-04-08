import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:lorefinder_ffxiv/theme/MainTheme.dart';
import 'package:lorefinder_ffxiv/utils/ScreenVariable.dart';
import 'package:lorefinder_ffxiv/views/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    ScreenVariables.Init();
    return MaterialApp(
      title: "Moogle Lorefinder",
      theme: mainTheme(),
      home: HomeView(),
    );
  }
}
