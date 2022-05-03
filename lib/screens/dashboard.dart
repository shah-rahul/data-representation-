import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nudron/providers/globalConfigProvider.dart';
import 'package:nudron/providers/mapDataProdiver.dart';
import 'package:nudron/providers/tableDataProvider.dart';
import 'package:nudron/providers/userDataProvider.dart';
import 'package:nudron/widgets/bottom_card.dart';
import 'package:nudron/widgets/level1/device_list.dart';
import 'package:nudron/widgets/level2/billing_history.dart';
import 'package:nudron/widgets/level3/billing_group.dart';
import 'package:nudron/widgets/level4/levelFourBottomCard.dart';
import 'package:nudron/widgets/level4/zonalCard.dart';
import 'package:nudron/widgets/primary_card.dart';
import 'package:nudron/widgets/universal_drawer.dart';
import 'package:nudron/widgets/utils/dotDecotaror.dart';
import 'package:nudron/widgets/utils/dotIndicator.dart';
import 'package:provider/provider.dart';

import '../providers/chartDataProvider.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);
  static const String routeName = "/dashBoard";

  @override
  State<DashBoard> createState() => _MyHomePageState();
}

bool loaded = false;

late TabController tabController;

class _MyHomePageState extends State<DashBoard>
    with SingleTickerProviderStateMixin {
  // ignore: unused_field
  late PageController _firstController;
  @override
  void initState() {
    Timer myTimer = Timer.periodic(Duration(minutes: 10), (Timer t) {
       
  });
    tabController = TabController(length: 3, vsync: this);
    _firstController = PageController(initialPage: 0);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.initState();
  }

  void initLoader() {
    if (!loaded) {
      Provider.of<MapDataProvider>(context, listen: false).mapLoader();
      Provider.of<TableDataProvider>(context, listen: false).billingHistoryDataLoader();
      Provider.of<TableDataProvider>(context, listen: false).zonalDataLoader();
      Provider.of<TableDataProvider>(context, listen: false).deviceHistoryDataLoader();
      Provider.of<TableDataProvider>(context, listen: false).deviceListLoader();
      Provider.of<TableDataProvider>(context, listen: false).bllingDataLoader();
      Provider.of<UserDataProvider>(context, listen: false).userDataLoader();
      Provider.of<GlobalConfigProvider>(context, listen: false).historyHeaderLoader();
    Provider.of<ChartDataProvider>(context).initCall();

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
                      (MediaQuery.of(context).size.height * 0.03),
                  minWidth: MediaQuery.of(context).size.width -
                      (MediaQuery.of(context).size.width * 0.04),
                ),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.87,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.05,
                            ),
                            Text(
                              "header/header2",
                              style:
                                  Theme.of(context).primaryTextTheme.overline,
                            ),
                          ],
                        ),
                      ),
                      Provider.of<GlobalConfigProvider>(context).isLevelFour
                          ? SizedBox(
                              height: MediaQuery.of(context).size.height * 0.4,
                              child: PageView(
                                onPageChanged: (index) {
                                  Provider.of<GlobalConfigProvider>(context,
                                          listen: false)
                                      .changeSelectedPage(index);
                                },
                                scrollDirection: Axis.horizontal,
                                physics: const PageScrollPhysics(),
                                controller: PageController(),
                                children: const [
                                  PrimaryCard(
                                    childone: ZonalCard(),
                                  ),
                                  PrimaryCard(
                                    childone: BillingGroup(),
                                  ),
                                  PrimaryCard(
                                    childone: DeviceList(),
                                  ),
                                ],
                              ),
                            )
                          : SizedBox(
                              height: MediaQuery.of(context).size.height * 0.4,
                              child: PageView(
                                onPageChanged: (index) {
                                  Provider.of<GlobalConfigProvider>(context,
                                          listen: false)
                                      .changeSelectedPage(index);
                                },
                                scrollDirection: Axis.horizontal,
                                physics: const PageScrollPhysics(),
                                controller: PageController(),
                                children: const [
                                  PrimaryCard(
                                    childone: BillingGroup(),
                                  ),
                                  PrimaryCard(
                                    childone: DeviceList(),
                                  ),
                                ],
                              ),
                            ),
                      SizedBox(
                        height: 20,
                        child: DotsIndicator(
                          decorator: DotsDecorator(
                            size: Size(5.0, 5.0),
                          ),
                          dotsCount: Provider.of<GlobalConfigProvider>(context)
                                  .isLevelFour
                              ? 3
                              : 2,
                              mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          position: double.parse(
                              Provider.of<GlobalConfigProvider>(context)
                                  .selectedPage
                                  .toString()),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.97,
                            height: MediaQuery.of(context).size.height * 0.42,
                            child: Provider.of<GlobalConfigProvider>(context)
                                            .selectedPage ==
                                        0 &&
                                    Provider.of<GlobalConfigProvider>(context,
                                            listen: false)
                                        .isLevelFour
                                ? LevelFourBottomCard()
                                : BottomCard()),
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
