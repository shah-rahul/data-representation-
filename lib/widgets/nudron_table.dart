import 'package:flutter/material.dart';
import 'package:nudron/models/history_cell_model.dart';

class NudronTable extends StatelessWidget {
  const NudronTable(
      {Key? key,
      required this.isBillingData,
      required this.data,
      required this.index})
      : super(key: key);
  final HistoryCellData data;
  final bool isBillingData;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: index % 2 == 0 ? Colors.grey[100] : Colors.white,
      ),
      child: Row(
        mainAxisAlignment: isBillingData
            ? MainAxisAlignment.values[4]
            : MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.15,
            child: Text(
              data.date.toString(),
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).primaryTextTheme.bodyLarge,
            ),
          ),
          Container(
            padding:
                isBillingData ? EdgeInsets.only(left: 30) : EdgeInsets.all(0),
            width: MediaQuery.of(context).size.width * 0.15,
            child: Text(
              data.alerts.toString(),
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).primaryTextTheme.bodyLarge,
            ),
          ),
          Container(
            padding:
                isBillingData ? EdgeInsets.only(left: 30) : EdgeInsets.all(0),
            width: MediaQuery.of(context).size.width * 0.15,
            child: Text(
              data.status.toString(),
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).primaryTextTheme.bodyLarge,
            ),
          ),
          Container(
            padding:
                isBillingData ? EdgeInsets.only(left: 16) : EdgeInsets.all(0),
            width: MediaQuery.of(context).size.width * 0.15,
            child: Text(
              data.comments.toString(),
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).primaryTextTheme.bodyLarge,
            ),
          )
        ],
      ),
    );
  }
}
