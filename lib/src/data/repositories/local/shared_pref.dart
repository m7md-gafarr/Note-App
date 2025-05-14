import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static const String INTRODUCTION_COMPLETED = "introduction_completed";
  static const String LANGUAGE = "language";

  static final SharedPreferencesService _instance =
      SharedPreferencesService._internal();
  late SharedPreferences _prefs;

  factory SharedPreferencesService() {
    return _instance;
  }

  SharedPreferencesService._internal();

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> saveIntroductionStatus(bool isCompleted) async {
    await _prefs.setBool(INTRODUCTION_COMPLETED, isCompleted);
  }

  Future<bool> getIntroductionStatus() async {
    return _prefs.getBool(INTRODUCTION_COMPLETED) ?? false;
  }

  Future<String?> loadSavedLanguage() async {
    return _prefs.getString(LANGUAGE);
  }

  Future<void> changeLanguage(String languageCode) async {
    await _prefs.setString(LANGUAGE, languageCode);
  }
}
