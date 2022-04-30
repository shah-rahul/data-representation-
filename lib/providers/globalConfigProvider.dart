import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class GlobalConfigProvider extends ChangeNotifier {
  bool isLevelFour = false;
  int selectedPage = 0;
  String selectedBillingGroup = "Billing History";
  String selectedDeviceGroup = "Device Group";
  String selectedDeviceType = "";
  String date = "";

  void setLevelFour() {
    print('called');
    isLevelFour = !isLevelFour;
    notifyListeners();
  }

  //change selectedBillingGroup
  void setDeviceGroup(String str) {
    selectedDeviceGroup = str;
    notifyListeners();
  }

  void historyHeaderLoader() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final data = await json.decode(response) as Map;
    var list = data['data'][3];
    selectedDeviceType = list[0][0];
    var givenDate = DateTime.fromMillisecondsSinceEpoch( list[0][1]);
    String formattedDate = DateFormat("dd-MMM-yy").format(givenDate);
    date = formattedDate;
  }

  // change selectedBillingGroup
  void setSelectedBillingGroup(String selectedBillingGroup) {
    this.selectedBillingGroup = selectedBillingGroup;
    notifyListeners();
  }

  void changeSelectedPage(int x) {
    selectedPage = x;
    notifyListeners();
  }
}
