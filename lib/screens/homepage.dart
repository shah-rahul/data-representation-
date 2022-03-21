import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nudron/widgets/bottom_card.dart';
import 'package:nudron/widgets/level1/device_group.dart';
import 'package:nudron/widgets/primary_card.dart';
import 'package:nudron/widgets/universal_drawer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  static const String routeName = "/homePage";

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

late TabController tabController;

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  // ignore: unused_field
  late PageController _firstController;
  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    _firstController = PageController(initialPage: 0);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.initState();
  }

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
                  maxHeight: MediaQuery.of(context).size.height * 0.9 -
                      (MediaQuery.of(context).size.height * 0.04),
                  minWidth: MediaQuery.of(context).size.width -
                      (MediaQuery.of(context).size.width * 0.04),
                ),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.9,
                  child: Column(
                    children: [
                      // Text(
                      //   "header/header2",
                      //   style: Theme.of(context).primaryTextTheme.headline1,
                      // ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.4,
                        child: PageView(
                          scrollDirection: Axis.horizontal,
                          physics: const PageScrollPhysics(),
                          controller: PageController(viewportFraction: 0.9),
                          children: const [
                            PrimaryCard(
                              childone: DeviceGroup(),
                            ),
                            PrimaryCard(
                              childone: DeviceGroup(),
                            ),
                            PrimaryCard(
                              childone: DeviceGroup(),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.4,
                            child: const BottomCard()),
                      )
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
