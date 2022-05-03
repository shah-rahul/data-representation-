import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nudron/models/monthly_data_model.dart';
import 'package:nudron/providers/chartDataProvider.dart';
import 'package:nudron/widgets/utils/legend_builder.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';
import '../models/chart_data.dart';

int prev = DateTime.now().millisecondsSinceEpoch;

class CustombarChart extends StatefulWidget {
  const CustombarChart({
    Key? key,
  }) : super(key: key);
  @override
  State<CustombarChart> createState() => _CustombarChartState();
}

bool isMonthData = false;
String tappedItem = "janaury";
late ZoomPanBehavior _zoomPanBehavior;
late TooltipBehavior _tooltipBehavior;
late TooltipBehavior _monthTooltipBehavior;
bool isAlert2020Active = true;
bool isAlert2021Active = true;
bool isAlert2022Active = true;
bool isUsage2020Active = true;
bool isUsage2021Active = true;
bool isUsage2022Active = true;



class _CustombarChartState extends State<CustombarChart> {
  @override
  void initState() {
    super.initState();

    _zoomPanBehavior = ZoomPanBehavior(
      enablePinching: true,
      enablePanning: true,
    );
    _tooltipBehavior = TooltipBehavior(
      enable: true,
      canShowMarker: false,
      format: 'point.x : point.y',
      shared: true,
      tooltipPosition: TooltipPosition.pointer,
    );
    _monthTooltipBehavior = TooltipBehavior(
      enable: true,
      canShowMarker: false,
      format: 'point.x : point.y',
      shared: true,
      tooltipPosition: TooltipPosition.pointer,
    );
  }

  void notifyParent() {
    isMonthData = !isMonthData;
    Provider.of<ChartDataProvider>(context, listen: false)
        .cleanData(tappedItem);
  }

  void changeGraph() {
    print('called');
    isMonthData = !isMonthData;

    setState(() {});
  }

  void setSelectionStatus(key) {
    print("selectionCAlled for + ${key}");
    switch (key) {
      case "2020":
        isAlert2020Active = !isAlert2020Active;
        break;
      case "2021":
        isAlert2021Active = !isAlert2021Active;
        break;
      case "2022":
        isAlert2022Active = !isAlert2022Active;
        break;
      case "2020_usage":
        isUsage2020Active = !isUsage2020Active;
        break;
      case "2021_usage":
        isUsage2021Active = !isUsage2021Active;
        break;
      case "2022_usage":
        isUsage2022Active = !isUsage2022Active;
        break;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 1,
      width: MediaQuery.of(context).size.width * 2.5,
      child: isMonthData
          ? monthlyChart(context, changeGraph, setSelectionStatus)
          : singleYearChart(notifyParent, context, setSelectionStatus),
    );
  }
}

String returnMonthlyToolTipString(context, day) {
  print(day);
  var monthList1 =
      Provider.of<ChartDataProvider>(context, listen: false).monthlyDataList[1];
  String tooltipString = " ";
  var monthList2 =
      Provider.of<ChartDataProvider>(context, listen: false).monthlyDataList[4];

  monthList1
      .where((element) => element.date.day == int.parse(day))
      .forEach((element) {
    print(element.data);
    tooltipString = "Alerts: " + "${element.data}\n";
  });
  monthList2
      .where((element) => element.date.day == int.parse(day))
      .forEach((element) {
    print(element.data);
    tooltipString = tooltipString + "Usage :${element.data}\n";
  });
  return tooltipString;
}

