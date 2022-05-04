import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nudron/models/billing_cell_data.dart';
import 'package:nudron/models/history_cell_model.dart';
import 'package:nudron/providers/tableDataProvider.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class DeviceListDataProvider extends DataGridSource {
  DeviceListDataProvider({required List<BillingCellData> billingGroupData}) {
    _billingGroupData = billingGroupData
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'deviceid', value: e.date),
              DataGridCell<String>(columnName: 'label', value: e.message),
              DataGridCell<int>(columnName: 'alerts', value: e.amount),
            ]))
        .toList();
  }
  List<DataGridRow> _billingGroupData = [];

  @override
  List<DataGridRow> get rows => _billingGroupData;
  DataGridRowAdapter? buildRow(DataGridRow row) {

    
    return DataGridRowAdapter(
      color: effectiveRows.indexOf(row) %2 == 0 ? Colors.white : Colors.grey[100],
        cells: row.getCells().map<Widget>((dataGridCell) {
       
      return Container(
        alignment: (dataGridCell.columnName == 'deviceid')  ||(dataGridCell.columnName == 'label')  ? Alignment.centerLeft :Alignment.centerRight ,
        child: Text(
          dataGridCell.value.toString(),
          style: GoogleFonts.roboto(
            height: 1.2,
            fontSize: 14,
            color: const Color(0xff000000),
            fontWeight: FontWeight.w500,
          ),
        ),
      );
    }).toList());
  }
}
