import 'package:flutter/material.dart';
import 'package:lorefinder_ffxiv/views/results.dart';

import '../../utils/strings.dart';

class SearchForm extends StatefulWidget {
  @override
  SearchFormState createState() {
    return SearchFormState();
  }
}

class SearchFormState extends State<SearchForm> {
  final searchFormKey = GlobalKey<FormState>();
  final searchFormController = TextEditingController();
  String searchString;

  @override
  void dispose() {
    searchFormController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final displayWidth = MediaQuery.of(context).size.shortestSide <= 800
        ? MediaQuery.of(context).size.width * 0.70
        : MediaQuery.of(context).size.width * 0.20;

    return Center(
      child: Form(
        key: searchFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('lib/assets/images/xivicon.png'),
            ),
            SizedBox(
              width: displayWidth,
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.grey[900]),
                child: _searchFormSetup(),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
            ),
            SizedBox(
              width: displayWidth,
              // TODO: Allow submit when enter key is pressed
              child: FlatButton(
                  onPressed: () {
                    if (searchFormKey.currentState.validate())
                      return _showResultScreen();
                    else
                      return null;
                  },
                  color: Colors.deepPurpleAccent,
                  textColor: Colors.white,
                  child: Text('Envoyer')),
            )
          ],
        ),
      ),
    );
  }

  Widget _searchFormSetup() {
    return TextFormField(
      controller: searchFormController,
      decoration: InputDecoration(
          labelText: 'Recherche',
          contentPadding: EdgeInsets.only(left: 20, right: 20),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(1.0)),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.deepPurpleAccent),
          ),
          fillColor: Colors.deepPurpleAccent,
          errorStyle: TextStyle(color: Colors.red, fontSize: 12),
          helperStyle: TextStyle(color: Colors.deepPurpleAccent),
          hintStyle: TextStyle(color: Colors.deepPurpleAccent),
          labelStyle: TextStyle(color: Colors.deepPurpleAccent)),
      style: TextStyle(color: Colors.white),
      cursorColor: Colors.deepPurpleAccent,
      // Form validation
      validator: (value) {
        searchString = prepareStringForRequest(value);
        if (searchString.isEmpty) {
          return 'C\'est vide !';
          
        }
        return null;
      }
    );
  }

  void _showResultScreen() {
    Navigator.of(context)
        .push(new PageRouteBuilder(pageBuilder: (BuildContext context, _, __) {
      return ResultScreen(searchString: searchString);
    }, transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
      return new FadeTransition(opacity: animation, child: child);
    }));
  }
}
