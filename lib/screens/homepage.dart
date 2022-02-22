import 'package:flutter/material.dart';
import 'package:nudron/models/chart_data.dart';
import 'package:nudron/screens/new_page.dart';
import 'package:nudron/screens/sample_chartrenderer.dart';
import 'package:nudron/widgets/level1/device_group.dart';
import 'package:nudron/widgets/level1/device_history.dart';
import 'package:nudron/widgets/primary_card.dart';
import 'package:nudron/widgets/universal_drawer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  static const String routeName = "/homePage";

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NudronDrawer(),
      appBar: AppBar(
        title: const Text("Nudron"),
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.8,
                  minWidth: MediaQuery.of(context).size.width -
                      (MediaQuery.of(context).size.width * 0.04),
                ),
                child: PrimaryScrollController(
                  controller: PageController(viewportFraction: 0.9),
                  child: PageView(
                    scrollDirection: Axis.horizontal,
                    physics: const PageScrollPhysics(),
                    children: [
                      PrimaryCard(
                        childone: DeviceGroup(),
                        childtwo: DeviceHistory(),
                      ),
                      PrimaryCard(
                        childone: DeviceGroup(),
                        childtwo: DeviceHistory(),
                      ),
                      PrimaryCard(
                        childone: DeviceGroup(),
                        childtwo: DeviceHistory(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => ChartContainer()));
        },
        child: Icon(Icons.add_chart),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
