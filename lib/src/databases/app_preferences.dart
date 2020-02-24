import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreferences {
  SharedPreferences prefs;

  ///Set a token
  Future<bool> setToken(String value) async {
    prefs = await SharedPreferences.getInstance();
    final key = 'TOKEN';
    prefs.setString(key, value);
    print('saved token $value');
    return prefs.commit();
  }

  ///Get token data
  Future<String> getToken() async {
    prefs = await SharedPreferences.getInstance();
    final key = 'TOKEN';
    String value = prefs.getString(key);
    print('read token: $value');
    return value;
  }

  ///Delete token
  Future<bool> removeToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final key = 'TOKEN';
    print('remove token: $key');
    return prefs.remove(key);
  }
}
