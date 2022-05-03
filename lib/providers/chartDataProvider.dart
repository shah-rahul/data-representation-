import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:nudron/models/chart_data.dart';
import 'package:nudron/models/monthly_data_model.dart';

class ChartDataProvider extends ChangeNotifier {
  String selectedMonth = "Unknown";
  List<ChartData> alerts2020 = [];
  List<ChartData> alerts2021 = [];
  List<ChartData> alerts2022 = [];
  List<ChartData> usage2020 = [];
  List<ChartData> usage2021 = [];
  List<ChartData> usage2022 = [];
  List<List<ChartData>> yearlyDataList = [[], [], [], []];
  List<List<MonthylData>> monthlyDataList = [[], [], [], [], [], []];
  List<String> monthArr = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

//wrong ciode

  Future<void> readBeforeYearlyData() async {
    print("readBeforeYearlyData");
    int jan = 0;
    int feb = 0;
    int march = 0;
    int april = 0;
    int may = 0;
    int june = 0;
    int july = 0;
    int august = 0;
    int september = 0;
    int october = 0;
    int november = 0;
    int december = 0;
    int jan1 = 0;
    int feb1 = 0;
    int march1 = 0;
    int april1 = 0;
    int may1 = 0;
    int june1 = 0;
    int july1 = 0;
    int august1 = 0;
    int september1 = 0;
    int october1 = 0;
    int november1 = 0;
    int december1 = 0;
    final int month = DateTime.now().month;
    final int year = DateTime.now().year;
    final String response =
        await rootBundle.loadString('assets/yearlyData.json');
    final data = await json.decode(response) as List;
    data.forEach((element) {
      var ts = element[0] * 86400000;
      var thisdate = DateTime.fromMillisecondsSinceEpoch(ts);
      var thismonth = thisdate.month;
      var thisyear = thisdate.year;
      print((thisdate.year));
      if (thisyear == (year - 2)) {
        for (int i = month + 1; i <= 12; i++) {
          if (i == 1) {
            jan = jan + element[1] as int;
            jan1 = jan1 + element[2] as int;
          }

          if (i == 2) {
            feb = feb + element[1] as int;
            feb1 = feb1 + element[2] as int;
          }
          if (i == 3) {
            march = march + element[1] as int;
            march1 = march1 + element[2] as int;
          }
          if (i == 4) {
            april = april + element[1] as int;
            april1 = april1 + element[2] as int;
          }
          if (i == 5) {
            may = may + element[1] as int;
            may1 = may1 + element[2] as int;
          }
          if (i == 6) {
            june = june + element[1] as int;
            june1 = june1 + element[2] as int;
          }
          if (i == 7) {
            july = july + element[1] as int;
            july1 = july1 + element[2] as int;
          }
          if (i == 8) {
            august = august + element[1] as int;
            august1 = august1 + element[2] as int;
          }
          if (i == 9) {
            september = september + element[1] as int;
            september1 = september1 + element[2] as int;
          }
          if (i == 10) {
            october = october + element[1] as int;
            october1 = october1 + element[2] as int;
          }
          if (i == 11) {
            november = november + element[1] as int;
            november1 = november1 + element[2] as int;
          }
          if (i == 12) {
            december = december + element[1] as int;
            december1 = december1 + element[2] as int;
          }
        }
      }
    });
    yearlyDataList[0].add(ChartData(month: monthArr[0], data: jan));
    yearlyDataList[0].add(ChartData(month: monthArr[1], data: feb));
    yearlyDataList[0].add(ChartData(month: monthArr[0], data: march));
    yearlyDataList[0].add(ChartData(month: monthArr[3], data: april));
    yearlyDataList[0].add(ChartData(month: monthArr[4], data: may));
    yearlyDataList[0].add(ChartData(month: monthArr[5], data: june));
    yearlyDataList[0].add(ChartData(month: monthArr[6], data: july));
    yearlyDataList[0].add(ChartData(month: monthArr[7], data: august));
    yearlyDataList[0].add(ChartData(month: monthArr[8], data: september));
    yearlyDataList[0].add(ChartData(month: monthArr[9], data: october));
    yearlyDataList[0].add(ChartData(month: monthArr[10], data: november));
    yearlyDataList[0].add(ChartData(month: monthArr[11], data: december));
    yearlyDataList[1].add(ChartData(month: monthArr[0], data: jan1));
    yearlyDataList[1].add(ChartData(month: monthArr[1], data: feb1));
    yearlyDataList[1].add(ChartData(month: monthArr[2], data: march1));
    yearlyDataList[1].add(ChartData(month: monthArr[1], data: april1));
    yearlyDataList[1].add(ChartData(month: monthArr[4], data: may1));
    yearlyDataList[1].add(ChartData(month: monthArr[5], data: june1));
    yearlyDataList[1].add(ChartData(month: monthArr[6], data: july1));
    yearlyDataList[1].add(ChartData(month: monthArr[7], data: august1));
    yearlyDataList[1].add(ChartData(month: monthArr[8], data: september1));
    yearlyDataList[1].add(ChartData(month: monthArr[9], data: october1));
    yearlyDataList[1].add(ChartData(month: monthArr[10], data: november1));
    yearlyDataList[1].add(ChartData(month: monthArr[11], data: december1));
  }

