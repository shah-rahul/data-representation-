import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nudron/widgets/sample_chart.dart';

class ChartContainer extends StatefulWidget {
  ChartContainer({Key? key}) : super(key: key);

  @override
  State<ChartContainer> createState() => _ChartContainerState();
}

class _ChartContainerState extends State<ChartContainer> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    super.initState();
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Nudron"),
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
          elevation: 0,
        ),
        body: Center(
            child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.9,
          width: MediaQuery.of(context).size.width * 0.9,
          child: CustombarChart(),
        )));
  }
}
