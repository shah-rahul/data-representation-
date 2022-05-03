import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nudron/config/colorConfigFile.dart';
import 'package:nudron/models/billingGroupDataProvider.dart';
import 'package:nudron/models/billing_cell_data.dart';
import 'package:nudron/models/history_cell_model.dart';
import 'package:nudron/providers/globalConfigProvider.dart';
import 'package:nudron/providers/tableDataProvider.dart';
import 'package:nudron/widgets/level2/billing_history_table.dart';
import 'package:nudron/widgets/nudron_table.dart';
import 'package:nudron/widgets/utils/header_builder.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class BillingGroup extends StatefulWidget {
  const BillingGroup({Key? key}) : super(key: key);

  @override
  State<BillingGroup> createState() => _DeviceGroupState();
}

final DataGridController _dataGridController = DataGridController();

var SearchField = TextEditingController();

ScrollController _scrollController = ScrollController();
const dataTitle = ["Label", "Devices", "Alerts", "Dues"];

class _DeviceGroupState extends State<BillingGroup>
    with AutomaticKeepAliveClientMixin<BillingGroup> {
  List<HistoryCellData> dataList = [];
  setGlobalBillingGroup(str) {
    Provider.of<GlobalConfigProvider>(context, listen: false)
        .setSelectedBillingGroup(str);
  }

  _getMoreData() {
    print("billing  group data refersher called");
    Provider.of<TableDataProvider>(context, listen: false)
        .billingDataRefresher();
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
                SfDataGridTheme(
                  data: SfDataGridThemeData(
                    selectionColor: deviceColor.withOpacity(0.5),
                  ),
                  child: Expanded(
                    child: SfDataGrid(
                      horizontalScrollPhysics: NeverScrollableScrollPhysics(),
                      columnWidthMode: ColumnWidthMode.fitByColumnName,
                      isScrollbarAlwaysShown: false,
                      rowHeight: 32,
                      controller: _dataGridController,
                      selectionMode: SelectionMode.single,
                      source: BillingGroupDataProvider(
                        billingGroupData: dataList,
                      ),
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
                                                color: Color.fromRGBO(
                                                    0, 0, 0, 0.26)))),
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
                                alignment: Alignment.centerRight,
                                child: Text(
                                  'Devices',
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .headline4,
                                ))),
                        GridColumn(
                            width: MediaQuery.of(context).size.width * 0.15,
                            columnName: 'alerts',
                            label: Container(
                                alignment: Alignment.centerRight,
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
                Provider.of<TableDataProvider>(context)
                            .billingGroupDataLoadedCompletely &&
                        mounted
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

  @override
  bool get wantKeepAlive => true;
}
