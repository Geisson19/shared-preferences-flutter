import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences_settings/providers/theme_provider.dart';
import 'package:shared_preferences_settings/share_preferences/preferences.dart';
import 'package:shared_preferences_settings/widgets/side_menu.dart';

class SettingsScreen extends StatefulWidget {
  static const String routerName = '/settings';

  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        drawer: const SideMenu(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text("Ajustes",
                    style:
                        TextStyle(fontSize: 45, fontWeight: FontWeight.w300)),
                const Divider(),
                SwitchListTile.adaptive(
                    value: Preferences.isDarkMode,
                    onChanged: (value) {
                      Preferences.isDarkMode = value;
                      final themeProvider = Provider.of<ThemeProvider>(
                        context,
                        listen: false,
                      );
                      if (value) {
                        themeProvider.setDarkMode();
                      } else {
                        themeProvider.setLightMode();
                      }
                      setState(() {});
                    },
                    title: const Text("Dark Mode")),
                const Divider(),
                RadioListTile<int>(
                  value: 1,
                  groupValue: Preferences.gender,
                  onChanged: (value) {
                    Preferences.gender = value ?? 1;
                    Preferences.gender = value ?? 1;
                    setState(() {});
                  },
                  title: const Text("Masculino"),
                ),
                const Divider(),
                RadioListTile<int>(
                  value: 2,
                  groupValue: Preferences.gender,
                  onChanged: (value) {
                    Preferences.gender = value ?? 2;
                    setState(() {});
                  },
                  title: const Text("Femenino"),
                ),
                const Divider(),
                RadioListTile<int>(
                  value: 3,
                  groupValue: Preferences.gender,
                  onChanged: (value) {
                    Preferences.gender = value ?? 3;
                    setState(() {});
                  },
                  title: const Text("Otro"),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    initialValue: Preferences.name,
                    decoration: const InputDecoration(
                        labelText: "Nombre", helperText: "Nombre del usuario"),
                    onChanged: (value) {
                      Preferences.name = value;
                      setState(() {});
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
