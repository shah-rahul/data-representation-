import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nudron/models/user_data.dart';

class UserDataProvider extends ChangeNotifier {
  UserData user = UserData(
    uid: "loading",
    name: "loading",
    email: "loading",
    phone: "loading",
    accountID: 0,
    accountLabel: "loading",
    providerName: "loading",
    validTill: "loading",
    address: "loading",
    providerPhone: "loading",
    providerEmail: "loading",
    countryCode: "loading",
    supportContact: "loading",
    deviceCount: 0,
  );

  Future<void> userDataLoader() async {
    print("user data provider called");
    final String response = await rootBundle.loadString('assets/data.json');
    final data = await json.decode(response) as Map;
    var list = data['data'][0];
    user.uid = list[0][0];
    user.name = list[0][1];
    user.email = list[0][2];
    user.phone = list[0][4];
    user.accountID = list[1][0];
    user.accountLabel = "owner";
    user.providerName = list[1][2];
    user.validTill =
        DateTime.fromMillisecondsSinceEpoch(list[1][3]).toString();
    user.address = list[1][4];
    user.providerPhone = list[1][6];
    user.providerEmail = list[1][5];
    user.countryCode = list[1][8];
    user.supportContact = list[1][9];
    user.deviceCount = list[1][10];

    notifyListeners();
    print(user.name);
  }
}
