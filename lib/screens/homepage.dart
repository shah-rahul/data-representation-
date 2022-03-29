import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nudron/providers/mapDataProdiver.dart';
import 'package:nudron/providers/tableDataProvider.dart';
import 'package:nudron/widgets/bottom_card.dart';
import 'package:nudron/widgets/level1/device_list.dart';
import 'package:nudron/widgets/level2/billing_history.dart';
import 'package:nudron/widgets/level3/billing_group.dart';
import 'package:nudron/widgets/primary_card.dart';
import 'package:nudron/widgets/universal_drawer.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  static const String routeName = "/homePage";

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

bool loaded = false;

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

  void initLoader() {
    if (!loaded) {
      Provider.of<MapDataProvider>(context).mapLoader();
      Provider.of<TableDataProvider>(context).billingHistoryDataLoader();
      Provider.of<TableDataProvider>(context).historyDataLoader();
      Provider.of<TableDataProvider>(context).deviceListLoader();
      Provider.of<TableDataProvider>(context).bllingDataLoader();
      
    }
    loaded = true;
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    initLoader();
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
                          controller: PageController(viewportFraction: 0.92),
                          children: const [
                            PrimaryCard(
                              childone: BillingGroup(),
                            ),
                            PrimaryCard(
                              childone: BillingHistory(),
                            ),
                            PrimaryCard(
                              childone: DeviceList(),
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