  Future<void> readAfterYearlyData() async {
    print('readAfterYearlyData');
    int jan = 0;
    int feb = 0;
    int march = 0;
    int april = 0;
    int may = 0;
    int june = 0;
    int july = 0;
    int august = 0;
    int september = 0;
    int october = 0;
    int november = 0;
    int december = 0;
    int jan1 = 0;
    int feb1 = 0;
    int march1 = 0;
    int april1 = 0;
    int may1 = 0;
    int june1 = 0;
    int july1 = 0;
    int august1 = 0;
    int september1 = 0;
    int october1 = 0;
    int november1 = 0;
    int december1 = 0;
    final int month = DateTime.now().month;
    final int year = DateTime.now().year;
    final String response =
        await rootBundle.loadString('assets/yearlyData.json');
    final data = await json.decode(response) as List;
    data.forEach((element) {
      var ts = element[0] * 86400000;
      var thisdate = DateTime.fromMillisecondsSinceEpoch(ts);
      var thisyear = thisdate.year;
      if (thisyear == (year - 1)) {
        for (int i = 1; i < month; i++) {
          if (i == 1) {
            jan = jan + element[1] as int;
            jan1 = jan1 + element[2] as int;
          }

          if (i == 2) {
            feb = feb + element[1] as int;
            feb1 = feb1 + element[2] as int;
          }
          if (i == 3) {
            march = march + element[1] as int;
            march1 = march1 + element[2] as int;
          }
          if (i == 4) {
            april = april + element[1] as int;
            april1 = april1 + element[2] as int;
          }
          if (i == 5) {
            may = may + element[1] as int;
            may1 = may1 + element[2] as int;
          }
          if (i == 6) {
            june = june + element[1] as int;
            june1 = june1 + element[2] as int;
          }
          if (i == 7) {
            july = july + element[1] as int;
            july1 = july1 + element[2] as int;
          }
          if (i == 8) {
            august = august + element[1] as int;
            august1 = august1 + element[2] as int;
          }
          if (i == 9) {
            september = september + element[1] as int;
            september1 = september1 + element[2] as int;
          }
          if (i == 10) {
            october = october + element[1] as int;
            october1 = october1 + element[2] as int;
          }
          if (i == 11) {
            november = november + element[1] as int;
            november1 = november1 + element[2] as int;
          }
          if (i == 12) {
            december = december + element[1] as int;
            december1 = december1 + element[2] as int;
          }
        }
      }
    });
    yearlyDataList[2].add(ChartData(month: monthArr[0], data: jan));
    yearlyDataList[2].add(ChartData(month: monthArr[1], data: feb));
    yearlyDataList[2].add(ChartData(month: monthArr[2], data: march));
    yearlyDataList[2].add(ChartData(month: monthArr[3], data: april));
    yearlyDataList[2].add(ChartData(month: monthArr[4], data: may));
    yearlyDataList[2].add(ChartData(month: monthArr[5], data: june));
    yearlyDataList[2].add(ChartData(month: monthArr[6], data: july));
    yearlyDataList[2].add(ChartData(month: monthArr[7], data: august));
    yearlyDataList[2].add(ChartData(month: monthArr[8], data: september));
    yearlyDataList[2].add(ChartData(month: monthArr[9], data: october));
    yearlyDataList[2].add(ChartData(month: monthArr[10], data: november));
    yearlyDataList[2].add(ChartData(month: monthArr[11], data: december));
    yearlyDataList[3].add(ChartData(month: monthArr[0], data: jan1));
    yearlyDataList[3].add(ChartData(month: monthArr[1], data: feb1));
    yearlyDataList[3].add(ChartData(month: monthArr[2], data: march1));
    yearlyDataList[3].add(ChartData(month: monthArr[3], data: april1));
    yearlyDataList[3].add(ChartData(month: monthArr[4], data: may1));
    yearlyDataList[3].add(ChartData(month: monthArr[5], data: june1));
    yearlyDataList[3].add(ChartData(month: monthArr[6], data: july1));
    yearlyDataList[3].add(ChartData(month: monthArr[7], data: august1));
    yearlyDataList[3].add(ChartData(month: monthArr[8], data: september1));
    yearlyDataList[3].add(ChartData(month: monthArr[9], data: october1));
    yearlyDataList[3].add(ChartData(month: monthArr[10], data: november1));
    yearlyDataList[3].add(ChartData(month: monthArr[11], data: december1));
  }

