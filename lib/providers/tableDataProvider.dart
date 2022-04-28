import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:nudron/models/billing_cell_data.dart';
import 'package:nudron/models/history_cell_model.dart';
import 'package:intl/intl.dart';

class TableDataProvider extends ChangeNotifier {
  List<HistoryCellData> historyDataList = [];
  List<HistoryCellData> billingGroupList = [];
  List<HistoryCellData> zonalDataList = [];
  List<BillingCellData> billingDatalist = [];
  List<BillingCellData> devicelist = [];

  bool deviceHistoryDataLoadedCompletely = false;
  bool deviceListDataLoadedCompletely = false;
  bool billingGroupDataLoadedCompletely = false;

  int currentMaxFordevicelist = 10;
  int currentMaxForBilling = 10;

  void deviceHistoryDataRefresher() async {
    print('called');
    String formattedDate2 = 0.toString();
    final String response =
        await rootBundle.loadString('assets/historyData.json');
    final data = await json.decode(response) as List;
    if (data.length - currentMaxFordevicelist >= 20) {
      for (int i = currentMaxFordevicelist;
          i < currentMaxFordevicelist + 10;
          i++) {
        var givenDate =
            DateTime.fromMillisecondsSinceEpoch(data[i][0] * 86400000);
        String formattedDate = DateFormat("dd-MM-yy").format(givenDate);
        if (data[i][2] == "0") {
          formattedDate2 = "0";
        } else {
          var givenDate2 = DateTime.fromMillisecondsSinceEpoch(data[i][2]);
          String formattedDate2 = DateFormat("dd-MM-yy").format(givenDate2);
        }
        historyDataList.add(
          HistoryCellData(
            date: formattedDate.toString(),
            alerts: data[i][1],
            status: formattedDate2,
            comments: data[i][3],
          ),
        );
      }
    } else {
      for (int i = currentMaxFordevicelist; i < data.length; i++) {
        var givenDate =
            DateTime.fromMillisecondsSinceEpoch(data[i][0] * 86400000);
        String formattedDate = DateFormat("dd-MM-yy").format(givenDate);
        var givenDate2 = DateTime.fromMillisecondsSinceEpoch(data[i][2]);
        String formattedDate2 = DateFormat("dd-MM-yy").format(givenDate2);
        historyDataList.add(
          HistoryCellData(
            date: formattedDate.toString(),
            alerts: data[i][1],
            status: formattedDate2,
            comments: data[i][3],
          ),
        );
        deviceHistoryDataLoadedCompletely = true;
      }
    }

    currentMaxFordevicelist = currentMaxFordevicelist + 10;
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
    if (list.length <= 20) {
      deviceListDataLoadedCompletely = true;
    }
  }

  void billingDataRefresher() async {
    print('billing data refresher called');
    final String response = await rootBundle.loadString('assets/data.json');
    final data = await json.decode(response) as Map;
    var list = data['data'][8];
    if (list.length - currentMaxForBilling >= 20) {
      for (int i = currentMaxForBilling; i < currentMaxForBilling + 10; i++) {
        billingGroupList.add(
          HistoryCellData(
            date: list[i][1].toString(),
            alerts: list[i][2],
            status: list[i][3].toString(),
            comments: list[i][4].toString(),
          ),
        );
      }
    } else {
      for (int i = currentMaxForBilling; i < list.length; i++) {
        billingGroupList.add(
          HistoryCellData(
            date: list[i][1].toString(),
            alerts: list[i][2],
            status: list[i][3].toString(),
            comments: list[i][4].toString(),
          ),
        );
        print('billing history data loaded completely');
        billingGroupDataLoadedCompletely = true;
      }
    }
    notifyListeners();
  }

  void bllingDataLoader() async {
    print("init history Loader called");
    final String response = await rootBundle.loadString('assets/data.json');
    final data = await json.decode(response) as Map;
    var list = data['data'][8];
    for (int i = 0; i < currentMaxForBilling + 10; i++) {
      billingGroupList.add(
        HistoryCellData(
          date: list[i][1].toString(),
          alerts: list[i][2],
          status: list[i][3].toString(),
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

  void zonalDataLoader() async {
    print("init zonal Loader called");
    final String response = await rootBundle.loadString('assets/data.json');
    final data = await json.decode(response) as Map;
    var list = data['data'][9];
    for (int i = 0; i < list.length; i++) {
      zonalDataList.add(
        HistoryCellData(
          date: list[i][1],
          alerts: list[i][2],
          status: list[i][3].toString(),
          comments: list[i][4].toString(),
        ),
      );
    }
  }

  void deviceHistoryDataLoader() async {
    print("init billing history Loader called");
    final String response =
        await rootBundle.loadString('assets/historyData.json');
    final data = await json.decode(response) as List;
    for (int i = 0; i < currentMaxFordevicelist + 10; i++) {
      var givenDate =
          DateTime.fromMillisecondsSinceEpoch(data[i][0] * 86400000);
      String formattedDate = DateFormat("dd-MM-yy").format(givenDate);
    String formattedDate2 = "";

      if (data[i][2] == 0) {
        formattedDate2 = "0";
      } else {
        var givenDate2 = DateTime.fromMillisecondsSinceEpoch(data[i][2]);
       formattedDate2 = DateFormat("dd-MM-yy").format(givenDate2);
      }
   
      historyDataList.add(
        HistoryCellData(
          date: formattedDate.toString(),
          alerts: data[i][1],
          status: formattedDate2,
          comments: data[i][3],
        ),
      );
    }
    notifyListeners();
  }
}
