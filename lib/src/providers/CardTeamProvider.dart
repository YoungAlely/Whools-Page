import 'package:flutter/material.dart';


  class CardTeamProvider extends ChangeNotifier{
    bool _isCardVisible = false;
    bool get isCardVisible => _isCardVisible;

    void toggleCardVisible()async{
      _isCardVisible = !_isCardVisible;
      notifyListeners();
    }
  }