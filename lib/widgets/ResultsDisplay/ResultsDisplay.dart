import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:lorefinder_ffxiv/model/APIManagement.dart';
import 'package:lorefinder_ffxiv/model/XIVAPISearchResults.dart';
import 'package:lorefinder_ffxiv/widgets/ResultsDisplay/ResultsListView/ResultsListView.dart';

class ResultsDisplay extends StatefulWidget {
  final String requestURL;
  ResultsDisplay({Key key, @required this.requestURL}) : super(key: key);

  @override
  ResultsDisplayState createState() {
    return ResultsDisplayState(requestURL: requestURL);
  }
}

class ResultsDisplayState extends State<ResultsDisplay> {
  final String requestURL;
  APIManagement api = new APIManagement();
  Future<XIVAPISearchResults> futureSearchResults;
  ResultsDisplayState({Key key, @required this.requestURL});

  @override
  void initState() {
    super.initState();
    futureSearchResults = api.fetchLore(requestURL);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder<XIVAPISearchResults>(
            future: futureSearchResults,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                
                return ResultsListView(searchResults : snapshot.data.results);
              } else if (snapshot.hasError) {
                return SelectableText("${snapshot.error}", style: TextStyle(color: Colors.red, fontSize: 14));
              }
              return CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.deepPurple));
            },
          )
        ],
      ),
    );
  }
}
