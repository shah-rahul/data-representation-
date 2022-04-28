import 'package:flutter/material.dart';
import 'package:nudron/config/colorConfigFile.dart';
import 'package:nudron/models/billing_cell_data.dart';
import 'package:nudron/models/history_cell_model.dart';
import 'package:nudron/providers/globalConfigProvider.dart';
import 'package:nudron/providers/tableDataProvider.dart';
import 'package:nudron/widgets/level2/billing_history_table.dart';
import 'package:nudron/widgets/nudron_table.dart';
import 'package:nudron/widgets/utils/header_builder.dart';
import 'package:provider/provider.dart';

class DeviceList extends StatefulWidget {
  const DeviceList({Key? key}) : super(key: key);

  @override
  State<DeviceList> createState() => _DeviceGroupState();
}

var SearchField = TextEditingController();

ScrollController _scrollController = ScrollController();
const dataTitle = [
  "Device ID",
  "Label",
  "Alerts",
];
int selectedIndex = 0;

//function to convert integer to binary
String toBinary(int n) {
  String binary = '';
  while (n > 0) {
    binary = n % 2 == 0 ? '0' + binary : '1' + binary;
    n = n ~/ 2;
  }
  return binary;
}

class _DeviceGroupState extends State<DeviceList> {
  @override
  Widget build(BuildContext context) {
    List<BillingCellData> dataList =
        Provider.of<TableDataProvider>(context).devicelist;
    return Flexible(
      child: Column(
        children: [
          Container(
            height: 5,
            width: MediaQuery.of(context).size.width * 0.97,
            decoration: const BoxDecoration(
                color: billingColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5), topRight: Radius.circular(5))),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Center(
                          child: Text(
                            "Devices",
                            style: Theme.of(context)
                                .primaryTextTheme
                                .headline1!
                                .copyWith(
                                  color: billingColor,
                                ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04,
                        width: MediaQuery.of(context).size.width * 0.65,
                        child: TextFormField(
                            cursorHeight: 15,
                            style: TextStyle(color: Colors.black),
                            controller: SearchField,
                            decoration: InputDecoration(
                              hintText: "Search",
                              contentPadding: EdgeInsets.all(0),
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 15),
                              prefixIcon: Icon(Icons.search, size: 20),
                              labelStyle:
                                  Theme.of(context).primaryTextTheme.bodyText1,
                              border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.grey, width: 01),
                                  borderRadius: BorderRadius.circular(5)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.grey, width: 1),
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Name is required to continue';
                              } else {
                                return (null);
                              }
                            }),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.only(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(),
                          child: Text(
                            dataTitle[0],
                            style: Theme.of(context).primaryTextTheme.headline4,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 55),
                          child: Text(
                            dataTitle[1],
                            style: Theme.of(context).primaryTextTheme.headline4,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 150),
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
                        if (index == selectedIndex) {
                          return BillingHistoryTable(
                            data: dataList[index],
                            index: index,
                            isHilighted: true,
                            hilightColor: billingColor,
                          );
                        }
                        if (index == (dataList.length)) {
                          return Column(
                            children: [
                              Expanded(child: Container()),
                              Container(
                                padding: EdgeInsets.only(top: 3, bottom: 3),
                                height: 7,
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
                            ],
                          );
                        }
                        if (index == (dataList.length) &&
                            Provider.of<TableDataProvider>(context)
                                    .deviceListDataLoadedCompletely ==
                                false) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        return BillingHistoryTable(
                            data: dataList[index], index: index);
                      },
                    )),
              ],
            ),
            height: MediaQuery.of(context).size.height * 0.39,
            width: MediaQuery.of(context).size.width * 0.99,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5)),
              boxShadow: const [
                BoxShadow(blurRadius: 10.0, color: Color.fromRGBO(0, 0, 0, 0.1))
              ],
              color: Theme.of(context).cardColor,
            ),
          ),
        ],
      ),
    );
  }
}
