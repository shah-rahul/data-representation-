import 'package:flutter/material.dart';
import 'package:nudron/models/billing_cell_data.dart';
import 'package:nudron/models/history_cell_model.dart';

class BillingHistoryTable extends StatelessWidget {
  const BillingHistoryTable(
      {Key? key,
      required this.data,
      this.hilightColor = Colors.white,
      this.isHilighted = false,
      required this.boolIsbillingData,
      required this.index})
      : super(key: key);
  final BillingCellData data;
  final bool isHilighted;
  final boolIsbillingData;
  final Color hilightColor;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isHilighted
            ? hilightColor.withOpacity(0.3)
            : index % 2 == 0
                ? Colors.grey[100]
                : Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              isHilighted
                  ? Container(
                      width: MediaQuery.of(context).size.width * 0.02,
                      color: hilightColor,
                    )
                  : Container(
                      width: MediaQuery.of(context).size.width * 0.02,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.02,
                  ),
              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Text(
                  data.date.toString(),
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).primaryTextTheme.bodyLarge,
                ),
              ),
            ],
          ),
       boolIsbillingData ?   Container(
            width: MediaQuery.of(context).size.width * 0.55,
            child: Row(
              children: [
                Text(
                  data.status.toString(),
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).primaryTextTheme.bodyLarge,
                ),
                data.message  == "bill" ? Padding(
                  padding: const EdgeInsets.only(left:5),
                  child: Icon(Icons.download),
                ) : Container(),
              ],
            ),
          ) : Container(
            width: MediaQuery.of(context).size.width * 0.35,
            child: Text(
              data.message.toString(),
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).primaryTextTheme.bodyLarge,
            ),
          )
          
          ,
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