String returnTooltipString(context, month) {
  String tooltipString = "";
  // if (Provider.of<ChartDataProvider>(context, listen: false)
  //         .usage2020
  //         .where((element) => element.month == month)
  //         .first
  //         .data !=
  //     0) {
  //   tooltipString = tooltipString +
  //       "Usage 2020 : " +
  //       Provider.of<ChartDataProvider>(context, listen: false)
  //           .usage2020
  //           .where((element) => element.month == month)
  //           .first
  //           .data
  //           .toString() +
  //       "\n";
  // }
  if (Provider.of<ChartDataProvider>(context, listen: false)
          .usage2021
          .where((element) => element.month == month)
          .first
          .data !=
      0) {
    tooltipString = tooltipString +
        "Usage 2021 : " +
        Provider.of<ChartDataProvider>(context, listen: false)
            .usage2021
            .where((element) => element.month == month)
            .first
            .data
            .toString() +
        "\n";
  }
  // if (Provider.of<ChartDataProvider>(context, listen: false)
  //         .usage2022
  //         .where((element) => element.month == month)
  //         .first
  //         .data !=
  //     0) {
  //   tooltipString = tooltipString +
  //       "Usage 2022 : " +
  //       Provider.of<ChartDataProvider>(context, listen: false)
  //           .usage2022
  //           .where((element) => element.month == month)
  //           .first
  //           .data
  //           .toString() +
  //       "\n";
  // }

  // if (Provider.of<ChartDataProvider>(context, listen: false)
  //         .alerts2020
  //         .where((element) => element.month == month)
  //         .first
  //         .data !=
  //     0) {
  //   tooltipString = tooltipString +
  //       "Alerts 2020 : " +
  //       Provider.of<ChartDataProvider>(context, listen: false)
  //           .alerts2020
  //           .where((element) => element.month == month)
  //           .first
  //           .data
  //           .toString() +
  //       "\n";
  // }

  if (Provider.of<ChartDataProvider>(context, listen: false)
          .alerts2021
          .where((element) => element.month == month)
          .first
          .data !=
      0) {
    tooltipString = tooltipString +
        "Alerts 2021 : " +
        Provider.of<ChartDataProvider>(context, listen: false)
            .alerts2021
            .where((element) => element.month == month)
            .first
            .data
            .toString() +
        "\n";
  }

  // if (Provider.of<ChartDataProvider>(context, listen: false)
  //         .alerts2022
  //         .where((element) => element.month == month)
  //         .first
  //         .data !=
  //     0) {
  //   tooltipString = tooltipString +
  //       "Alerts 2022 : " +
  //       Provider.of<ChartDataProvider>(context, listen: false)
  //           .alerts2022
  //           .where((element) => element.month == month)
  //           .first
  //           .data
  //           .toString() +
  //       "\n";
  // }

  return tooltipString;
}

