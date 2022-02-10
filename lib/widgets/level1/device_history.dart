import 'package:flutter/material.dart';

class DeviceHistory extends StatefulWidget {
  DeviceHistory({Key? key}) : super(key: key);

  @override
  State<DeviceHistory> createState() => _DeviceHistoryState();
}

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
      child: ListView(
        children: [
          _createDataTable(context),
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
          color: Theme.of(context).highlightColor,
          borderRadius: BorderRadius.circular(8.0)),
    );
  }
}

DataTable _createDataTable(context) {
  return DataTable(
      dataRowHeight: 50,
      horizontalMargin: 10,
      headingTextStyle: Theme.of(context).primaryTextTheme.headline2,
      dataTextStyle: Theme.of(context).primaryTextTheme.headline2,
      border: TableBorder(borderRadius: BorderRadius.circular(8.0)),
      dataRowColor: MaterialStateProperty.all(Colors.grey[500]),
      columnSpacing: 5,
      showBottomBorder: true,
      headingRowColor: MaterialStateProperty.all(Colors.grey[600]),
      columns: _createColumns(),
      rows: _createRows());
}

List<DataColumn> _createColumns() {
  List<DataColumn> colList = [];

  dataTitle.forEach((element) {
    colList.add(DataColumn(label: Text(element)));
    print(element);
  });

  return colList;
}

List<DataRow> _createRows() {
  return [
    DataRow(cells: [
      DataCell(Text("hardCoded")),
      DataCell(Text("hardCoded")),
      DataCell(Text("hardCoded")),
      DataCell(Text("hardCoded")),
    ]),
    DataRow(cells: [
      DataCell(Text("hardCoded")),
      DataCell(Text("hardCoded")),
      DataCell(Text("hardCoded")),
      DataCell(Text("hardCoded")),
    ]),
    DataRow(cells: [
      DataCell(Text("hardCoded")),
      DataCell(Text("hardCoded")),
      DataCell(Text("hardCoded")),
      DataCell(Text("hardCoded")),
    ]),
    DataRow(cells: [
      DataCell(Text("hardCoded")),
      DataCell(Text("hardCoded")),
      DataCell(Text("hardCoded")),
      DataCell(Text("hardCoded")),
    ]),
    DataRow(cells: [
      DataCell(Text("hardCoded")),
      DataCell(Text("hardCoded")),
      DataCell(Text("hardCoded")),
      DataCell(Text("hardCoded")),
    ]),
    DataRow(cells: [
      DataCell(Text("hardCoded")),
      DataCell(Text("hardCoded")),
      DataCell(Text("hardCoded")),
      DataCell(Text("hardCoded")),
    ]),
  ];
}
