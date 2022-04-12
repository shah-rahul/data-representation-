import 'package:flutter/material.dart';
import 'package:nudron/models/billing_cell_data.dart';
import 'package:nudron/models/history_cell_model.dart';

class BillingHistoryTable extends StatelessWidget {
  const BillingHistoryTable({Key? key, required this.data, required this.index})
      : super(key: key);
  final BillingCellData data;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: index % 2 == 0 ? Colors.grey[100] : Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            width: MediaQuery.of(context).size.width * 0.35,
            child: Text(
              data.message.toString(),
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).primaryTextTheme.bodyLarge,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.1,
            child: Text(
              data.amount.toString(),
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).primaryTextTheme.bodyLarge,
            ),
          ),
        ],
      ),
    );
  }
}
