import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:lorefinder_ffxiv/model/XIVAPISearchResults.dart';

class APIManagement {
  Future<XIVAPISearchResults> fetchLore(String requestURL) async {
    final response = await http.get(requestURL);

    if (response.statusCode == 200) {
      return XIVAPISearchResults.fromJson(json.decode(response.body));
    } else {
      throw Exception('Impossible d\'accéder à l\'API');
    }
  }
}