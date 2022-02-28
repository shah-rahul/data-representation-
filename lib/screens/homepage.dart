import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nudron/screens/chart_page.dart';
import 'package:nudron/screens/map_page.dart';
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
  late PageController _firstController;
  @override
  void initState() {
    _firstController = PageController(initialPage: 0);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var itemList = [
      // SizedBox(child: MapPage()),

      SizedBox(
        child: PrimaryCard(
          button1: TextButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => MapPage()));
              },
              child: const Icon(Icons.arrow_upward),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    const Color.fromRGBO(138, 117, 206, 1)),
                foregroundColor: MaterialStateProperty.all(Colors.white),
              )),
          childone: const DeviceGroup(),
          childtwo: DeviceHistory(),
        ),
      ),

      SizedBox(child: SampleMap())
    ];
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
                  maxHeight: MediaQuery.of(context).size.height * 0.9 -
                      (MediaQuery.of(context).size.height * 0.04),
                  minWidth: MediaQuery.of(context).size.width -
                      (MediaQuery.of(context).size.width * 0.04),
                ),
                child: PrimaryScrollController(
                  controller: PageController(viewportFraction: 0.9),
                  child: PageView(
                    scrollDirection: Axis.horizontal,
                    physics: const PageScrollPhysics(),
                    children: [
                      PageView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: 2,
                        controller: _firstController,
                        itemBuilder: (context, index) {
                          return itemList[index];
                        },
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
    );
  }
}
