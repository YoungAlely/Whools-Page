import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whools/src/widgets/Widgets/hexcolor.dart';

  class ThemeModel extends ChangeNotifier {
    bool _isdark = false;

    bool get isDarkMode => _isdark;

    void toggleModeTheme(bool newMode) async {
    _isdark = newMode;
    notifyListeners();
    final preferences = await SharedPreferences.getInstance();
    await preferences.setBool('theme_mode', _isdark);
  }

    Future<void> loadThemeMode() async {
      final preferences = await SharedPreferences.getInstance();
      _isdark = preferences.getBool('theme_mode') ?? true;
      notifyListeners();
    }

  //Colores
  Color get BlackAndWhite {
    return isDarkMode ? HexColor("000000") : Colors.white;
  }

  Color get WhiteAndBlack {
    return isDarkMode ? Colors.white : HexColor("000000");
  }

  Color get Material {
    return isDarkMode ?  HexColor("141414") : HexColor("f6f7f8");
  }

  Color get AzulyMorado {
    return isDarkMode ? HexColor("232528") : HexColor("edede9");
  }
  Color get Button{
    return isDarkMode ? Colors.black : Colors.black;
  }
}
