import 'package:flutter/material.dart';
import 'package:nudron/models/chart_data.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class CustombarChart extends StatefulWidget {
  CustombarChart({
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
        id: 'Desktop',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (SampleChartData sales, _) => sales.data1,
        measureFn: (SampleChartData sales, _) => sales.data2,
        data: SampleChartData.dataset1,
      )
        // Configure our custom bar renderer for this series.
        ..setAttribute(charts.rendererIdKey, 'customBar'),
      charts.Series<SampleChartData, int>(
        id: 'Tablet',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (SampleChartData sales, _) => sales.data1,
        measureFn: (SampleChartData sales, _) => sales.data2,
        data: SampleChartData.dataset2,
      )
        // Configure our custom bar renderer for this series.
        ..setAttribute(charts.rendererIdKey, 'customBar'),
      charts.Series<SampleChartData, int>(
          id: 'Mobile',
          colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
          domainFn: (SampleChartData sales, _) => sales.data1,
          measureFn: (SampleChartData sales, _) => sales.data2,
          data: SampleChartData.dataset3),
    ];
  }
}