  void cleanData(String month) async {
    monthlyDataList = [[], [], [], [], [], []];
    selectedMonth = month;
    int x = monthArr.indexOf(month);
    final String response =
        await rootBundle.loadString('assets/yearlyData.json');
    final data = await json.decode(response) as List;
    data.forEach((element) {
      var ts = element[0] * 86400000;
      var date = DateTime.fromMillisecondsSinceEpoch(ts);
      if (date.month == x) {
        if (date.year == 2020) {
          monthlyDataList[0].add(MonthylData(date: date, data: element[1]));
          monthlyDataList[3].add(MonthylData(date: date, data: element[2]));
        }
        if (date.year == 2021) {
          monthlyDataList[1].add(MonthylData(date: date, data: element[1]));
          monthlyDataList[4].add(MonthylData(date: date, data: element[2]));
        }
        if (date.year == 2022) {
          monthlyDataList[2].add(MonthylData(date: date, data: element[1]));
          monthlyDataList[5].add(MonthylData(date: date, data: element[2]));
        }
      }
    });
    monthlyDataList.forEach(((element) => element.sort(
          (a, b) {
            return a.date.compareTo(b.date);
          },
        )));
    notifyListeners();
  }

  void initCall() {
    print('init data fx called');
    readYear2020();
    readYear2021();
    readYear2022();
   }

