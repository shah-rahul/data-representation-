import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nudron/config/colorConfigFile.dart';
import 'package:nudron/models/billing_cell_data.dart';
import 'package:nudron/models/history_cell_model.dart';
import 'package:nudron/providers/globalConfigProvider.dart';
import 'package:nudron/providers/tableDataProvider.dart';
import 'package:nudron/widgets/level2/billing_history_table.dart';
import 'package:nudron/widgets/nudron_table.dart';
import 'package:nudron/widgets/utils/header_builder.dart';
import 'package:provider/provider.dart';

class BillingGroup extends StatefulWidget {
  const BillingGroup({Key? key}) : super(key: key);

  @override
  State<BillingGroup> createState() => _DeviceGroupState();
}

var SearchField = TextEditingController();

ScrollController _scrollController = ScrollController();
const dataTitle = ["Label", "Devices", "Alerts", "Dues"];

class _DeviceGroupState extends State<BillingGroup> {
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

  setGlobalBillingGroup(str) {
    Provider.of<GlobalConfigProvider>(context, listen: false)
        .setSelectedBillingGroup(str);
  }

  _getMoreData() {
    print("billing  group data refersher called");
    Provider.of<TableDataProvider>(context, listen: false)
        .billingDataRefresher();
  }

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<HistoryCellData> dataList =
        Provider.of<TableDataProvider>(context).billingGroupList;
    return Flexible(
      child: Column(
        children: [
          Container(
            height: 5,
            width: MediaQuery.of(context).size.width * 0.97,
            decoration: const BoxDecoration(
                color: deviceColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5), topRight: Radius.circular(5))),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Center(
                        child: Text(
                          "Billing",
                          style: Theme.of(context)
                              .primaryTextTheme
                              .headline1!
                              .copyWith(
                                color: deviceColor,
                              ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                      width: MediaQuery.of(context).size.width * 0.7,
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
                          padding: const EdgeInsets.only(left: 70),
                          child: Text(
                            dataTitle[1],
                            style: Theme.of(context).primaryTextTheme.headline4,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: Text(
                            dataTitle[2],
                            style: Theme.of(context).primaryTextTheme.headline4,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: Text(
                            dataTitle[3],
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
                        if (selectedIndex == index) {
                          return NudronTable(
                            isHilighted: true,
                            hilightColor: deviceColor,
                            data: dataList[index],
                            index: index,
                            isBillingData: true,
                          );
                        }

                        if (index == (dataList.length)) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        return GestureDetector(
                          onLongPress: () => Fluttertoast.showToast(
                            msg: "Label : ${dataList[index].date} \n"
                                "Devices : ${dataList[index].alerts} \n"
                                "Alerts : ${dataList[index].status} \n "
                                "Dues: ${dataList[index].comments}"
                                ,

                            
                            toastLength: Toast.LENGTH_SHORT, // length
                            gravity: ToastGravity.CENTER,
                          ),
                          onTap: () => {
                            setState(() {
                              selectedIndex = index;
                            }),
                            setGlobalBillingGroup(dataList[index].date),
                          },
                          child: NudronTable(
                            data: dataList[index],
                            index: index,
                            isBillingData: true,
                          ),
                        );
                      },
                    )),
              ],
            ),
            height: MediaQuery.of(context).size.height * 0.39,
            width: MediaQuery.of(context).size.width * 97,
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
