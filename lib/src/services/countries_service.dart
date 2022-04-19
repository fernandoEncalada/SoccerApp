import 'package:flutter/material.dart';
import 'package:soccer_app/src/models/country_model.dart';
import 'package:http/http.dart' as http;

final _SOCCER_URL = 'soccer.sportmonks.com';
const _APIKEY = 'yMNijkry0B07vFTn1776ssS0o4ulYGDbWNXqljQ5ql2hAZ1u4Xm798t7MyQ1';

class CountryService extends ChangeNotifier {
  List<Country> countries = [];

  getCountries() async {
    final response = await http.get(
        Uri.https(_SOCCER_URL, '/api/v2.0/countries', {'api_token': _APIKEY}));

    final countriesResponse = countriesFromJson(response.body);

    countries.addAll(countriesResponse.data);
    notifyListeners();
  }
}
