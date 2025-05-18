import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService {
  final SharedPreferences _pref;

  SharedPrefService(this._pref);

  Future<void> setString(String key, String value) async {
    await _pref.setString(key, value);
  }

  String? getString(String key) {
    return _pref.getString(key);
  }

  Future<void> remove(String key) async {
    await _pref.remove(key);
  }
}
