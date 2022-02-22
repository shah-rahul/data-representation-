import 'package:flutter/material.dart';
import 'package:nudron/models/sample_data.dart';
import 'package:nudron/widgets/nudron_table.dart';
import 'package:nudron/widgets/utils/header_builder.dart';

class DeviceHistory extends StatefulWidget {
  DeviceHistory({Key? key}) : super(key: key);

  @override
  State<DeviceHistory> createState() => _DeviceHistoryState();
}

List<CellData> dataList = [];
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
    dataList = List.generate(10,
        (i) => CellData(data1: i, data2: i + 1, data3: i + 2, data4: i + 3));

    super.initState();
  }

  _getMoreData() {
    print("called");
    for (int i = _currentMax; i < _currentMax + 10; i++) {
      dataList
          .add(CellData(data1: i, data2: i + 1, data3: i + 2, data4: i + 3));
    }

    _currentMax = _currentMax + 10;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                "Device history",
                style: Theme.of(context).primaryTextTheme.headline3,
              ),
            ),
          ),
          Container(
            height: 10,
            decoration: BoxDecoration(
                color: Colors.yellow[700],
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(5), topRight: Radius.circular(5))),
          ),
          const TableHeader(dataList: dataTitle),
          Expanded(
              flex: 1,
              child: ListView.builder(
                primary: false,
                itemCount: dataList.length + 1,
                controller: _scrollController,
                itemExtent: 30,
                itemBuilder: (context, index) {
                  if (index == dataList.length) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return NudronTable(data: dataList[index], index: index);
                },
              )),
        ],
      ),
      height: MediaQuery.of(context).size.height * 0.4,
      width: MediaQuery.of(context).size.width * 0.9,
      margin: const EdgeInsets.only(left: 7, right: 7, top: 10),
      padding: const EdgeInsets.fromLTRB(15, 12, 12, 15),
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(blurRadius: 10.0, color: Color.fromRGBO(0, 0, 0, 0.1))
          ],
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(8.0)),
    );
  }
}
