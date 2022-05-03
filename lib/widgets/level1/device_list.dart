import 'package:flutter/material.dart';
import 'package:nudron/config/colorConfigFile.dart';
import 'package:nudron/models/billing_cell_data.dart';
import 'package:nudron/models/deviceListDataProvider.dart';
import 'package:nudron/models/history_cell_model.dart';
import 'package:nudron/providers/globalConfigProvider.dart';
import 'package:nudron/providers/tableDataProvider.dart';
import 'package:nudron/widgets/level2/billing_history_table.dart';
import 'package:nudron/widgets/nudron_table.dart';
import 'package:nudron/widgets/utils/header_builder.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class DeviceList extends StatefulWidget {
  const DeviceList({Key? key}) : super(key: key);

  @override
  State<DeviceList> createState() => _DeviceGroupState();
}

var SearchField = TextEditingController();

ScrollController _scrollController = ScrollController();
DataGridController _dataGridController = DataGridController();
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

openDialog(context, BillingCellData data) {
  showDialog(
      context: context,
      builder: (context) => Dialog(
            child: Container(
              height: 200,
              color: billingColor.withOpacity(0.3),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 40, bottom: 20, left: 20, right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Device Id : ${data.date} ",
                      style: Theme.of(context).primaryTextTheme.headline4,
                    ),
                    Text(
                      "Label : ${data.message} ",
                      style: Theme.of(context).primaryTextTheme.headline4,
                    ),
                    Text(
                      "Alerts : ${data.amount} ",
                      style: Theme.of(context).primaryTextTheme.headline4,
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        decoration: BoxDecoration(
                          color: billingColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.05,
                        child: Center(
                            child: Text(
                          'close',
                          style: Theme.of(context).primaryTextTheme.headline4,
                        )),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ));
}

class _DeviceGroupState extends State<DeviceList> with AutomaticKeepAliveClientMixin<DeviceList> {
  setGlobalDeviceGroup(str) {
    Provider.of<GlobalConfigProvider>(context, listen: false)
        .setDeviceGroup(str);
  }

  @override
  didChangeDependencies() {
    super.didChangeDependencies();
    if (mounted && _dataGridController.selectedIndex != 0) {
      _dataGridController.selectedIndex = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
                SfDataGridTheme(
                  data: SfDataGridThemeData(
                    selectionColor: billingColor.withOpacity(0.5),
                  ),
                  child: Expanded(
                    child: SfDataGrid(
                      horizontalScrollPhysics: NeverScrollableScrollPhysics(),
                      columnWidthMode: ColumnWidthMode.fitByColumnName,
                      isScrollbarAlwaysShown: false,
                      rowHeight: 32,
                      controller: _dataGridController,
                      selectionMode: SelectionMode.single,
                      source: DeviceListDataProvider(
                        billingGroupData: dataList,
                      ),
                      columns: <GridColumn>[
                        GridColumn(
                            width: MediaQuery.of(context).size.width * 0.4,
                            columnName: 'label',
                            label: Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Label',
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .headline4,
                                ))),
                        GridColumn(
                            width: MediaQuery.of(context).size.width * 0.3,
                            columnName: 'devices',
                            label: Container(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  'Devices',
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .headline4,
                                ))),
                        GridColumn(
                            width: MediaQuery.of(context).size.width * 0.2,
                            columnName: 'alerts',
                            label: Container(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  'Alerts',
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .headline4,
                                ))),
                      ],
                    ),
                  ),
                ),
                 Provider.of<TableDataProvider>(context)
                  .deviceListDataLoadedCompletely && mounted
              ? Container(
                  padding: EdgeInsets.only(top: 5, bottom: 3),
                  height: 2,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: billingColor,
                  ),
                )
              : Container(),
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

  @override
  bool get wantKeepAlive => true;
}
