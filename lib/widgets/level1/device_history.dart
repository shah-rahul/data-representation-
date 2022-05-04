import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nudron/models/deviceHistoryDataProvider.dart';
import 'package:nudron/models/history_cell_model.dart';
import 'package:nudron/providers/globalConfigProvider.dart';
import 'package:nudron/providers/tableDataProvider.dart';
import 'package:nudron/widgets/level1/alertBarBuilder.dart';
import 'package:nudron/widgets/nudron_table.dart';
import 'package:nudron/widgets/utils/header_builder.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../config/colorConfigFile.dart';

class DeviceHistory extends StatefulWidget {
  const DeviceHistory({Key? key}) : super(key: key);

  @override
  State<DeviceHistory> createState() => _DeviceHistoryState();
}

ScrollController _scrollController = ScrollController();
DataGridController _dataGridController = DataGridController();
int _currentMax = 10;

const dataTitle = [
  "Date",
  "Alerts",
  "Status",
  "Comments",
];
double offset = 0.0;

class _DeviceHistoryState extends State<DeviceHistory>
    with AutomaticKeepAliveClientMixin<DeviceHistory> {
  _getMoreData() {
    print("CALLED");
    Provider.of<TableDataProvider>(context, listen: false)
        .deviceHistoryDataRefresher();
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
    List<HistoryCellData> dataList =
        Provider.of<TableDataProvider>(context).historyDataList;
    return Container(
      child: Column(
        children: [
          SfDataGridTheme(
            data: SfDataGridThemeData(
              selectionColor: billingColor.withOpacity(0.5),
            ),
            child: Expanded(
              child: SfDataGrid(
                horizontalScrollPhysics: NeverScrollableScrollPhysics(),
                columnWidthMode: ColumnWidthMode.fitByColumnName,
                isScrollbarAlwaysShown: false,
                headerRowHeight: MediaQuery.of(context).size.height * 0.04,
                rowHeight: 40,
                controller: _dataGridController,
                selectionMode: SelectionMode.single,
                source: DeviceHistorydataProvider(
                  billingGroupData: dataList,
                ),
                gridLinesVisibility: GridLinesVisibility.both,
                loadMoreViewBuilder:
                    (BuildContext context, LoadMoreRows loadMoreRows) {
                  Future<String> loadRows() async {
                    // Call the loadMoreRows function to call the
                    // DataGridSource.handleLoadMoreRows method. So, additional
                    // rows can be added from handleLoadMoreRows method.
                    await _getMoreData();
                    return Future<String>.value('Completed');
                  }

                  return FutureBuilder<String>(
                      initialData: 'loading',
                      future: loadRows(),
                      builder: (context, snapShot) {
                        if (snapShot.data == 'loading') {
                          return Container(
                              height: 60.0,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: BorderDirectional(
                                      top: BorderSide(
                                          width: 1.0,
                                          color:
                                              Color.fromRGBO(0, 0, 0, 0.26)))),
                              alignment: Alignment.center,
                              child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation(
                                      Colors.deepPurple)));
                        } else {
                          return SizedBox.fromSize(size: Size.zero);
                        }
                      });
                },
                columns: <GridColumn>[
                  GridColumn(
                      width: MediaQuery.of(context).size.width * 0.15,
                      columnName: 'date',
                      label: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Date',
                            style: Theme.of(context).primaryTextTheme.headline4,
                          ))),
                  GridColumn(
                      width: MediaQuery.of(context).size.width * 0.15,
                      columnName: 'alerts',
                      label: Container(
                          alignment: Alignment.center,
                          child: Text(
                            'Alerts',
                            style: Theme.of(context).primaryTextTheme.headline4,
                          ))),
                  GridColumn(
                      width: MediaQuery.of(context).size.width * 0.15,
                      columnName: 'status',
                      label: Container(
                          alignment: Alignment.center,
                          child: Text(
                            'Status',
                            style: Theme.of(context).primaryTextTheme.headline4,
                          ))),
                  GridColumn(
                      width: MediaQuery.of(context).size.width * 0.55,
                      columnName: 'Comments',
                      label: Container(
                          margin: EdgeInsets.only(left: 10),
                          alignment: Alignment.centerRight,
                          child: Text(
                            'Comments',
                            style: Theme.of(context).primaryTextTheme.headline4,
                          ))),
                ],
              ),
            ),
          ),
          Provider.of<TableDataProvider>(context)
                  .deviceHistoryDataLoadedCompletely
              ? Container(
                  padding: EdgeInsets.only(top: 5, bottom: 3),
                  height: 2,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Provider.of<GlobalConfigProvider>(context)
                                    .isLevelFour &&
                                Provider.of<GlobalConfigProvider>(context)
                                        .selectedPage ==
                                    1 ||
                            !Provider.of<GlobalConfigProvider>(context)
                                    .isLevelFour &&
                                Provider.of<GlobalConfigProvider>(context)
                                        .selectedPage ==
                                    0
                        ? deviceColor
                        : billingColor,
                  ),
                )
              : Container(),
        ],
      ),
      height: MediaQuery.of(context).size.height * 0.38,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(blurRadius: 10.0, color: Color.fromRGBO(0, 0, 0, 0.1))
        ],
        color: Theme.of(context).cardColor,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
