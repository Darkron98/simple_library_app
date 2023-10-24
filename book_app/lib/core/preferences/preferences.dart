import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  factory Preferences() => _instance;

  Preferences._internal();

  static final Preferences _instance = Preferences._internal();

  late SharedPreferences _preferences;

  intialize() async {
    _preferences = await SharedPreferences.getInstance();
  }

  set token(String token) {
    _preferences.setString('token', token);
  }

  String get token => _preferences.getString('token') ?? '0';

  set rol(int rol) {
    _preferences.setInt('rol', rol);
  }

  int get rol => _preferences.getInt('rol') ?? 100;

  set userId(int userId) {
    _preferences.setInt('userId', userId);
  }

  int get userId => _preferences.getInt('userId') ?? 0;

  set user(String user) {
    _preferences.setString('user', user);
  }

  String get user => _preferences.getString('user') ?? '0';

  set name(String name) {
    _preferences.setString('name', name);
  }

  String get name => _preferences.getString('name') ?? '0';
}
