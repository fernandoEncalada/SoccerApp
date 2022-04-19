import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:soccer_app/src/models/leagues_model.dart';

final _SOCCER_URL = 'soccer.sportmonks.com';
const _APIKEY = 'yMNijkry0B07vFTn1776ssS0o4ulYGDbWNXqljQ5ql2hAZ1u4Xm798t7MyQ1';

class LeagueService extends ChangeNotifier {
  List<League> leagues = [];
  LeagueService() {
    getLeagues();
  }

  getLeagues() async {
    final response = await http.get(
        Uri.https(_SOCCER_URL, '/api/v2.0/leagues', {'api_token': _APIKEY}));

    final leaguesResponse = leaguesFromJson(response.body);

    leagues.addAll(leaguesResponse.data);
    notifyListeners();
    print(leaguesResponse.data[0].name);
  }
}
