import 'package:flutter/material.dart';
import 'package:nudron/models/billing_cell_data.dart';
import 'package:nudron/models/history_cell_model.dart';
import 'package:nudron/providers/tableDataProvider.dart';
import 'package:nudron/widgets/level2/billing_history_table.dart';
import 'package:nudron/widgets/nudron_table.dart';
import 'package:nudron/widgets/utils/header_builder.dart';
import 'package:provider/provider.dart';

class BillingHistory extends StatefulWidget {
  const BillingHistory({Key? key}) : super(key: key);

  @override
  State<BillingHistory> createState() => _DeviceGroupState();
}

ScrollController _scrollController = ScrollController();
const dataTitle = [
  "Date",
  "Description",
  "Amount",
];

class _DeviceGroupState extends State<BillingHistory> {
  @override
  Widget build(BuildContext context) {
    List<BillingCellData> dataList =
        Provider.of<TableDataProvider>(context).billingDatalist;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Center(
              child: Text(
                "Billing history",
                style: Theme.of(context).primaryTextTheme.headline3,
              ),
            ),
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
                    padding: const EdgeInsets.only(left: 100),
                    child: Text(
                      dataTitle[1],
                      style: Theme.of(context).primaryTextTheme.headline4,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 100),
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
                    return const Center(child: CircularProgressIndicator());
                  }
                  return BillingHistoryTable(
                      data: dataList[index], index: index);
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
