import 'package:flutter/material.dart';
import 'package:nudron/config/colorConfigFile.dart';
import 'package:nudron/models/history_cell_model.dart';
import 'package:nudron/widgets/level1/alertBarBuilder.dart';
import 'package:nudron/widgets/sideBar/nudron_textform_withouticon.dart';

import '../models/billing_cell_data.dart';

class NudronTable extends StatelessWidget {
  NudronTable(
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

  final TextEditingController _controller = TextEditingController();
  openDialog(context, HistoryCellData data) {
    showDialog(
        context: context,
        builder: (context) => Dialog(
              child: Container(
                height: 150,
                color: billingColor.withOpacity(0.3),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 10, bottom: 10, left: 20, right: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                  
                    children: [
                      NudronTextFieldBuilderWithoutIcon(
                          controller: _controller, text: "Add new comment"),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                width: MediaQuery.of(context).size.width * 0.1,
                                height:
                                    MediaQuery.of(context).size.height * 0.04,
                                child: Center(child: Icon(Icons.check)),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                width: MediaQuery.of(context).size.width * 0.1,
                                height:
                                    MediaQuery.of(context).size.height * 0.04,
                                child:
                                    Center(child: Icon(Icons.cancel_outlined)),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ));
  }

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
              ? GestureDetector(
                  onTap: (() => openDialog(context, data)),
                  child: Container(
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
