import 'package:cleanarchmvvm/presentation/resources/language_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String PREFS_KEY_LANGUAGE = "PREFS_KEY_LANGUAGE";

class AppPrefrences {
  final SharedPreferences _sharedPreferences;

  AppPrefrences(this._sharedPreferences);

  Future<String> getAppLanguage() async {
    String? language = _sharedPreferences.getString(PREFS_KEY_LANGUAGE);
    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      return LanguageType.ENGLISH.getValue();
    }
  }
}
