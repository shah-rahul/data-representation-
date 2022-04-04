import 'package:flutter/cupertino.dart';

class GlobalConfigProvider extends ChangeNotifier {
  bool isLevelFour = false;
  int selectedPage = 0;

  void setLevelFour() {
    print('called');
    isLevelFour = !isLevelFour;
    notifyListeners();
  }

  void changeSelectedPage(int x) {
    selectedPage = x;
    notifyListeners();
  }
}
