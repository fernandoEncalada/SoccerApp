import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soccer_app/src/services/countries_service.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final countryService = Provider.of<CountryService>(context);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const _DrawerHeader(),
          ListTile(
            leading: const Icon(Icons.sports_soccer_sharp),
            title: const Text('Leagues'),
            onTap: () {
              countryService.getCountries();
              Navigator.pushReplacementNamed(context, 'leagues');
            },
          ),
          ListTile(
            leading: const Icon(Icons.location_city),
            title: const Text('Countries'),
            onTap: () {
              countryService.getCountries();
              Navigator.pushReplacementNamed(context, 'country');
            },
          )
        ],
      ),
    );
  }
}

class _DrawerHeader extends StatelessWidget {
  const _DrawerHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(child: Text('Options'));
  }
}
