import 'package:flutter/material.dart';
import 'package:nudron/models/billing_cell_data.dart';
import 'package:nudron/models/history_cell_model.dart';
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
                color: Colors.teal,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5), topRight: Radius.circular(5))),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          "Billing",
                          style: Theme.of(context).primaryTextTheme.headline3,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                      width: MediaQuery.of(context).size.width * 0.6,
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
              padding: const EdgeInsets.only(top:8.0, bottom: 8.0),
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
                    padding: const EdgeInsets.only(left: 70),
                    child: Text(
                      dataTitle[1],
                      style: Theme.of(context).primaryTextTheme.headline4,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 60),
                    child: Text(
                      dataTitle[2],
                      style: Theme.of(context).primaryTextTheme.headline4,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 55),
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
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        return NudronTable(
                          data: dataList[index],
                          index: index,
                          isBillingData: true,
                        );
                      },
                    )),
              ],
            ),
            height: MediaQuery.of(context).size.height * 0.39,
            width: MediaQuery.of(context).size.width *97,
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