  Future<void> readYear2020() async {
    print('read year 2020 called');
    final String response =
        await rootBundle.loadString('assets/yearlyData.json');
    final data = await json.decode(response) as List;
    int jan = 0;
    int feb = 0;
    int march = 0;
    int april = 0;
    int may = 0;
    int june = 0;
    int july = 0;
    int august = 0;
    int september = 0;
    int october = 0;
    int november = 0;
    int december = 0;
    int jan1 = 0;
    int feb1 = 0;
    int march1 = 0;
    int april1 = 0;
    int may1 = 0;
    int june1 = 0;
    int july1 = 0;
    int august1 = 0;
    int september1 = 0;
    int october1 = 0;
    int november1 = 0;
    int december1 = 0;

    // ignore: avoid_function_literals_in_foreach_calls
    data.forEach((element) {
      var ts = element[0] * 86400000;
      var date = DateTime.fromMillisecondsSinceEpoch(ts);
      if (date.year == 2020) {
        switch (date.month) {
          case 1:
            {
              jan = jan + element[1] as int;
              jan1 = jan1 + element[2] as int;
            }

            break;
          case 2:
            {
              feb = feb + element[1] as int;
              feb1 = feb1 + element[2] as int;
            }

            break;
          case 3:
            {
              march = march + element[1] as int;
              march1 = march1 + element[2] as int;
            }
            break;
          case 4:
            {
              april = april + element[1] as int;
              april1 = april1 + element[2] as int;
            }
            break;
          case 5:
            {
              may = may + element[1] as int;
              may1 = may1 + element[2] as int;
            }
            break;
          case 6:
            {
              june = june + element[1] as int;
              june = june1 + element[2] as int;
            }
            break;
          case 7:
            {
              july = july + element[1] as int;
              july = july1 + element[2] as int;
            }
            break;
          case 8:
            {
              august = august + element[1] as int;
              august1 = august1 + element[2] as int;
            }
            break;
          case 9:
            {
              september = september + element[1] as int;
              september1 = september1 + element[2] as int;
            }
            break;
          case 10:
            {
              october = october + element[1] as int;
              october1 = october1 + element[2] as int;
            }
            break;
          case 11:
            {
              november = november + element[1] as int;
              november1 = november1 + element[2] as int;
            }
            break;
          case 12:
            {
              december = december + element[1] as int;
              december1 = december1 + element[2] as int;
            }
            break;
          default:
        }
      }
    });
    usage2020.add(ChartData(month: monthArr[0], data: jan));
    usage2020.add(ChartData(month: monthArr[1], data: feb));
    usage2020.add(ChartData(month: monthArr[2], data: march));
    usage2020.add(ChartData(month: monthArr[3], data: april));
    usage2020.add(ChartData(month: monthArr[4], data: may));
    usage2020.add(ChartData(month: monthArr[5], data: june));
    usage2020.add(ChartData(month: monthArr[6], data: july));
    usage2020.add(ChartData(month: monthArr[7], data: august));
    usage2020.add(ChartData(month: monthArr[8], data: september));
    usage2020.add(ChartData(month: monthArr[9], data: october));
    usage2020.add(ChartData(month: monthArr[10], data: november));
    usage2020.add(ChartData(month: monthArr[11], data: december));
    alerts2020.add(ChartData(month: monthArr[0], data: jan1));
    alerts2020.add(ChartData(month: monthArr[1], data: feb1));
    alerts2020.add(ChartData(month: monthArr[2], data: march1));
    alerts2020.add(ChartData(month: monthArr[3], data: april1));
    alerts2020.add(ChartData(month: monthArr[4], data: may1));
    alerts2020.add(ChartData(month: monthArr[5], data: june1));
    alerts2020.add(ChartData(month: monthArr[6], data: july1));
    alerts2020.add(ChartData(month: monthArr[7], data: august1));
    alerts2020.add(ChartData(month: monthArr[8], data: september1));
    alerts2020.add(ChartData(month: monthArr[9], data: october1));
    alerts2020.add(ChartData(month: monthArr[10], data: november1));
    alerts2020.add(ChartData(month: monthArr[11], data: december1));
    notifyListeners();
  }

