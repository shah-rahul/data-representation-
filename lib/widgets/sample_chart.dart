import 'package:flutter/material.dart';
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
late List<ChartData> monthData;
late ZoomPanBehavior _zoomPanBehavior;
late TooltipBehavior _tooltipBehavior;

class _CustombarChartState extends State<CustombarChart> {
  @override
  void initState() {
    super.initState();
    monthData = ChartData.dataset5;

    _zoomPanBehavior = ZoomPanBehavior(
      enablePinching: true,
      enablePanning: true,
    );
    _tooltipBehavior = TooltipBehavior(
      enable: true,
    );
  }

  void notifyParent(int x) {
    // print('called');
    isMonthData = !isMonthData;
    var tappedData = ChartData(month: x.toString(), data: 78);
    monthData[0] = tappedData;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 2.5,
      child: isMonthData ? monthlyChart() : yearlyChart(notifyParent, context),
    );
  }
}

Widget monthlyChart() {
  return SfCartesianChart(
    primaryXAxis: CategoryAxis(),
    series: <CartesianSeries>[
      ColumnSeries<ChartData, String>(
          dataSource: monthData,
          xValueMapper: (ChartData data, _) => data.month.toString(),
          yValueMapper: (ChartData data, _) => data.data),
    ],
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
              tooltipBehavior: _tooltipBehavior,
              primaryXAxis: CategoryAxis(
                visibleMaximum: 8,
                majorGridLines: const MajorGridLines(width: 0),
              ),
              margin: EdgeInsets.zero,
              zoomPanBehavior: _zoomPanBehavior,
              series: <CartesianSeries>[
                ColumnSeries<ChartData, String>(
                    dataSource: Provider.of<ChartDataProvider>(ctx).alerts2020,
                    name: "usage2020",
                    color: Colors.red[900],
                    enableTooltip: true,
                    width: 1,
                    spacing: 0,
                    borderWidth: 300,
                    onPointDoubleTap: (ChartPointDetails details) {
                      // print(details.pointIndex);
                      int index = details.pointIndex ?? 0;

                      fun(index);
                    },
                    xValueMapper: (ChartData data, _) => data.month.toString(),
                    yValueMapper: (ChartData data, _) => data.data),
                ColumnSeries<ChartData, String>(
                    width: 1,
                    isVisibleInLegend: true,
                    name: 'usage2021',
                    spacing: 0,
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
                    enableTooltip: true,
                    xValueMapper: (ChartData data, _) => data.month.toString(),
                    yValueMapper: (ChartData data, _) => data.data),
                LineSeries<ChartData, String>(
                    dataSource: Provider.of<ChartDataProvider>(ctx).usage2020,
                    color: Colors.blue[900],
                    name: "alerts2020",
                    enableTooltip: true,
                    isVisibleInLegend: true,
                    xValueMapper: (ChartData data, _) => data.month.toString(),
                    yValueMapper: (ChartData data, _) => data.data),
                LineSeries<ChartData, String>(
                    dataSource: Provider.of<ChartDataProvider>(ctx).usage2021,
                    isVisibleInLegend: true,
                    color: Colors.yellow,
                    name: "alerts2021",
                    enableTooltip: true,
                    xValueMapper: (ChartData data, _) => data.month.toString(),
                    yValueMapper: (ChartData data, _) => data.data),
                LineSeries<ChartData, String>(
                    dataSource: Provider.of<ChartDataProvider>(ctx).usage2022,
                    isVisibleInLegend: true,
                    enableTooltip: true,
                    color: Colors.blue,
                    name: "alerts2022",
                    xValueMapper: (ChartData data, _) => data.month.toString(),
                    yValueMapper: (ChartData data, _) => data.data),
              ]),
        ),
      ),
    ],
  );
}
