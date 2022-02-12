import 'package:flutter/material.dart';
import 'package:nudron/widgets/nudron_table.dart';

class DeviceHistory extends StatefulWidget {
  DeviceHistory({Key? key}) : super(key: key);

  @override
  State<DeviceHistory> createState() => _DeviceHistoryState();
}

final _rowsCells = [
  [7, 8, 8, 7],
  [10, 9, 6, 6],
  [5, 4, 7, 5],
  [9, 4, 7, 8],
  [7, 8, 8, 7],
  [10, 10, 6, 6],
  [5, 4, 5, 5],
  [9, 4, 7, 8],
  [7, 8, 8, 7],
  [10, 9, 6, 6],
  [5, 4, 7, 5],
  [9, 4, 7, 8],
  [7, 8, 8, 7],
  [10, 10, 6, 6],
  [5, 4, 5, 5],
  [9, 4, 1, 8]
];
const dataTitle = [
  "Date",
  "Alerts",
  "Status",
  "Comments",
];

class _DeviceHistoryState extends State<DeviceHistory> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 10,
            decoration: BoxDecoration(
                color: Colors.yellow[700],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5), topRight: Radius.circular(5))),
          ),
          Expanded(
            flex: 1,
            child: CustomDataTable(
              fixedRowCells: dataTitle,
              rowsCells: _rowsCells,
              cellBuilder: (data) {
                return Text('$data', style: TextStyle(color: Colors.black));
              },
            ),
          ),
        ],
      ),
      height: MediaQuery.of(context).size.height * 0.4 -
          (MediaQuery.of(context).size.height * 0.05),
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
