import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soccer_app/src/services/leagues_service.dart';
import 'package:soccer_app/src/widgets/side_menu.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final leaguesService = Provider.of<LeagueService>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Soccer App'),
        ),
        drawer: const SideMenu(),
        body: 
        (leaguesService.leagues.isEmpty)
        ? const Center(child: CircularProgressIndicator(color: Colors.white),)
        : _LeagueCard(leaguesService: leaguesService));
  }
}

class _LeagueCard extends StatelessWidget {
  const _LeagueCard({
    Key? key,
    required this.leaguesService,
  }) : super(key: key);

  final LeagueService leaguesService;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: leaguesService.leagues.length,
        itemBuilder: (_, int index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(90),
            child: Card(
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                children: [
                  Image(image: NetworkImage(leaguesService.leagues[index].logoPath)),
                   const SizedBox(height: 20),
                  Text(leaguesService.leagues[index].name),
                const SizedBox(height: 20)
                ],
              ),
              
            ),
          );
        });
  }
}
