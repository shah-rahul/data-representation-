import 'package:flutter/material.dart';
import 'package:nudron/models/billing_cell_data.dart';
import 'package:nudron/models/history_cell_model.dart';
import 'package:nudron/providers/tableDataProvider.dart';
import 'package:nudron/widgets/level2/billing_history_table.dart';
import 'package:nudron/widgets/nudron_table.dart';
import 'package:nudron/widgets/utils/header_builder.dart';
import 'package:provider/provider.dart';

class ZonalCard extends StatefulWidget {
  const ZonalCard({Key? key}) : super(key: key);

  @override
  State<ZonalCard> createState() => _DeviceGroupState();
}

ScrollController _scrollController = ScrollController();
const dataTitle = ["Label", "Devices", "Alerts", "Dues"];

class _DeviceGroupState extends State<ZonalCard> {
  @override
  Widget build(BuildContext context) {
    List<HistoryCellData> dataList =
        Provider.of<TableDataProvider>(context).billingGroupList;
    return Flexible(
      child: Column(
        children: [
          Container(
            height: 10,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: const BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5), topRight: Radius.circular(5))),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      "Zonal Card",
                      style: Theme.of(context).primaryTextTheme.headline3,
                    ),
                  ),
                ),
                const TableHeader(dataList: dataTitle),
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
            height: MediaQuery.of(context).size.height * 0.38,
            width: MediaQuery.of(context).size.width * 0.9,
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
