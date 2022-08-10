import 'package:cleanarchmvvm/presentation/resources/language_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String prefsKeyLanguage = "PREFS_KEY_LANGUAGE";
const String prefsKeyOnboardingViewwed = "PREFS_KEY_ONBOARDING_SCREEN_VIEWWED";
const String prefsKeyUserLoggedIn = "PREFS_KEY_USER_LOGGED_IN";

class AppPrefrences {
  final SharedPreferences _sharedPreferences;

  AppPrefrences(this._sharedPreferences);

  Future<String> getAppLanguage() async {
    String? language = _sharedPreferences.getString(prefsKeyLanguage);
    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      return LanguageType.ENGLISH.getValue();
    }
  }

  Future<void> setOnboardingScreenViewwed() async {
    _sharedPreferences.setBool(prefsKeyOnboardingViewwed, true);
  }

  Future<bool> isOnboardingScreenViewwed() async {
    return _sharedPreferences.getBool(prefsKeyOnboardingViewwed) ?? false;
  }

  Future<void> setUserLoggedIn() async {
    _sharedPreferences.setBool(prefsKeyUserLoggedIn, true);
  }

  Future<bool> isUserLoggedIn() async {
    return _sharedPreferences.getBool(prefsKeyUserLoggedIn) ?? false;
  }
}
