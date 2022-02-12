import 'package:flutter/material.dart';

class CustomDataTable<T> extends StatefulWidget {
  final List<T> fixedRowCells;
  final List<List<T>> rowsCells;
  final Widget Function(T data) cellBuilder;
  final double fixedColWidth;
  final double cellWidth;
  final double cellHeight;
  final double cellMargin;
  final double cellSpacing;

  CustomDataTable({
    required this.fixedRowCells,
    required this.rowsCells,
    required this.cellBuilder,
    this.fixedColWidth = 30.0,
    this.cellHeight = 30.0,
    this.cellWidth = 70.0,
    this.cellMargin = 10.0,
    this.cellSpacing = 10.0,
  });

  @override
  State<StatefulWidget> createState() => CustomDataTableState();
}

class CustomDataTableState<T> extends State<CustomDataTable<T>> {
  final _columnController = ScrollController();
  final _rowController = ScrollController();
  final _subTableYController = ScrollController();
  final _subTableXController = ScrollController();

  Widget _buildChild(double width, T data) =>
      SizedBox(width: width, child: widget.cellBuilder.call(data));

  Widget _buildFixedRow() => widget.fixedRowCells == null
      ? SizedBox.shrink()
      : Material(
          color: Colors.grey[600],
          child: DataTable(
              horizontalMargin: widget.cellMargin,
              columnSpacing: widget.cellSpacing,
              headingRowHeight: widget.cellHeight,
              dataRowHeight: widget.cellHeight,
              columns: widget.fixedRowCells
                  .map((c) =>
                      DataColumn(label: _buildChild(widget.cellWidth, c)))
                  .toList(),
              rows: []),
        );

  Widget _buildSubTable() => Material(
      color: Colors.grey[300],
      child: DataTable(
          horizontalMargin: widget.cellMargin,
          columnSpacing: widget.cellSpacing,
          headingRowHeight: widget.cellHeight,
          dataRowHeight: widget.cellHeight,
          columns: widget.rowsCells.first
              .map((c) => DataColumn(label: _buildChild(widget.cellWidth, c)))
              .toList(),
          rows: widget.rowsCells
              .sublist(widget.fixedRowCells == null ? 1 : 0)
              .map((row) => DataRow(
                  cells: row
                      .map((c) => DataCell(_buildChild(widget.cellWidth, c)))
                      .toList()))
              .toList()));

  @override
  void initState() {
    super.initState();
    if (_subTableXController.hasClients) {
      _subTableXController.addListener(() {
        _rowController.jumpTo(_subTableXController.position.pixels);
      });
    }
    if (_subTableYController.hasClients) {
      _subTableYController.addListener(() {
        _columnController.jumpTo(_subTableYController.position.pixels);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Row(
          children: <Widget>[
            Flexible(
              child: SingleChildScrollView(
                controller: _subTableXController,
                scrollDirection: Axis.horizontal,
                child: SingleChildScrollView(
                  controller: _subTableYController,
                  scrollDirection: Axis.vertical,
                  child: _buildSubTable(),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Flexible(
              child: SingleChildScrollView(
                controller: _rowController,
                scrollDirection: Axis.horizontal,
                physics: NeverScrollableScrollPhysics(),
                child: _buildFixedRow(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