Widget monthlyChart(ctx, fun, setStatus) {
  return Container(
    width: MediaQuery.of(ctx).size.width * 0.5,
    decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(blurRadius: 10.0, color: Color.fromRGBO(0, 0, 0, 0.1))
        ],
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5))),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          Provider.of<ChartDataProvider>(ctx).selectedMonth,
          style: const TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
                onPressed: () {
                  fun();
                },
                icon: const Icon(Icons.arrow_back)),
            Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(ctx).size.width * 0.7,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: () {
                            setStatus("2021");
                          },
                          child: LegendBuilder(
                              text: "Alerts 21",
                              color: isAlert2021Active
                                  ? Colors.redAccent
                                  : Colors.grey[300])),
                      GestureDetector(
                          onTap: () {
                            setStatus("2021_usage");
                          },
                          child: LegendBuilder(
                              text: "Usage 21",
                              color: isUsage2021Active
                                  ? Colors.yellow
                                  : Colors.grey[300]))
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 1),
          child: SizedBox(
            height: MediaQuery.of(ctx).size.height * 0.28,
            child: SfCartesianChart(
              onTooltipRender: ((tooltipArgs) => {
                    print(tooltipArgs.text!.split(' ')[0]),
                    tooltipArgs.header =
                        tooltipArgs.text!.split(' ')[0] + " " + tappedItem,
                    tooltipArgs.text = returnMonthlyToolTipString(
                        ctx, tooltipArgs.text!.split(' ')[0]),
                  }),
              margin: EdgeInsets.all(0),
              tooltipBehavior: _monthTooltipBehavior,
              zoomPanBehavior: ZoomPanBehavior(enablePanning: true),
              axes: <ChartAxis>[
                NumericAxis(
                  name: "yAxis",
                  opposedPosition: true,
                  interval: 1000,
                )
              ],
              primaryXAxis: CategoryAxis(
                interval: 1,
                visibleMaximum: 10,
              ),
              series: <CartesianSeries>[
                isAlert2021Active
                    ? ColumnSeries<MonthylData, String>(
                        enableTooltip: true,
                        color: Colors.red,
                        name: 'usage2021',
                        isVisibleInLegend: true,
                        yAxisName: 'yAxis',
                        dataSource: Provider.of<ChartDataProvider>(ctx)
                            .monthlyDataList[1],
                        xValueMapper: (MonthylData data, _) =>
                            data.date.day.toString(),
                        yValueMapper: (MonthylData data, _) => data.data)
                    : ColumnSeries<MonthylData, String>(
                        enableTooltip: true,
                        color: Colors.grey[300],
                        name: 'usage2021',
                        yAxisName: 'yAxis',
                        dataSource: Provider.of<ChartDataProvider>(ctx)
                            .monthlyDataList[1],
                        xValueMapper: (MonthylData data, _) =>
                            data.date.day.toString(),
                        yValueMapper: (MonthylData data, _) => data.data),
                isUsage2021Active
                    ? LineSeries<MonthylData, String>(
                        color: Colors.yellow,
                        name: "alerts2021",
                        isVisibleInLegend: true,
                        dataSource: Provider.of<ChartDataProvider>(ctx)
                            .monthlyDataList[4],
                        xValueMapper: (MonthylData data, _) =>
                            data.date.day.toString(),
                        yValueMapper: (MonthylData data, _) => data.data)
                    : LineSeries<MonthylData, String>(
                        color: Colors.grey[300],
                        name: "alerts2021",
                        dataSource: Provider.of<ChartDataProvider>(ctx)
                            .monthlyDataList[4],
                        xValueMapper: (MonthylData data, _) =>
                            data.date.day.toString(),
                        yValueMapper: (MonthylData data, _) => data.data),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget singleYearChart(fun, ctx, setStatus) {
  return Container(
    width: MediaQuery.of(ctx).size.width * 0.5,
    decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(blurRadius: 10.0, color: Color.fromRGBO(0, 0, 0, 0.1))
        ],
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5))),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Text(
          "Mumbai trends",
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
                onTap: () {
                  setStatus("2021");
                },
                child: LegendBuilder(
                    text: "Alerts 21",
                    color: isAlert2021Active
                        ? Colors.redAccent
                        : Colors.grey[300])),
            GestureDetector(
                onTap: () {
                  setStatus("2021_usage");
                },
                child: LegendBuilder(
                    text: "Usage 21",
                    color:
                        isUsage2021Active ? Colors.yellow : Colors.grey[300]))
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(0),
              child: RotatedBox(
                  quarterTurns: 3,
                  child:
                      Text("Usage", style: TextStyle(color: Colors.black87))),
            ),
            SizedBox(
              width: MediaQuery.of(ctx).size.width * 0.85,
              height: MediaQuery.of(ctx).size.height * 0.28,
              child: SfCartesianChart(
                  tooltipBehavior: _tooltipBehavior,
                  onTooltipRender: ((tooltipArgs) => {
                        tappedItem = tooltipArgs.text!.split(' ')[0],
                        tooltipArgs.header = tooltipArgs.text!.split(' ')[0],
                        tooltipArgs.text = returnTooltipString(
                            ctx, tooltipArgs.text!.split(' ')[0]),
                      }),
                  selectionType: SelectionType.series,
                  primaryXAxis: CategoryAxis(
                    name: "",
                    labelsExtent: 100,
                    labelRotation: 15,
                    visibleMaximum: 6,
                    majorGridLines: const MajorGridLines(width: 0),
                  ),
                  primaryYAxis: NumericAxis(
                      labelsExtent: 32,
                      numberFormat: NumberFormat.compact(locale: "en_In")),
                  zoomPanBehavior: _zoomPanBehavior,
                  margin: EdgeInsets.all(0),
                  axes: <ChartAxis>[
                    NumericAxis(
                      name: "yAxis",
                      numberFormat: NumberFormat.compact(),
                      opposedPosition: true,
                      interval: 5000,
                    )
                  ],
                  series: <CartesianSeries>[
                    isAlert2021Active
                        ? ColumnSeries<ChartData, String>(
                            width: 0.5,
                            onPointDoubleTap: (ChartPointDetails details) {
                              fun();
                            },
                            isVisibleInLegend: true,
                            name: 'usage2021',
                            spacing: 0,
                            yAxisName: 'yAxis',
                            // enableTooltip: true,
                            color: Colors.red,
                            dataSource:
                                Provider.of<ChartDataProvider>(ctx).alerts2021,
                            xValueMapper: (ChartData data, _) =>
                                data.month.toString(),
                            yValueMapper: (ChartData data, _) => data.data)
                        : ColumnSeries<ChartData, String>(
                            width: 0.5,
                            isVisibleInLegend: true,
                            name: 'usage2021',
                            spacing: 0,
                            yAxisName: 'yAxis',
                            // enableTooltip: true,
                            color: Colors.grey[300],
                            dataSource:
                                Provider.of<ChartDataProvider>(ctx).alerts2021,
                            xValueMapper: (ChartData data, _) =>
                                data.month.toString(),
                            yValueMapper: (ChartData data, _) => data.data),
                    isUsage2021Active
                        ? LineSeries<ChartData, String>(
                            dataSource:
                                Provider.of<ChartDataProvider>(ctx).usage2021,
                            isVisibleInLegend: true,
                            color: Colors.yellow,
                            name: "alerts2021",
                            emptyPointSettings: EmptyPointSettings(
                              mode: EmptyPointMode.drop,
                            ),
                            // enableTooltip: true,
                            onPointDoubleTap: (ChartPointDetails details) {
                              fun();
                            },
                            xValueMapper: (ChartData data, _) =>
                                data.month.toString(),
                            yValueMapper: (ChartData data, _) =>
                                data.data == 0 ? null : data.data)
                        : LineSeries<ChartData, String>(
                            dataSource:
                                Provider.of<ChartDataProvider>(ctx).usage2021,
                            isVisibleInLegend: true,
                            color: Colors.grey[300],
                            name: "alerts2021",
                            emptyPointSettings: EmptyPointSettings(
                              mode: EmptyPointMode.drop,
                            ),
                            // enableTooltip: true,
                            xValueMapper: (ChartData data, _) =>
                                data.month.toString(),
                            yValueMapper: (ChartData data, _) =>
                                data.data == 0 ? null : data.data),
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.all(0),
              child: RotatedBox(
                  quarterTurns: 1,
                  child:
                      Text("Alerts", style: TextStyle(color: Colors.black87))),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget singleMonthYearlyChart(ctx, fun, setStatus) {
  return Container(
    width: MediaQuery.of(ctx).size.width * 0.5,
    decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(blurRadius: 10.0, color: Color.fromRGBO(0, 0, 0, 0.1))
        ],
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5))),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(0),
          height: MediaQuery.of(ctx).size.height * 0.04,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  padding: EdgeInsets.all(0),
                  onPressed: () {
                    fun();
                  },
                  icon: const Icon(Icons.arrow_back)),
              Text(
                Provider.of<ChartDataProvider>(ctx).selectedMonth,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                width: MediaQuery.of(ctx).size.width * 0.2,
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 0),
          child: SizedBox(
            height: MediaQuery.of(ctx).size.height * 0.28,
            child: SfCartesianChart(
              margin: EdgeInsets.all(0),
              legend: Legend(
                isVisible: true,
                padding: 0,
                position: LegendPosition.top,
                toggleSeriesVisibility: true,
                legendItemBuilder:
                    (String name, dynamic series, dynamic point, int index) {
                  return Container(
                    margin: EdgeInsets.only(right: 20),
                    child: Text(name, style: TextStyle(color: Colors.black)),
                  );
                },
              ),
              tooltipBehavior: TooltipBehavior(enable: true),
              zoomPanBehavior: ZoomPanBehavior(enablePanning: true),
              axes: <ChartAxis>[
                NumericAxis(
                  name: "yAxis",
                  opposedPosition: true,
                  interval: 1000,
                )
              ],
              primaryXAxis: CategoryAxis(
                name: "xAxis",
                interval: 1,
                visibleMaximum: 10,
              ),
              series: <CartesianSeries>[
                isAlert2021Active
                    ? ColumnSeries<MonthylData, String>(
                        enableTooltip: true,
                        color: Colors.red,
                        name: 'usage2021',
                        isVisibleInLegend: true,
                        yAxisName: 'yAxis',
                        dataSource: Provider.of<ChartDataProvider>(ctx)
                            .monthlyDataList[1],
                        xValueMapper: (MonthylData data, _) =>
                            data.date.day.toString(),
                        yValueMapper: (MonthylData data, _) => data.data)
                    : ColumnSeries<MonthylData, String>(
                        enableTooltip: true,
                        color: Colors.grey[300],
                        name: 'usage2021',
                        yAxisName: 'yAxis',
                        dataSource: Provider.of<ChartDataProvider>(ctx)
                            .monthlyDataList[1],
                        xValueMapper: (MonthylData data, _) =>
                            data.date.day.toString(),
                        yValueMapper: (MonthylData data, _) => data.data),
                isUsage2021Active
                    ? LineSeries<MonthylData, String>(
                        color: Colors.yellow,
                        name: "alerts2021",
                        isVisibleInLegend: true,
                        dataSource: Provider.of<ChartDataProvider>(ctx)
                            .monthlyDataList[4],
                        xValueMapper: (MonthylData data, _) =>
                            data.date.day.toString(),
                        yValueMapper: (MonthylData data, _) => data.data)
                    : LineSeries<MonthylData, String>(
                        color: Colors.grey[300],
                        name: "alerts2021",
                        dataSource: Provider.of<ChartDataProvider>(ctx)
                            .monthlyDataList[4],
                        xValueMapper: (MonthylData data, _) =>
                            data.date.day.toString(),
                        yValueMapper: (MonthylData data, _) => data.data),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget yearlyChart(fun, ctx, setStatus) {
  return Container(
    width: MediaQuery.of(ctx).size.width * 0.5,
    decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(blurRadius: 10.0, color: Color.fromRGBO(0, 0, 0, 0.1))
        ],
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5))),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Text(
          "Mumbai trends",
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
                onTap: () {
                  setStatus("2020");
                },
                child: LegendBuilder(
                    text: "Alerts 20",
                    color: isAlert2020Active
                        ? Colors.red[900]
                        : Colors.grey[300])),
            GestureDetector(
                onTap: () {
                  setStatus("2021");
                },
                child: LegendBuilder(
                    text: "Alerts 21",
                    color: isAlert2021Active
                        ? Colors.redAccent
                        : Colors.grey[300])),
            GestureDetector(
                onTap: () {
                  setStatus("2022");
                },
                child: LegendBuilder(
                    text: "Alerts 22",
                    color:
                        isAlert2022Active ? Colors.orange : Colors.grey[300])),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
                onTap: () {
                  setStatus("2020_usage");
                },
                child: LegendBuilder(
                    text: "Usage 20",
                    color: isUsage2020Active ? Colors.blue : Colors.grey[300])),
            GestureDetector(
                onTap: () {
                  setStatus("2021_usage");
                },
                child: LegendBuilder(
                    text: "Usage 21",
                    color:
                        isUsage2021Active ? Colors.yellow : Colors.grey[300])),
            LegendBuilder(
                text: "Usage 22",
                color: isUsage2022Active ? Colors.green : Colors.grey[300])
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(0),
              child: RotatedBox(
                  quarterTurns: 3,
                  child:
                      Text("Usage", style: TextStyle(color: Colors.black87))),
            ),
            SizedBox(
              width: MediaQuery.of(ctx).size.width * 0.85,
              height: MediaQuery.of(ctx).size.height * 0.28,
              child: SfCartesianChart(
                  onTooltipRender: ((tooltipArgs) => {
                        tappedItem = tooltipArgs.text!.split(' ')[0],
                        tooltipArgs.header = tooltipArgs.text!.split(' ')[0],
                        tooltipArgs.text = returnTooltipString(
                            ctx, tooltipArgs.text!.split(' ')[0]),
                      }),
                  selectionType: SelectionType.series,
                  tooltipBehavior: _tooltipBehavior,
                  primaryXAxis: CategoryAxis(
                    name: "",
                    labelsExtent: 100,
                    labelRotation: 15,
                    visibleMaximum: 6,
                    majorGridLines: const MajorGridLines(width: 0),
                  ),
                  primaryYAxis: NumericAxis(
                      labelsExtent: 32,
                      numberFormat: NumberFormat.compact(locale: "en_In")),
                  zoomPanBehavior: _zoomPanBehavior,
                  margin: EdgeInsets.all(0),
                  axes: <ChartAxis>[
                    NumericAxis(
                      name: "yAxis",
                      numberFormat: NumberFormat.compact(),
                      opposedPosition: true,
                      interval: 5000,
                    )
                  ],
                  series: <CartesianSeries>[
                    isAlert2020Active
                        ? ColumnSeries<ChartData, String>(
                            dataSource:
                                Provider.of<ChartDataProvider>(ctx).alerts2020,
                            name: "usage2020",
                            color: Colors.red[900],
                            enableTooltip: true,
                            width: 1,
                            spacing: 0,
                            yAxisName: 'yAxis',
                            borderWidth: 300,
                            onPointDoubleTap: (ChartPointDetails details) {
                              fun();
                            },
                            xValueMapper: (ChartData data, _) =>
                                data.month.toString(),
                            yValueMapper: (ChartData data, _) => data.data)
                        : ColumnSeries<ChartData, String>(
                            dataSource:
                                Provider.of<ChartDataProvider>(ctx).alerts2020,
                            name: "usage2020",
                            color: Colors.grey[300],
                            enableTooltip: true,
                            width: 1,
                            spacing: 0,
                            yAxisName: 'yAxis',
                            borderWidth: 300,
                            xValueMapper: (ChartData data, _) =>
                                data.month.toString(),
                            yValueMapper: (ChartData data, _) => data.data),
                    isAlert2021Active
                        ? ColumnSeries<ChartData, String>(
                            width: 1,
                            isVisibleInLegend: true,
                            name: 'usage2021',
                            spacing: 0,
                            yAxisName: 'yAxis',
                            enableTooltip: true,
                            color: Colors.red,
                            dataSource:
                                Provider.of<ChartDataProvider>(ctx).alerts2021,
                            xValueMapper: (ChartData data, _) =>
                                data.month.toString(),
                            yValueMapper: (ChartData data, _) => data.data)
                        : ColumnSeries<ChartData, String>(
                            width: 1,
                            isVisibleInLegend: true,
                            name: 'usage2021',
                            spacing: 0,
                            yAxisName: 'yAxis',
                            enableTooltip: true,
                            color: Colors.grey[300],
                            dataSource:
                                Provider.of<ChartDataProvider>(ctx).alerts2021,
                            xValueMapper: (ChartData data, _) =>
                                data.month.toString(),
                            yValueMapper: (ChartData data, _) => data.data),
                    isAlert2022Active
                        ? ColumnSeries<ChartData, String>(
                            dataSource:
                                Provider.of<ChartDataProvider>(ctx).alerts2022,
                            isVisibleInLegend: true,
                            color: Colors.orange,
                            name: "usage2022",
                            yAxisName: 'yAxis',
                            enableTooltip: true,
                            xValueMapper: (ChartData data, _) =>
                                data.month.toString(),
                            yValueMapper: (ChartData data, _) =>
                                data.data == 0 ? null : data.data)
                        : ColumnSeries<ChartData, String>(
                            dataSource:
                                Provider.of<ChartDataProvider>(ctx).alerts2022,
                            isVisibleInLegend: true,
                            color: Colors.grey[300],
                            name: "usage2022",
                            yAxisName: 'yAxis',
                            enableTooltip: true,
                            xValueMapper: (ChartData data, _) =>
                                data.month.toString(),
                            yValueMapper: (ChartData data, _) =>
                                data.data == 0 ? null : data.data),
                    isUsage2020Active
                        ? LineSeries<ChartData, String>(
                            dataSource:
                                Provider.of<ChartDataProvider>(ctx).usage2020,
                            color: const Color.fromRGBO(13, 71, 161, 1),
                            name: "alerts2020",
                            enableTooltip: true,
                            isVisibleInLegend: true,
                            emptyPointSettings:
                                EmptyPointSettings(mode: EmptyPointMode.drop),
                            xValueMapper: (ChartData data, _) =>
                                data.month.toString(),
                            yValueMapper: (ChartData data, _) =>
                                data.data == 0 ? null : data.data)
                        : LineSeries<ChartData, String>(
                            dataSource:
                                Provider.of<ChartDataProvider>(ctx).usage2020,
                            color: Colors.grey[300],
                            name: "alerts2020",
                            enableTooltip: true,
                            isVisibleInLegend: true,
                            emptyPointSettings:
                                EmptyPointSettings(mode: EmptyPointMode.drop),
                            xValueMapper: (ChartData data, _) =>
                                data.month.toString(),
                            yValueMapper: (ChartData data, _) =>
                                data.data == 0 ? null : data.data),
                    isUsage2021Active
                        ? LineSeries<ChartData, String>(
                            dataSource:
                                Provider.of<ChartDataProvider>(ctx).usage2021,
                            isVisibleInLegend: true,
                            color: Colors.yellow,
                            name: "alerts2021",
                            emptyPointSettings: EmptyPointSettings(
                              mode: EmptyPointMode.drop,
                            ),
                            enableTooltip: true,
                            xValueMapper: (ChartData data, _) =>
                                data.month.toString(),
                            yValueMapper: (ChartData data, _) =>
                                data.data == 0 ? null : data.data)
                        : LineSeries<ChartData, String>(
                            dataSource:
                                Provider.of<ChartDataProvider>(ctx).usage2021,
                            isVisibleInLegend: true,
                            color: Colors.grey[300],
                            name: "alerts2021",
                            emptyPointSettings: EmptyPointSettings(
                              mode: EmptyPointMode.drop,
                            ),
                            enableTooltip: true,
                            xValueMapper: (ChartData data, _) =>
                                data.month.toString(),
                            yValueMapper: (ChartData data, _) =>
                                data.data == 0 ? null : data.data),
                    isUsage2022Active
                        ? LineSeries<ChartData, String>(
                            dataSource:
                                Provider.of<ChartDataProvider>(ctx).usage2022,
                            isVisibleInLegend: true,
                            enableTooltip: true,
                            color: Colors.green,
                            emptyPointSettings:
                                EmptyPointSettings(mode: EmptyPointMode.drop),
                            name: "alerts2022",
                            xValueMapper: (ChartData data, _) =>
                                data.month.toString(),
                            yValueMapper: (ChartData data, _) =>
                                data.data == 0 ? null : data.data)
                        : LineSeries<ChartData, String>(
                            dataSource:
                                Provider.of<ChartDataProvider>(ctx).usage2021,
                            isVisibleInLegend: true,
                            color: Colors.grey[300],
                            name: "alerts2021",
                            emptyPointSettings: EmptyPointSettings(
                              mode: EmptyPointMode.drop,
                            ),
                            enableTooltip: true,
                            xValueMapper: (ChartData data, _) =>
                                data.month.toString(),
                            yValueMapper: (ChartData data, _) =>
                                data.data == 0 ? null : data.data),
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.all(0),
              child: RotatedBox(
                  quarterTurns: 1,
                  child:
                      Text("Alerts", style: TextStyle(color: Colors.black87))),
            ),
          ],
        ),
      ],
    ),
  );
}
