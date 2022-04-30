import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nudron/models/history_cell_model.dart';
import 'package:nudron/providers/globalConfigProvider.dart';
import 'package:nudron/providers/tableDataProvider.dart';
import 'package:nudron/widgets/level1/alertBarBuilder.dart';
import 'package:nudron/widgets/nudron_table.dart';
import 'package:nudron/widgets/utils/header_builder.dart';
import 'package:provider/provider.dart';

import '../../config/colorConfigFile.dart';

class DeviceHistory extends StatefulWidget {
  const DeviceHistory({Key? key}) : super(key: key);

  @override
  State<DeviceHistory> createState() => _DeviceHistoryState();
}

ScrollController _scrollController = ScrollController();
int _currentMax = 10;

const dataTitle = [
  "Date",
  "Alerts",
  "Status",
  "Comments",
];
double offset = 0.0;

class _DeviceHistoryState extends State<DeviceHistory> {
  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getMoreData();
      }
    });
  }

  _getMoreData() {
    print("CALLED");
    Provider.of<TableDataProvider>(context, listen: false)
        .deviceHistoryDataRefresher();
  }

  @override
  Widget build(BuildContext context) {
    List<HistoryCellData> dataList =
        Provider.of<TableDataProvider>(context).historyDataList;
    return Container(
      padding: const EdgeInsets.all(0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(),
              Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  children: [
                    Text(
                      Provider.of<GlobalConfigProvider>(context).date,
                      style: Theme.of(context).primaryTextTheme.headline5,
                    ),
                    Text(" | ", style: Theme.of(context).primaryTextTheme.headline5),
                      Text(
                      Provider.of<GlobalConfigProvider>(context).selectedDeviceType,
                      style: Theme.of(context).primaryTextTheme.headline5,
                    )
                  ],
                ),
              ),
            ],
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Center(
          //     child: Text(
          //       Provider.of<GlobalConfigProvider>(context)
          //                   .selectedDeviceGroup ==
          //               "Device Group"
          //           ? "Device History"
          //           : Provider.of<GlobalConfigProvider>(context)
          //               .selectedDeviceGroup,
          //       style: Theme.of(context).primaryTextTheme.headline3!.copyWith(
          //             color: billingColor,
          //           ),
          //     ),
          //   ),
          // ),
          Container(
            decoration: const BoxDecoration(color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      dataTitle[0],
                      style: Theme.of(context).primaryTextTheme.headline4,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 35),
                    child: Text(
                      dataTitle[1],
                      style: Theme.of(context).primaryTextTheme.headline4,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Text(
                      dataTitle[2],
                      style: Theme.of(context).primaryTextTheme.headline4,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Text(
                      dataTitle[3],
                      style: Theme.of(context).primaryTextTheme.headline4,
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: ListView.builder(
                primary: false,
                itemCount: dataList.length + 1,
                controller: _scrollController,
                itemExtent: 35,
                itemBuilder: (context, index) {
                  if (index == (dataList.length) &&
                      !Provider.of<TableDataProvider>(context)
                          .deviceHistoryDataLoadedCompletely) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (index == (dataList.length)) {
                    return Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 3, bottom: 3),
                          height: 2,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Provider.of<GlobalConfigProvider>(context)
                                            .isLevelFour &&
                                        Provider.of<GlobalConfigProvider>(
                                                    context)
                                                .selectedPage ==
                                            1 ||
                                    !Provider.of<GlobalConfigProvider>(context)
                                            .isLevelFour &&
                                        Provider.of<GlobalConfigProvider>(
                                                    context)
                                                .selectedPage ==
                                            0
                                ? deviceColor
                                : billingColor,
                          ),
                        ),
                        Expanded(child: Container()),
                      ],
                    );
                  }
                  if (dataList.length > index) {
                    return GestureDetector(
                      onLongPress: () => Fluttertoast.showToast(
                        msg:
                            "date: ${dataList[index].date} \nstatus: ${dataList[index].status} \ncomments: ${dataList[index].comments}",

                        toastLength: Toast.LENGTH_SHORT, // length
                        gravity: ToastGravity.CENTER, // location
                      ),
                      child: NudronTable(
                        data: dataList[index],
                        index: index,
                        isBillingData: false,
                      ),
                    );
                  }
                  return Container();
                },
              )),
        ],
      ),
      height: MediaQuery.of(context).size.height * 0.38,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(blurRadius: 10.0, color: Color.fromRGBO(0, 0, 0, 0.1))
        ],
        color: Theme.of(context).cardColor,
      ),
    );
  }
}
