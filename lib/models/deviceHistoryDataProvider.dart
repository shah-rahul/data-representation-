import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nudron/models/billing_cell_data.dart';
import 'package:nudron/models/history_cell_model.dart';
import 'package:nudron/providers/tableDataProvider.dart';
import 'package:nudron/widgets/level1/alertBarBuilder.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../config/colorConfigFile.dart';

class DeviceHistorydataProvider extends DataGridSource {
  DeviceHistorydataProvider({required List<HistoryCellData> billingGroupData}) {
    _billingGroupData = billingGroupData
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'date', value: e.date),
              DataGridCell<int>(columnName: 'alerts', value: e.alerts),
              DataGridCell<String>(columnName: 'status', value: e.status),
              DataGridCell<String>(columnName: 'comments', value: e.comments),
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
            alignment: (dataGridCell.columnName == 'date')
                ? Alignment.centerLeft
                : Alignment.centerRight,
            child: dataGridCell.columnName == 'alerts'
                ? Alertbar(alert: dataGridCell.value)
                : dataGridCell.columnName == "status" && dataGridCell.value == "0"
                    ? Container(
                    
                        height: 20,
                        decoration: BoxDecoration(
                          color: billingColor,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Center(
                          child: Text(
                            "Open",
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.roboto(
                              height: 1.2,
                              fontSize: 14,
                              color: const Color(0xff000000),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      )
                    : Container(
                       padding: dataGridCell.columnName == 'comments' ? EdgeInsets.only(left: 22) :EdgeInsets.all(0),
                      child: Text(
                          dataGridCell.value.toString(),
                          style: GoogleFonts.roboto(
                            height: 1.2,
                            fontSize: 14,
                            color: const Color(0xff000000),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                    ),
          );
        }).toList());
  }
}
