import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:nudron/models/billing_cell_data.dart';
import 'package:nudron/models/history_cell_model.dart';
import 'package:intl/intl.dart';

class TableDataProvider extends ChangeNotifier {
  List<HistoryCellData> historyDataList = [];
  List<HistoryCellData> billingGroupList = [];
  List<BillingCellData> billingDatalist = [];
  List<BillingCellData> devicelist = [];

  int currentMax = 10;

  void historyDataRefresher() async {
    print('called');
    final String response =
        await rootBundle.loadString('assets/historyData.json');
    final data = await json.decode(response) as List;
    for (int i = currentMax; i < currentMax + 10; i++) {
      var givenDate =
          DateTime.fromMillisecondsSinceEpoch(data[i][0] * 86400000);
      String formattedDate = DateFormat("dd-MM-yy").format(givenDate);
      historyDataList.add(
        HistoryCellData(
          date: formattedDate.toString(),
          alerts: data[i][1],
          status: data[i][2],
          comments: data[i][3],
        ),
      );
    }
    currentMax = currentMax + 10;
    notifyListeners();
  }

  void deviceListLoader() async {
    print("init deviceList Loader called");
    final String response = await rootBundle.loadString('assets/data.json');
    final data = await json.decode(response) as Map;
    var list = data['data'][7];
    for (int i = 0; i < list.length; i++) {
      final date = DateTime.fromMillisecondsSinceEpoch(list[i][0]);
      final formattedDate = DateFormat("dd-MM-yy").format(date);
      devicelist.add(
        BillingCellData(
          date: formattedDate,
          message: list[i][1].toString(),
          status: list[i][3].toString(),
          amount: list[i][2],
        ),
      );
    }
  }

  void bllingDataLoader() async {
    print("init history Loader called");
    final String response = await rootBundle.loadString('assets/data.json');
    final data = await json.decode(response) as Map;
    var list = data['data'][8];
    for (int i = 0; i < list.length; i++) {
      billingGroupList.add(
        HistoryCellData(
          date: list[i][1].toString(),
          alerts: list[i][2],
          status: list[i][3],
          comments: list[i][4].toString(),
        ),
      );
    }
    notifyListeners();
  }

  void billingHistoryDataLoader() async {
    print("init billing Loader called");
    final String response = await rootBundle.loadString('assets/data.json');
    final data = await json.decode(response) as Map;
    var list = data['data'][2];
    for (int i = 0; i < list.length; i++) {
      final date = DateTime.fromMillisecondsSinceEpoch(list[i][0]);
      final formattedDate = DateFormat("dd-MM-yy").format(date);
      billingDatalist.add(
        BillingCellData(
          date: formattedDate,
          message: list[i][1],
          status: list[i][2],
          amount: list[i][3],
        ),
      );
    }
  }

  void historyDataLoader() async {
    print("init history Loader called");
    final String response =
        await rootBundle.loadString('assets/historyData.json');
    final data = await json.decode(response) as List;
    for (int i = currentMax; i < currentMax + 10; i++) {
      var givenDate =
          DateTime.fromMillisecondsSinceEpoch(data[i][0] * 86400000);
      String formattedDate = DateFormat("dd-MM-yy").format(givenDate);
      historyDataList.add(
        HistoryCellData(
          date: formattedDate.toString(),
          alerts: data[i][1],
          status: data[i][2],
          comments: data[i][3],
        ),
      );
    }
    notifyListeners();
  }
}
