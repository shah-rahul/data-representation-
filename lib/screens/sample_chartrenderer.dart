import 'package:flutter/material.dart';
import 'package:nudron/widgets/sample_chart.dart';

class ChartContainer extends StatefulWidget {
  ChartContainer({Key? key}) : super(key: key);

  @override
  State<ChartContainer> createState() => _ChartContainerState();
}

class _ChartContainerState extends State<ChartContainer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
      height: MediaQuery.of(context).size.height * 0.4,
      width: MediaQuery.of(context).size.width * 0.9,
      child: CustombarChart(),
    )));
  }
}
