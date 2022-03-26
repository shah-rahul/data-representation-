import 'package:flutter/material.dart';
import 'package:nudron/models/monthly_data_model.dart';
import 'package:nudron/providers/chartDataProvider.dart';
import 'package:nudron/widgets/utils/legend_builder.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

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
String tappedItem = "india";
late ZoomPanBehavior _zoomPanBehavior;
late TooltipBehavior _tooltipBehavior;

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

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 2.5,
      child: isMonthData
          ? monthlyChart(context, changeGraph)
          : yearlyChart(notifyParent, context),
    );
  }
}

Widget monthlyChart(ctx, fun) {
  return GestureDetector(
    onDoubleTap: () {
      fun();
    },
    child: Column(
      children: [
        Text(
          Provider.of<ChartDataProvider>(ctx).selectedMonth,
          style: const TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            LegendBuilder(text: "Alerts 20", color: Colors.red[900]),
            const LegendBuilder(text: "Alerts 21", color: Colors.redAccent),
            const LegendBuilder(text: "Alerts 22", color: Colors.orange)
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            LegendBuilder(text: "Usage 20", color: Colors.blue),
            LegendBuilder(text: "Usage 21", color: Colors.yellow),
            LegendBuilder(text: "Usage 22", color: Colors.green)
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: GestureDetector(
            onDoubleTap: () => fun(),
            child: SfCartesianChart(
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
                interval: 1,
                visibleMaximum: 10,
              ),
              series: <CartesianSeries>[
                ColumnSeries<MonthylData, String>(
                    dataSource:
                        Provider.of<ChartDataProvider>(ctx).monthlyDataList[0],
                    xValueMapper: (MonthylData data, _) =>
                        data.date.day.toString(),
                    color: Colors.red[900],
                    name: 'usage2020',
                    enableTooltip: true,
                    yAxisName: 'yAxis',
                    yValueMapper: (MonthylData data, _) => data.data),
                ColumnSeries<MonthylData, String>(
                    enableTooltip: true,
                    color: Colors.red,
                    name: 'usage2021',
                    yAxisName: 'yAxis',
                    dataSource:
                        Provider.of<ChartDataProvider>(ctx).monthlyDataList[1],
                    xValueMapper: (MonthylData data, _) =>
                        data.date.day.toString(),
                    yValueMapper: (MonthylData data, _) => data.data),
                ColumnSeries<MonthylData, String>(
                    color: Colors.orange,
                    name: "usage2022",
                    yAxisName: 'yAxis',
                    enableTooltip: true,
                    dataSource:
                        Provider.of<ChartDataProvider>(ctx).monthlyDataList[2],
                    xValueMapper: (MonthylData data, _) =>
                        data.date.day.toString(),
                    yValueMapper: (MonthylData data, _) => data.data),
                LineSeries<MonthylData, String>(
                    color: const Color.fromRGBO(13, 71, 161, 1),
                    name: "alerts2020",
                    enableTooltip: true,
                    dataSource:
                        Provider.of<ChartDataProvider>(ctx).monthlyDataList[3],
                    xValueMapper: (MonthylData data, _) =>
                        data.date.day.toString(),
                    yValueMapper: (MonthylData data, _) => data.data),
                LineSeries<MonthylData, String>(
                    color: Colors.yellow,
                    name: "alerts2021",
                    dataSource:
                        Provider.of<ChartDataProvider>(ctx).monthlyDataList[4],
                    xValueMapper: (MonthylData data, _) =>
                        data.date.day.toString(),
                    yValueMapper: (MonthylData data, _) => data.data),
                LineSeries<MonthylData, String>(
                    color: Colors.green,
                    name: "alerts2022",
                    dataSource:
                        Provider.of<ChartDataProvider>(ctx).monthlyDataList[5],
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

Widget yearlyChart(fun, ctx) {
  return Column(
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
          LegendBuilder(text: "Alerts 20", color: Colors.red[900]),
          const LegendBuilder(text: "Alerts 21", color: Colors.redAccent),
          const LegendBuilder(text: "Alerts 22", color: Colors.orange)
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          LegendBuilder(text: "Usage 20", color: Colors.blue),
          LegendBuilder(text: "Usage 21", color: Colors.yellow),
          LegendBuilder(text: "Usage 22", color: Colors.green)
        ],
      ),
      Padding(
        padding: const EdgeInsets.only(top: 5),
        child: SizedBox(
          child: SfCartesianChart(
              onTooltipRender: ((tooltipArgs) => {
                    tappedItem = tooltipArgs.text!.split(' ')[0],
                  }),
              selectionType: SelectionType.series,
              tooltipBehavior: _tooltipBehavior,
              primaryXAxis: CategoryAxis(
                name: "",
                visibleMaximum: 8,
                majorGridLines: const MajorGridLines(width: 0),
              ),
              margin: EdgeInsets.zero,
              zoomPanBehavior: _zoomPanBehavior,
              axes: <ChartAxis>[
                NumericAxis(
                  name: "yAxis",
                  opposedPosition: true,
                  interval: 5000,
                )
              ],
              series: <CartesianSeries>[
                ColumnSeries<ChartData, String>(
                    dataSource: Provider.of<ChartDataProvider>(ctx).alerts2020,
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
                    xValueMapper: (ChartData data, _) => data.month.toString(),
                    yValueMapper: (ChartData data, _) => data.data),
                ColumnSeries<ChartData, String>(
                    width: 1,
                    isVisibleInLegend: true,
                    name: 'usage2021',
                    spacing: 0,
                    yAxisName: 'yAxis',
                    enableTooltip: true,
                    color: Colors.red,
                    dataSource: Provider.of<ChartDataProvider>(ctx).alerts2021,
                    xValueMapper: (ChartData data, _) => data.month.toString(),
                    yValueMapper: (ChartData data, _) => data.data),
                ColumnSeries<ChartData, String>(
                    dataSource: Provider.of<ChartDataProvider>(ctx).alerts2022,
                    isVisibleInLegend: true,
                    color: Colors.orange,
                    name: "usage2022",
                    yAxisName: 'yAxis',
                    enableTooltip: true,
                    xValueMapper: (ChartData data, _) => data.month.toString(),
                    yValueMapper: (ChartData data, _) =>
                        data.data == 0 ? null : data.data),
                LineSeries<ChartData, String>(
                    dataSource: Provider.of<ChartDataProvider>(ctx).usage2020,
                    color: const Color.fromRGBO(13, 71, 161, 1),
                    name: "alerts2020",
                    enableTooltip: true,
                    isVisibleInLegend: true,
                    emptyPointSettings:
                        EmptyPointSettings(mode: EmptyPointMode.drop),
                    xValueMapper: (ChartData data, _) => data.month.toString(),
                    yValueMapper: (ChartData data, _) =>
                        data.data == 0 ? null : data.data),
                LineSeries<ChartData, String>(
                    dataSource: Provider.of<ChartDataProvider>(ctx).usage2021,
                    isVisibleInLegend: true,
                    color: Colors.yellow,
                    name: "alerts2021",
                    emptyPointSettings: EmptyPointSettings(
                      mode: EmptyPointMode.drop,
                    ),
                    enableTooltip: true,
                    xValueMapper: (ChartData data, _) => data.month.toString(),
                    yValueMapper: (ChartData data, _) =>
                        data.data == 0 ? null : data.data),
                LineSeries<ChartData, String>(
                    dataSource: Provider.of<ChartDataProvider>(ctx).usage2022,
                    isVisibleInLegend: true,
                    enableTooltip: true,
                    color: Colors.green,
                    emptyPointSettings:
                        EmptyPointSettings(mode: EmptyPointMode.drop),
                    name: "alerts2022",
                    xValueMapper: (ChartData data, _) => data.month.toString(),
                    yValueMapper: (ChartData data, _) =>
                        data.data == 0 ? null : data.data),
              ]),
        ),
      ),
    ],
  );
}
