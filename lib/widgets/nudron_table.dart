import 'package:flutter/material.dart';
import 'package:nudron/config/colorConfigFile.dart';
import 'package:nudron/models/history_cell_model.dart';
import 'package:nudron/widgets/level1/alertBarBuilder.dart';

class NudronTable extends StatelessWidget {
  const NudronTable(
      {Key? key,
      required this.isBillingData,
      required this.data,
      this.isHilighted = false,
      this.hilightColor = Colors.white,
      required this.index})
      : super(key: key);
  final HistoryCellData data;
  final bool isHilighted;
  final Color hilightColor;
  final bool isBillingData;
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
        mainAxisAlignment: isBillingData
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.spaceAround,
        children: [
          Row(
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
              isBillingData
                  ? Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: Text(
                        data.date.toString(),
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).primaryTextTheme.bodyLarge,
                      ),
                    )
                  : Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: Text(
                        data.date.toString(),
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).primaryTextTheme.bodyLarge,
                      ),
                    ),
            ],
          ),
          Container(
            padding:
                isBillingData ? EdgeInsets.only(left: 30) : EdgeInsets.only(),
            width: MediaQuery.of(context).size.width * 0.15,
            child: !isBillingData
                ? Alertbar(alert: data.alerts)
                : Text(
                    data.alerts.toString(),
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).primaryTextTheme.bodyLarge,
                  ),
          ),
          data.status == '0'
              ? Container(
                height: MediaQuery.of(context).size.height * 0.025,
                  decoration: BoxDecoration(
                    color: billingColor,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  padding: isBillingData
                      ? EdgeInsets.only(left: 30)
                      : EdgeInsets.all(0),
                  width: MediaQuery.of(context).size.width * 0.15,
                  child: Center(
                    child: Text(
                      "Open",
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).primaryTextTheme.bodyLarge,
                    ),
                  ),
                )
              : Container(
                  padding: isBillingData
                      ? EdgeInsets.only(left: 30)
                      : EdgeInsets.all(0),
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
            width: isBillingData
                ? MediaQuery.of(context).size.width * 0.20
                : MediaQuery.of(context).size.width * 0.4,
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
