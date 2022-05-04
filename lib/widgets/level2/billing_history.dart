import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nudron/config/colorConfigFile.dart';
import 'package:nudron/models/billingHistoryDataProvider.dart';
import 'package:nudron/models/billing_cell_data.dart';
import 'package:nudron/models/deviceHistoryDataProvider.dart';
import 'package:nudron/models/history_cell_model.dart';
import 'package:nudron/providers/globalConfigProvider.dart';
import 'package:nudron/providers/tableDataProvider.dart';
import 'package:nudron/providers/userDataProvider.dart';
import 'package:nudron/widgets/level2/billing_history_table.dart';
import 'package:nudron/widgets/level2/bottomBarBuilder.dart';
import 'package:nudron/widgets/nudron_table.dart';
import 'package:nudron/widgets/utils/header_builder.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class BillingHistory extends StatefulWidget {
  const BillingHistory({Key? key}) : super(key: key);

  @override
  State<BillingHistory> createState() => _DeviceGroupState();
}

String toBeShown = "";
ScrollController _scrollController = ScrollController();
const dataTitle = [
  "Date",
  "Description",
  "Amount",
];
bool show = false;
final DataGridController _dataGridController = DataGridController();

class _DeviceGroupState extends State<BillingHistory> with AutomaticKeepAliveClientMixin<BillingHistory> {
  @override
 

  _getMoreData() {
    print("billing  group data refersher called");
    Provider.of<TableDataProvider>(context, listen: false)
        .billingHistoryDataRefresher();
  }

  void whatIsTapped(int index) {
    print('what is tapped called');
    if (index == 1) {
      setState(() {
        toBeShown =
            Provider.of<UserDataProvider>(context, listen: false).user.address;
        show = !show;
      });
    }
    if (index == 2) {
      setState(() {
        toBeShown =
            Provider.of<UserDataProvider>(context, listen: false).user.phone;
        show = !show;
      });
    }
    if (index == 3) {
      setState(() {
        toBeShown =
            Provider.of<UserDataProvider>(context, listen: false).user.email;
        show = !show;
      });
    }
  }
  @override
  didChangeDependencies() {
    super.didChangeDependencies();
   if(mounted && _dataGridController.selectedIndex != 0) {
     _dataGridController.selectedIndex = 0;
   }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    List<BillingCellData> dataList =
        Provider.of<TableDataProvider>(context).billingDatalist;
    return Container(
      child: SfDataGridTheme(
        data: SfDataGridThemeData(
          selectionColor: deviceColor.withOpacity(0.5),
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
            source: (BillingHistoryDataProvider(
              billingGroupData: dataList,
            )),
            gridLinesVisibility: GridLinesVisibility.both,
            columns: <GridColumn>[
              GridColumn(
                  width: MediaQuery.of(context).size.width * 0.2,
                  columnName: 'date',
                  label: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Date',
                        style: Theme.of(context).primaryTextTheme.headline4,
                      ))),
              GridColumn(
                  width: MediaQuery.of(context).size.width * 0.5,
                  columnName: 'description',
                  label: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Description',
                        style: Theme.of(context).primaryTextTheme.headline4,
                      ))),
              GridColumn(
                  width: MediaQuery.of(context).size.width * 0.3,
                  columnName: 'amount',
                  label: Container(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Amount',
                        style: Theme.of(context).primaryTextTheme.headline4,
                      ))),
            ],
          ),
        ),
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
   @override
  bool get wantKeepAlive => true;
}
