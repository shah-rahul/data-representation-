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
  @override
  Widget build(BuildContext context) {
    return charts.NumericComboChart(_createSampleData(),
        animate: false,
        defaultRenderer: charts.LineRendererConfig(),
        customSeriesRenderers: [
          charts.BarRendererConfig(customRendererId: 'customBar')
        ]);
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
