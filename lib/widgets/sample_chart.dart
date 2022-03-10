import 'dart:math';

import 'package:flutter/material.dart';
import 'package:charts_flutter/src/text_element.dart' as ChartText;
import 'package:charts_flutter/src/text_style.dart' as ChartStyle;
import 'package:nudron/models/chart_data.dart';
import 'package:charts_flutter/flutter.dart' as charts;

int prev = DateTime.now().millisecondsSinceEpoch;

class CustombarChart extends StatefulWidget {
  const CustombarChart({
    Key? key,
  }) : super(key: key);
  @override
  State<CustombarChart> createState() => _CustombarChartState();
}

class _CustombarChartState extends State<CustombarChart> {
  bool isMonthData = true;
  @override
  void initState() {
    super.initState();
  }

  List<SampleChartData> monthlyData = [];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 1.5,
        child: GestureDetector(
            onDoubleTap: () {
              setState(() {
                isMonthData = !isMonthData;
              });
            },
            child: charts.NumericComboChart(
                isMonthData
                    ? _createSampleData()
                    : _createDataForMonth(monthlyData),
                animate: true,
                defaultRenderer: charts.LineRendererConfig(),
                animationDuration: const Duration(milliseconds: 100),
                defaultInteractions: true,
                behaviors: [
                  // charts.SlidingViewport(),
                  // charts.PanAndZoomBehavior(),

                  // charts.SeriesLegend(
                  //     position: charts.BehaviorPosition.top,
                  //     horizontalFirst: false,
                  //     desiredMaxRows: 2,
                  //     entryTextStyle: const TextStyleSpec(
                  //         fontSize: 15, color: charts.MaterialPalette.black),
                  //     cellPadding: const EdgeInsets.only(right: 8.0, bottom: 4.0),
                  //     // showMeasures: true,
                  //     insideJustification: InsideJustification.topStart),
                  charts.SelectNearest(
                      eventTrigger: charts.SelectionTrigger.tapAndDrag),
                  charts.LinePointHighlighter(
                    symbolRenderer: CustomCircleSymbolRenderer(size: size),
                  ),
                ],
                selectionModels: [
                  charts.SelectionModelConfig(
                      type: charts.SelectionModelType.info,
                      changedListener: (charts.SelectionModel model) {
                        int curr = DateTime.now().millisecondsSinceEpoch;
                        if (model.hasDatumSelection) {
                          monthlyData = [];
                          // model.selectedDatum
                          //     .forEach((charts.SeriesDatum datumPair) {
                          //   var data = datumPair.datum as SampleChartData;
                          // });
                          monthlyData = SampleChartData.dataset5;
                          selectedDatum = [];
                          model.selectedDatum
                              .forEach((charts.SeriesDatum datumPair) {
                            var data = datumPair.datum as SampleChartData;

                            selectedDatum.add({
                              'color': datumPair.series.colorFn!(0),
                              'text': '${data.data1} : ${data.data2}'
                            });
                          });
                        }
                      })
                ],
                customSeriesRenderers: [
                  charts.BarRendererConfig(
                    maxBarWidthPx: 4000000,
                    strokeWidthPx: 10000,
                    customRendererId: 'customBar')
                ])),
      ),
    );
  }

  static List<charts.Series<SampleChartData, int>> _createDataForMonth(list) {
    return [
      charts.Series<SampleChartData, int>(
        id: 'monthRange1',
        colorFn: (_, __) => charts.MaterialPalette.purple.shadeDefault,
        domainFn: (SampleChartData sales, _) => sales.data1,
        measureFn: (SampleChartData sales, _) => sales.data2,
        data: list,
      )..setAttribute(charts.rendererIdKey, 'customBar'),
    ];
  }

  static List selectedDatum = [];
  static String unit = "6";
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

//---
class CustomCircleSymbolRenderer extends charts.CircleSymbolRenderer {
  final size;

  CustomCircleSymbolRenderer({this.size});

  @override
  void paint(charts.ChartCanvas canvas, Rectangle bounds,
      {List<int>? dashPattern,
      charts.Color? fillColor,
      charts.FillPatternType? fillPattern,
      charts.Color? strokeColor,
      double? strokeWidthPx}) {
    super.paint(canvas, bounds,
        dashPattern: dashPattern,
        fillColor: fillColor,
        strokeColor: strokeColor,
        strokeWidthPx: strokeWidthPx);

    List tooltips = _CustombarChartState.selectedDatum;
    String unit = _CustombarChartState.unit;
    if (tooltips != null && tooltips.length > 0) {
      num tipTextLen = (tooltips[0]['text'] + unit).length;
      num rectWidth = bounds.width + tipTextLen * 8.3;
      num rectHeight = bounds.height + 20 + (tooltips.length - 1) * 18;
      num left = bounds.left > (size?.width ?? 300) / 2
          ? (bounds.left > size?.width / 4
              ? bounds.left - rectWidth
              : bounds.left - rectWidth / 2)
          : bounds.left - 40;

      canvas.drawRect(Rectangle(left, 0, rectWidth, rectHeight),
          fill: charts.Color.fromHex(code: '#666666'));

      for (int i = 0; i < tooltips.length; i++) {
        canvas.drawPoint(
          point: Point(left.round() + 6, (i + 1) * 15),
          radius: 3,
          fill: tooltips[i]['color'],
          stroke: charts.Color.white,
          strokeWidthPx: 1,
        );
        ChartStyle.TextStyle textStyle = ChartStyle.TextStyle();
        textStyle.color = charts.Color.white;
        textStyle.fontSize = 13;
        canvas.drawText(
            ChartText.TextElement(tooltips[i]['text'], style: textStyle),
            left.round() + 15,
            i * 15 + 8);
      }
    }
  }
}
