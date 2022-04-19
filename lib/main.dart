import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soccer_app/src/screens/country_screen.dart';
import 'package:soccer_app/src/screens/home_screen.dart';
import 'package:soccer_app/src/services/countries_service.dart';
import 'package:soccer_app/src/services/leagues_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LeagueService()),
        ChangeNotifierProvider(create: (_) => CountryService())
      ],
      child: MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,      
        initialRoute: 'leagues',
        routes: {
          'leagues': (_) => HomeScreen(),
          'country': (_) => CountryScreen(),
        },
        theme: ThemeData.dark(),
      ),
    );
  }
}