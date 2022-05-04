import 'package:flutter/material.dart';
import 'package:nudron/config/colorConfigFile.dart';
import 'package:nudron/models/billing_cell_data.dart';
import 'package:nudron/models/history_cell_model.dart';
import 'package:nudron/models/zonalDataProvider.dart';
import 'package:nudron/providers/tableDataProvider.dart';
import 'package:nudron/widgets/level2/billing_history_table.dart';
import 'package:nudron/widgets/nudron_table.dart';
import 'package:nudron/widgets/utils/header_builder.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../models/billingGroupDataProvider.dart';

class ZonalCard extends StatefulWidget {
  const ZonalCard({Key? key}) : super(key: key);

  @override
  State<ZonalCard> createState() => _DeviceGroupState();
}

var SearchField = TextEditingController();

ScrollController _scrollController = ScrollController();
DataGridController _dataGridController = DataGridController();

class _DeviceGroupState extends State<ZonalCard>
    with AutomaticKeepAliveClientMixin<ZonalCard> {
  changeSelectionStatus() {
    _dataGridController.selectedIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      if (mounted && _dataGridController.selectedIndex != 0) {
        changeSelectionStatus();
      }
    });
    List<HistoryCellData> dataList =
        Provider.of<TableDataProvider>(context).zonalDataList;
    return Flexible(
      child: Column(
        children: [
          Container(
            height: 5,
            width: MediaQuery.of(context).size.width * 0.97,
            decoration: const BoxDecoration(
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5), topRight: Radius.circular(5))),
          ),
          Container(
            padding: const EdgeInsets.all(5),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Center(
                        child: Text("Zone",
                            style: Theme.of(context)
                                .primaryTextTheme
                                .headline1!
                                .copyWith(
                                  color: zonalColor,
                                )),
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
                SfDataGridTheme(
                  data: SfDataGridThemeData(
                    selectionColor: zonalColor.withOpacity(0.5),
                  ),
                  child: Expanded(
                    child: SfDataGrid(
                      horizontalScrollPhysics: NeverScrollableScrollPhysics(),
                      columnWidthMode: ColumnWidthMode.fitByColumnName,
                      isScrollbarAlwaysShown: false,
                      rowHeight: 32,
                      headerRowHeight:
                          MediaQuery.of(context).size.height * 0.04,
                      controller: _dataGridController,
                      selectionMode: SelectionMode.single,
                      source: ZonalDataProvider(
                        billingGroupData: dataList,
                      ),
                      gridLinesVisibility: GridLinesVisibility.both,
                      columns: <GridColumn>[
                        GridColumn(
                            width: MediaQuery.of(context).size.width * 0.3,
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
                            width: MediaQuery.of(context).size.width * 0.2,
                            columnName: 'devices',
                            label: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  'Devices',
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .headline4,
                                ))),
                        GridColumn(
                            width: MediaQuery.of(context).size.width * 0.17,
                            columnName: 'alerts',
                            label: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  'Alerts',
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .headline4,
                                ))),
                        GridColumn(
                            width: MediaQuery.of(context).size.width * 0.3,
                            columnName: 'dues',
                            label: Container(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  'Dues',
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .headline4,
                                ))),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            height: MediaQuery.of(context).size.height * 0.39,
            width: MediaQuery.of(context).size.width,
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
          Container(
            padding: EdgeInsets.only(top: 5, bottom: 3),
            height: 2,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: zonalColor,
            ),
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
