import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  // Singleton instance
  static late SharedPreferences _prefs;

  // Initialize the singleton's variables
  static String _name = "";
  static bool _isDarkMode = false;
  static int _gender = 1;

  // Init Function
  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // * GETTERS AND SETTERS * //

  // Name Setters and Getters
  static String get name {
    return _prefs.getString('name') ?? _name;
  }

  static set name(String name) {
    _name = name;
    _prefs.setString('name', name);
  }

  // DarkMode Setters and Getters
  static bool get isDarkMode {
    return _prefs.getBool('isDarkMode') ?? _isDarkMode;
  }

  static set isDarkMode(bool isDarkMode) {
    _isDarkMode = isDarkMode;
    _prefs.setBool('isDarkMode', isDarkMode);
  }

  // Gender Setters and Getters
  static int get gender {
    return _prefs.getInt('gender') ?? _gender;
  }

  static set gender(int gender) {
    _gender = gender;
    _prefs.setInt('gender', gender);
  }
}
