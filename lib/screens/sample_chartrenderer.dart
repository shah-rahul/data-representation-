import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nudron/widgets/sample_chart.dart';

class ChartContainer extends StatefulWidget {
  const ChartContainer({Key? key}) : super(key: key);

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
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          elevation: 0,
        ),
        body: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.8,
                child: Container(
                    decoration: const BoxDecoration(color: Colors.white),
                    child: const CustombarChart()),
              ),
            ),
            Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height * 0.9,
              width: (MediaQuery.of(context).size.width * 0.2 -
                  MediaQuery.of(context).size.width * 0.05),
            )
          ],
        ));
  }
}
