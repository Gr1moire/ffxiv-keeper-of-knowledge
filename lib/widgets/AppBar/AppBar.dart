//
//  AppBar design
//

import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({Key key}) : super(key: key);

  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      actions: <Widget>[],
      title: RichText(
        text: TextSpan(
          text: "Keeper of Knowledge\t",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
          children: <TextSpan>[
            TextSpan(
                text: "Dev",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                ))
          ],
        ),
      ),
    );
  }
}
