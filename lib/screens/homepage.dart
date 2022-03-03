import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nudron/screens/chart_page.dart';
import 'package:nudron/screens/map_page.dart';
import 'package:nudron/widgets/level1/device_group.dart';
import 'package:nudron/widgets/level1/device_history.dart';
import 'package:nudron/widgets/primary_card.dart';
import 'package:nudron/widgets/sample_chart.dart';
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
  late PageController _firstController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
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
                child: PrimaryScrollController(
                  controller: PageController(viewportFraction: 0.9),
                  child: PageView(
                    scrollDirection: Axis.horizontal,
                    physics: const PageScrollPhysics(),
                    children: [
                      SizedBox(
                          child: PrimaryCard(
                        childone: const DeviceGroup(),
                        childtwo: DefaultTabController(
                          length: 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: 50,
                                width: MediaQuery.of(context).size.width * 0.9,
                                decoration: BoxDecoration(
                                    color: Colors.black87,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TabBar(
                                      unselectedLabelColor: Colors.white,
                                      indicatorPadding: const EdgeInsets.only(
                                          left: 5, right: 5),
                                      indicator: BoxDecoration(
                                          color: Colors.grey[600],
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      tabs: const [
                                        Tab(
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Text("Device history"),
                                          ),
                                        ),
                                        Tab(
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Text("Chart"),
                                          ),
                                        ),
                                        Tab(
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Text("Map"),
                                          ),
                                        ),
                                      ]),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.4,
                                child: TabBarView(children: [
                                  SizedBox(
                                      child: FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: DeviceHistory())),
                                  const Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: CustombarChart(),
                                  ),
                                  MapPage(),
                                ]),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(8)),
                                child: TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      "See On Map",
                                      style: TextStyle(color: Colors.white),
                                    )),
                              )
                            ],
                          ),
                        ),
                      )),
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