  Future<void> readYear2021() async {
    print('read year 2021 called');
    final String response =
        await rootBundle.loadString('assets/yearlyData.json');
    final data = await json.decode(response) as List;
    int jan = 0;
    int feb = 0;
    int march = 0;
    int april = 0;
    int may = 0;
    int june = 0;
    int july = 0;
    int august = 0;
    int september = 0;
    int october = 0;
    int november = 0;
    int december = 0;
    int jan1 = 0;
    int feb1 = 0;
    int march1 = 0;
    int april1 = 0;
    int may1 = 0;
    int june1 = 0;
    int july1 = 0;
    int august1 = 0;
    int september1 = 0;
    int october1 = 0;
    int november1 = 0;
    int december1 = 0;

    // ignore: avoid_function_literals_in_foreach_calls
    data.forEach((element) {
      var ts = element[0] * 86400000;
      var date = DateTime.fromMillisecondsSinceEpoch(ts);
      if (date.year == 2021) {
        switch (date.month) {
          case 1:
            {
              jan = jan + element[1] as int;
              jan1 = jan1 + element[2] as int;
            }

            break;
          case 2:
            {
              feb = feb + element[1] as int;
              feb1 = feb1 + element[2] as int;
            }

            break;
          case 3:
            {
              march = march + element[1] as int;
              march1 = march1 + element[2] as int;
            }
            break;
          case 4:
            {
              april = april + element[1] as int;
              april1 = april1 + element[2] as int;
            }
            break;
          case 5:
            {
              may = may + element[1] as int;
              may1 = may1 + element[2] as int;
            }
            break;
          case 6:
            {
              june = june + element[1] as int;
              june = june1 + element[2] as int;
            }
            break;
          case 7:
            {
              july = july + element[1] as int;
              july = july1 + element[2] as int;
            }
            break;
          case 8:
            {
              august = august + element[1] as int;
              august1 = august1 + element[2] as int;
            }
            break;
          case 9:
            {
              september = september + element[1] as int;
              september1 = september1 + element[2] as int;
            }
            break;
          case 10:
            {
              october = october + element[1] as int;
              october1 = october1 + element[2] as int;
            }
            break;
          case 11:
            {
              november = november + element[1] as int;
              november1 = november1 + element[2] as int;
            }
            break;
          case 12:
            {
              december = december + element[1] as int;
              december1 = december1 + element[2] as int;
            }
            break;
          default:
        }
      }
    });
    usage2021.add(ChartData(month: monthArr[0], data: jan));
    usage2021.add(ChartData(month: monthArr[1], data: feb));
    usage2021.add(ChartData(month: monthArr[2], data: march));
    usage2021.add(ChartData(month: monthArr[3], data: april));
    usage2021.add(ChartData(month: monthArr[4], data: may));
    usage2021.add(ChartData(month: monthArr[5], data: june));
    usage2021.add(ChartData(month: monthArr[6], data: july));
    usage2021.add(ChartData(month: monthArr[7], data: august));
    usage2021.add(ChartData(month: monthArr[8], data: september));
    usage2021.add(ChartData(month: monthArr[9], data: october));
    usage2021.add(ChartData(month: monthArr[10], data: november));
    usage2021.add(ChartData(month: monthArr[11], data: december));
    alerts2021.add(ChartData(month: monthArr[0], data: jan1));
    alerts2021.add(ChartData(month: monthArr[1], data: feb1));
    alerts2021.add(ChartData(month: monthArr[2], data: march1));
    alerts2021.add(ChartData(month: monthArr[3], data: april1));
    alerts2021.add(ChartData(month: monthArr[4], data: may1));
    alerts2021.add(ChartData(month: monthArr[5], data: june1));
    alerts2021.add(ChartData(month: monthArr[6], data: july1));
    alerts2021.add(ChartData(month: monthArr[7], data: august1));
    alerts2021.add(ChartData(month: monthArr[8], data: september1));
    alerts2021.add(ChartData(month: monthArr[9], data: october1));
    alerts2021.add(ChartData(month: monthArr[10], data: november1));
    alerts2021.add(ChartData(month: monthArr[11], data: december1));
    notifyListeners();
  }

