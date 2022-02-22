import 'package:flutter/material.dart';
import 'package:nudron/models/sample_data.dart';

class NudronTable extends StatelessWidget {
  const NudronTable({Key? key, required this.data, required this.index})
      : super(key: key);
  final CellData data;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: index % 2 == 0 ? Colors.white : Colors.grey[100],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            data.data1.toString(),
            style: Theme.of(context).primaryTextTheme.bodyLarge,
          ),
          Text(
            data.data2.toString(),
            style: Theme.of(context).primaryTextTheme.bodyLarge,
          ),
          Text(
            data.data3.toString(),
            style: Theme.of(context).primaryTextTheme.bodyLarge,
          ),
          Text(
            data.data4.toString(),
            style: Theme.of(context).primaryTextTheme.bodyLarge,
          ),
        ],
      ),
    );
    ;
  }
}
