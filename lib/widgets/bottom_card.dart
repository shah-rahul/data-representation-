import 'package:flutter/material.dart';
import 'package:nudron/config/geoQueries.dart';
import 'package:nudron/providers/chartDataProvider.dart';
import 'package:nudron/providers/globalConfigProvider.dart';
import 'package:nudron/screens/chart_page.dart';
import 'package:nudron/widgets/map_display.dart';
import 'package:nudron/widgets/nudron_primary_chart.dart';
import 'package:provider/provider.dart';

import 'level1/device_history.dart';

class BottomCard extends StatefulWidget {
  const BottomCard({Key? key}) : super(key: key);

  @override
  State<BottomCard> createState() => _BottomCardState();
}

class _BottomCardState extends State<BottomCard> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<ChartDataProvider>(context).initCall();
  }

  GeoHasher geoHasher = GeoHasher();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: DefaultTabController(
        length: 3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 10,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                  color: Colors.yellow[700],
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5))),
            ),
            Container(
              height: 40,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: const BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TabBar(
                    unselectedLabelColor: Colors.white,
                    indicatorPadding: const EdgeInsets.only(left: 5, right: 5),
                    indicator: BoxDecoration(
                        color: Colors.grey[600],
                        borderRadius: BorderRadius.circular(8)),
                    tabs: [
                      Tab(
                        child: Align(
                          alignment: Alignment.center,
                          child: Provider.of<GlobalConfigProvider>(context)
                                          .isLevelFour &&
                                      Provider.of<GlobalConfigProvider>(context)
                                              .selectedPage ==
                                          1 ||
                                  !Provider.of<GlobalConfigProvider>(context)
                                          .isLevelFour &&
                                      Provider.of<GlobalConfigProvider>(context)
                                              .selectedPage ==
                                          0
                              ? Text("Device history")
                              : Text("Billing history"),
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
              height: MediaQuery.of(context).size.height * 0.4,
              child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    const FittedBox(
                        fit: BoxFit.scaleDown, child: DeviceHistory()),
                    Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: Stack(
                        children: [
                          const CustombarChart(),
                          Positioned(
                            right: 10,
                            bottom: 10,
                            child: FloatingActionButton(
                              backgroundColor: Colors.black,
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const ChartPage()));
                              },
                              child: const Icon(Icons.add, color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 10.0,
                                  color: Color.fromRGBO(0, 0, 0, 0.1))
                            ],
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(5),
                                bottomRight: Radius.circular(5))),
                        child: MapContainer()),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
