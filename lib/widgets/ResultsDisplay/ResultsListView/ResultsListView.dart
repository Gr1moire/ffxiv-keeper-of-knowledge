import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:lorefinder_ffxiv/model/XIVAPISearchResults.dart';
import 'package:lorefinder_ffxiv/utils/ScreenVariable.dart';

class ResultsListView extends StatelessWidget {
  final List<Results> searchResults;
  const ResultsListView({Key key, this.searchResults}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenVariables.dblScreenHeight - 107,
      // Disables overscoll glow
      child: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (OverscrollIndicatorNotification overscroll) {
          overscroll.disallowGlow();
          return true;
        },
        child: ListView.builder(
          itemCount: searchResults.length,
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  color: Colors.black12,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: _tile(searchResults[index]),
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 15)),
              ],
            );
          },
        ),
      ),
    );
  }

  ListTile _tile(Results result) {
    String contentName = result.data != null && result.data.nameFr != null
        ? result.data.nameFr
        : result.context;
    String contentURL = "https://xivapi.com/" + result.source.toString() + "/" + result.sourceID.toString();

    return ListTile(
      leading: Icon(Icons.book, color: Colors.deepPurpleAccent),
      enabled: true,
      selected: true,
      onTap: () {},
      title: SelectableText(
        "$contentName :",
        style: TextStyle(color: Colors.grey[200]),
      ),
      subtitle: SelectableText(
        result.text,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
          color: Colors.grey[200],
        ),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      trailing: Container(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        // TODO: Try to center leading and trailing icons
        Icon(Icons.keyboard_arrow_right,
            color: Colors.deepPurpleAccent,
            size: ScreenVariables.dblDefaultFontSize)
      ]),
    ));
  }
}
