import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class UIProvider extends ChangeNotifier{
  bool _isSunny = true;
  bool get isSunny => _isSunny;


  Future<void> ChangeTheme()async{
    final prefs = await SharedPreferences.getInstance();
    _isSunny = prefs.getBool('isSunny') ?? true;
  }

  void toggleTheme()async{
    _isSunny = !_isSunny;
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isSunny', _isSunny);
    notifyListeners();
  }
}