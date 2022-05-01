import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nudron/config/colorConfigFile.dart';
import 'package:nudron/models/billing_cell_data.dart';
import 'package:nudron/models/history_cell_model.dart';
import 'package:nudron/providers/globalConfigProvider.dart';
import 'package:nudron/providers/tableDataProvider.dart';
import 'package:nudron/providers/userDataProvider.dart';
import 'package:nudron/widgets/level2/billing_history_table.dart';
import 'package:nudron/widgets/level2/bottomBarBuilder.dart';
import 'package:nudron/widgets/nudron_table.dart';
import 'package:nudron/widgets/utils/header_builder.dart';
import 'package:provider/provider.dart';

class BillingHistory extends StatefulWidget {
  const BillingHistory({Key? key}) : super(key: key);

  @override
  State<BillingHistory> createState() => _DeviceGroupState();
}

String toBeShown = "";
ScrollController _scrollController = ScrollController();
const dataTitle = [
  "Date",
  "Description",
  "Amount",
];
bool show = false;

class _DeviceGroupState extends State<BillingHistory> {
  @override
  void initState() {
    // TODO: implement initState
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getMoreData();
      }
    });
    super.initState();
  }

  _getMoreData() {
    print("billing  group data refersher called");
    Provider.of<TableDataProvider>(context, listen: false)
        .billingHistoryDataRefresher();
  }

  void whatIsTapped(int index) {
    print('what is tapped called');
    if (index == 1) {
      setState(() {
        toBeShown =
            Provider.of<UserDataProvider>(context, listen: false).user.address;
        show = !show;
      });
    }
    if (index == 2) {
      setState(() {
        toBeShown =
            Provider.of<UserDataProvider>(context, listen: false).user.phone;
        show = !show;
      });
    }
    if (index == 3) {
      setState(() {
        toBeShown =
            Provider.of<UserDataProvider>(context, listen: false).user.email;
        show = !show;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<BillingCellData> dataList =
        Provider.of<TableDataProvider>(context).billingDatalist;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   children: [
          //     Padding(
          //       padding: const EdgeInsets.all(2.0),
          //       child: Center(
          //         child: Text(
          //           Provider.of<GlobalConfigProvider>(context)
          //                       .selectedBillingGroup ==
          //                   "Billing History"
          //               ? "Billing History"
          //               : Provider.of<GlobalConfigProvider>(context)
          //                   .selectedBillingGroup,
          //           style:
          //               Theme.of(context).primaryTextTheme.headline3!.copyWith(
          //                     color: deviceColor,
          //                   ),
          //         ),
          //       ),
          //     ),
          //     Padding(
          //       padding: const EdgeInsets.all(2.0),
          //       child: BottombarBuilder(fun: whatIsTapped),
          //     ),
          //   ],
          // ),
          // show
          //     ? Padding(
          //         padding: const EdgeInsets.all(5.0),
          //         child: Text(
          //           toBeShown,
          //           style: Theme.of(context).primaryTextTheme.headline5,
          //         ),
          //       )
          //     : Container(),
          Container(
            decoration: const BoxDecoration(color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      dataTitle[0],
                      style: Theme.of(context).primaryTextTheme.headline4,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 60),
                    child: Text(
                      dataTitle[1],
                      style: Theme.of(context).primaryTextTheme.headline4,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 130),
                    child: Text(
                      dataTitle[2],
                      style: Theme.of(context).primaryTextTheme.headline4,
                    ),
                  ),
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
                if (index == (dataList.length)) {
                          return Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(top: 3, bottom: 3),
                                height: 2,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Provider.of<GlobalConfigProvider>(
                                                      context)
                                                  .isLevelFour &&
                                              Provider.of<GlobalConfigProvider>(
                                                          context)
                                                      .selectedPage ==
                                                  1 ||
                                          !Provider.of<GlobalConfigProvider>(
                                                      context)
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
                  return GestureDetector(
                    onLongPress: () => Fluttertoast.showToast(
                      msg: "Date : ${dataList[index].date} \n"
                          "Description : ${dataList[index].status} \n"
                          "Amount : ${dataList[index].amount} \n ",

                      toastLength: Toast.LENGTH_SHORT, // length
                      gravity: ToastGravity.CENTER,
                    ),
                    child: BillingHistoryTable(
                        boolIsbillingData: true,
                        data: dataList[index],
                        index: index),
                  );
                },
              )),
        ],
      ),
      height: MediaQuery.of(context).size.height * 0.38,
      width: MediaQuery.of(context).size.width * 1,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5)),
        boxShadow: const [
          BoxShadow(blurRadius: 10.0, color: Color.fromRGBO(0, 0, 0, 0.1))
        ],
        color: Theme.of(context).cardColor,
      ),
    );
  }
}
