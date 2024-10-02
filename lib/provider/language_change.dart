import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageChangeController extends ChangeNotifier {
  Locale? _applocal;
  Locale? get applocal => _applocal;

  void ChangeLanguage(Locale type) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    _applocal = type;
    if (type == Locale("en")) {
      await sp.setString("language_code", "en");
    } else {
      await sp.setString("language_code", "es");
    }
    notifyListeners();
  }
}
