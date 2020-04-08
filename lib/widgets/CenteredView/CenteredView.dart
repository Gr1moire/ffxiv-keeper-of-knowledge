//
//  Widget centering view
//

import 'package:flutter/material.dart';
import 'package:lorefinder_ffxiv/utils/ScreenVariable.dart';

class CenteredView extends StatelessWidget {
  final Widget child;
  const CenteredView({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: ScreenVariables.dblScreenWidth * 0.01, right: ScreenVariables.dblScreenWidth * 0.01, top: 50),
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 1200),
        child: child,
      )
    );
  }
}