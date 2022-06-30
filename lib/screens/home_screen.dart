import 'package:flutter/material.dart';
import 'package:shared_preferences_settings/share_preferences/preferences.dart';
import 'package:shared_preferences_settings/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const String routerName = '/home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        drawer: const SideMenu(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Dark Mode ${Preferences.isDarkMode ? 'On' : 'Off'}'),
            const Divider(),
            Text('Género ${Preferences.gender}'),
            const Divider(),
            Text('Nombre ${Preferences.name}'),
            const Divider(),
          ],
        ));
  }
}
