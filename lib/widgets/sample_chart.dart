import 'package:flutter/material.dart';
import 'package:nudron/models/chart_data.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class CustombarChart extends StatefulWidget {
  const CustombarChart({
    Key? key,
  }) : super(key: key);
  @override
  State<CustombarChart> createState() => _CustombarChartState();
}

class _CustombarChartState extends State<CustombarChart> {
  bool isMonthData = true;
  List<SampleChartData> monthlyData = [];
  @override
  Widget build(BuildContext context) {
    return

        // GestureDetector(
        //   onDoubleTap: () {
        //     setState(() {
        //       isMonthData = !isMonthData;
        //     });
        //   },
        //   child:

        charts.NumericComboChart(
            isMonthData
                ? _createSampleData()
                : _createDataForMonth(monthlyData),
            animate: true,
            defaultRenderer: charts.LineRendererConfig(),
            animationDuration: const Duration(milliseconds: 100),
            defaultInteractions: true,
            selectionModels: [
          charts.SelectionModelConfig(
              changedListener: (charts.SelectionModel model) => {
                    model.selectedDatum.forEach((element) {
                      var data = element.datum as SampleChartData;
                      SampleChartData extracted =
                          SampleChartData(data1: data.data1, data2: data.data2);
                      monthlyData.add(extracted);
                    }),
                    setState(() {
                      isMonthData = !isMonthData;
                      _createDataForMonth(monthlyData);
                    })
                  })
        ],
            customSeriesRenderers: [
          charts.BarRendererConfig(customRendererId: 'customBar')
        ]

            //  )
            );
  }

  static List<charts.Series<SampleChartData, int>> _createDataForMonth(list) {
    return [
      charts.Series<SampleChartData, int>(
        id: 'yearrange1',
        colorFn: (_, __) => charts.MaterialPalette.yellow.shadeDefault,
        domainFn: (SampleChartData sales, _) => sales.data1,
        measureFn: (SampleChartData sales, _) => sales.data2,
        data: list,
      )..setAttribute(charts.rendererIdKey, 'customBar'),
    ];
  }

  static List<charts.Series<SampleChartData, int>> _createSampleData() {
    return [
      charts.Series<SampleChartData, int>(
        id: 'yearrange1',
        colorFn: (_, __) => charts.MaterialPalette.yellow.shadeDefault,
        domainFn: (SampleChartData sales, _) => sales.data1,
        measureFn: (SampleChartData sales, _) => sales.data2,
        data: SampleChartData.dataset1,
      ),
      charts.Series<SampleChartData, int>(
        id: 'yearrange2',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (SampleChartData sales, _) => sales.data1,
        measureFn: (SampleChartData sales, _) => sales.data2,
        data: SampleChartData.dataset2,
      ),
      charts.Series<SampleChartData, int>(
        id: 'yearrange3',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (SampleChartData sales, _) => sales.data1,
        measureFn: (SampleChartData sales, _) => sales.data2,
        data: SampleChartData.dataset3,
      )
        // Configure our custom bar renderer for this series.
        ..setAttribute(charts.rendererIdKey, 'customBar'),
      charts.Series<SampleChartData, int>(
        id: 'yearrange4',
        colorFn: (_, __) => charts.MaterialPalette.deepOrange.shadeDefault,
        domainFn: (SampleChartData sales, _) => sales.data1,
        measureFn: (SampleChartData sales, _) => sales.data2,
        data: SampleChartData.dataset4,
      )
        // Configure our custom bar renderer for this series.
        ..setAttribute(charts.rendererIdKey, 'customBar'),
      charts.Series<SampleChartData, int>(
        id: 'yearrange5',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (SampleChartData sales, _) => sales.data1,
        measureFn: (SampleChartData sales, _) => sales.data2,
        data: SampleChartData.dataset5,
      )
        // Configure our custom bar renderer for this series.
        ..setAttribute(charts.rendererIdKey, 'customBar'),
      charts.Series<SampleChartData, int>(
          id: 'yearrange6',
          colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
          domainFn: (SampleChartData sales, _) => sales.data1,
          measureFn: (SampleChartData sales, _) => sales.data2,
          data: SampleChartData.dataset6),
    ];
  }
}
