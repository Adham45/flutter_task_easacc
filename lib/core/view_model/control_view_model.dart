import 'package:easacc_task/view/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/home_screen.dart';

class ControlViewModel extends GetxController {
  Widget _currentScreen = SettingsScreen();
  int _navigatorIndex = 0;

  Widget get currentScreen => _currentScreen;

  int get navigatorIndex => _navigatorIndex;

  changeCurrentScreen(int index){
    _navigatorIndex = index;
    switch(index){
      case 0:
        _currentScreen = SettingsScreen();
        break;
      case 1:
        _currentScreen = HomeScreen();
        break;
    }
    update();
  }
}