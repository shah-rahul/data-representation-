import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nudron/models/history_cell_model.dart';
import 'package:nudron/providers/tableDataProvider.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ZonalDataProvider extends DataGridSource {
  ZonalDataProvider({required List<HistoryCellData> billingGroupData}) {
    _billingGroupData = billingGroupData
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'label', value: e.date),
              DataGridCell<int>(columnName: 'devices', value: e.alerts),
              DataGridCell<String>(columnName: 'alerts', value: e.status),
              DataGridCell<String>(columnName: 'dues', value: e.comments),
            ]))
        .toList();
  }
  List<DataGridRow> _billingGroupData = [];

  @override
  List<DataGridRow> get rows => _billingGroupData;
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        color: effectiveRows.indexOf(row) % 2 == 0
            ? Colors.white
            : Colors.grey[100],
        cells: row.getCells().map<Widget>((dataGridCell) {
          return Container(
            alignment: (dataGridCell.columnName == 'label')
                ? Alignment.centerLeft
                : (dataGridCell.columnName == 'dues')
                    ? Alignment.centerRight
                    : Alignment.center,
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
