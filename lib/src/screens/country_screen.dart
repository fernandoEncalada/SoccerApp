import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soccer_app/src/services/countries_service.dart';
import 'package:soccer_app/src/widgets/side_menu.dart';

class CountryScreen extends StatelessWidget {
  const CountryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final countryService = Provider.of<CountryService>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Countries'),
      ),
      drawer: SideMenu(),
      body: 
      (countryService.countries.length == 0)
      ? Center(child: CircularProgressIndicator(color: Colors.white))
      : _CountryCard(countryService: countryService),
    );
  }
}

class _CountryCard extends StatelessWidget {
  const _CountryCard({
    Key? key,
    required this.countryService,
  }) : super(key: key);

  final CountryService countryService;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: countryService.countries.length,
        itemBuilder: (_, int index) {
          return ClipRRect(
              borderRadius: BorderRadius.circular(90),
              child: Card(
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Column(
                  children: [
                    Image(image: NetworkImage(countryService.countries[index].imagePath)),
                     SizedBox(height: 20),
                    Text(countryService.countries[index].name),
                  SizedBox(height: 20)
                  ],
                ),
                
              ),
            );
        });
  }
}