  Future<void> readYear2022() async {
    print('read year 2022 called');
    final String response =
        await rootBundle.loadString('assets/yearlyData.json');
    final data = await json.decode(response) as List;
    int jan = 0;
    int feb = 0;
    int march = 0;
    int april = 0;
    int may = 0;
    int june = 0;
    int july = 0;
    int august = 0;
    int september = 0;
    int october = 0;
    int november = 0;
    int december = 0;
    int jan1 = 0;
    int feb1 = 0;
    int march1 = 0;
    int april1 = 0;
    int may1 = 0;
    int june1 = 0;
    int july1 = 0;
    int august1 = 0;
    int september1 = 0;
    int october1 = 0;
    int november1 = 0;
    int december1 = 0;

    // ignore: avoid_function_literals_in_foreach_calls
    data.forEach((element) {
      var ts = element[0] * 86400000;
      var date = DateTime.fromMillisecondsSinceEpoch(ts);
      if (date.year == 2022) {
        switch (date.month) {
          case 1:
            {
              jan = jan + element[1] as int;
              jan1 = jan1 + element[2] as int;
            }

            break;
          case 2:
            {
              feb = feb + element[1] as int;
              feb1 = feb1 + element[2] as int;
            }

            break;
          case 3:
            {
              march = march + element[1] as int;
              march1 = march1 + element[2] as int;
            }
            break;
          case 4:
            {
              april = april + element[1] as int;
              april1 = april1 + element[2] as int;
            }
            break;
          case 5:
            {
              may = may + element[1] as int;
              may1 = may1 + element[2] as int;
            }
            break;
          case 6:
            {
              june = june + element[1] as int;
              june = june1 + element[2] as int;
            }
            break;
          case 7:
            {
              july = july + element[1] as int;
              july = july1 + element[2] as int;
            }
            break;
          case 8:
            {
              august = august + element[1] as int;
              august1 = august1 + element[2] as int;
            }
            break;
          case 9:
            {
              september = september + element[1] as int;
              september1 = september1 + element[2] as int;
            }
            break;
          case 10:
            {
              october = october + element[1] as int;
              october1 = october1 + element[2] as int;
            }
            break;
          case 11:
            {
              november = november + element[1] as int;
              november1 = november1 + element[2] as int;
            }
            break;
          case 12:
            {
              december = december + element[1] as int;
              december1 = december1 + element[2] as int;
            }
            break;
          default:
        }
      }
    });
    usage2022.add(ChartData(month: monthArr[0], data: jan));
    usage2022.add(ChartData(month: monthArr[1], data: feb));
    usage2022.add(ChartData(month: monthArr[2], data: march));
    usage2022.add(ChartData(month: monthArr[3], data: april));
    usage2022.add(ChartData(month: monthArr[4], data: may));
    usage2022.add(ChartData(month: monthArr[5], data: june));
    usage2022.add(ChartData(month: monthArr[6], data: july));
    usage2022.add(ChartData(month: monthArr[7], data: august));
    usage2022.add(ChartData(month: monthArr[8], data: september));
    usage2022.add(ChartData(month: monthArr[9], data: october));
    usage2022.add(ChartData(month: monthArr[10], data: november));
    usage2022.add(ChartData(month: monthArr[11], data: december));
    alerts2022.add(ChartData(month: monthArr[0], data: jan1));
    alerts2022.add(ChartData(month: monthArr[1], data: feb1));
    alerts2022.add(ChartData(month: monthArr[2], data: march1));
    alerts2022.add(ChartData(month: monthArr[3], data: april1));
    alerts2022.add(ChartData(month: monthArr[4], data: may1));
    alerts2022.add(ChartData(month: monthArr[5], data: june1));
    alerts2022.add(ChartData(month: monthArr[6], data: july1));
    alerts2022.add(ChartData(month: monthArr[7], data: august1));
    alerts2022.add(ChartData(month: monthArr[8], data: september1));
    alerts2022.add(ChartData(month: monthArr[9], data: october1));
    alerts2022.add(ChartData(month: monthArr[10], data: november1));
    alerts2022.add(ChartData(month: monthArr[11], data: december1));
    notifyListeners();
  }
}
