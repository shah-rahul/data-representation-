import 'package:flutter/material.dart';
import 'package:nudron/config/colorConfigFile.dart';
import 'package:nudron/providers/globalConfigProvider.dart';
import 'package:nudron/providers/tableDataProvider.dart';
import 'package:nudron/providers/userDataProvider.dart';
import 'package:nudron/widgets/sideBar/nudron_textform_withouticon.dart';
import 'package:provider/provider.dart';

class BillingHistoryInfoContainer extends StatelessWidget {
  BillingHistoryInfoContainer({Key? key}) : super(key: key);
  final TextEditingController reminderCOntroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Provider.of<GlobalConfigProvider>(context).isBillingSelected
              ? Container(
                  padding: EdgeInsets.only(left: 10),
                  child: Center(
                    child: Text(
                      Provider.of<GlobalConfigProvider>(context)
                          .selectedBillingGroup,
                      style: Theme.of(context)
                          .primaryTextTheme
                          .headline3!
                          .copyWith(color: deviceColor, fontSize: 30),
                    ),
                  ),
                )
              : Container(
                  padding: EdgeInsets.only(left: 10),
                  child: Center(
                    child: Text(
                      Provider.of<TableDataProvider>(context)
                          .billingGroupList[0]
                          .date,
                      style: Theme.of(context)
                          .primaryTextTheme
                          .headline3!
                          .copyWith(color: deviceColor, fontSize: 30),
                    ),
                  ),
                ),

          Container(
            padding: EdgeInsets.only(left: 10),
            width: MediaQuery.of(context).size.width * 0.9,
            child: Text(
              "Address: " + Provider.of<UserDataProvider>(context).user.address,
              style: Theme.of(context)
                  .primaryTextTheme
                  .headline5!
                  .copyWith(fontSize: 16),
              maxLines: 3,
            ),
          ),

          Container(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              "Phone: " + Provider.of<UserDataProvider>(context).user.phone,
              textAlign: TextAlign.left,
              style: Theme.of(context)
                  .primaryTextTheme
                  .headline5!
                  .copyWith(fontSize: 16),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              "Email: " + Provider.of<UserDataProvider>(context).user.email,
              style: Theme.of(context)
                  .primaryTextTheme
                  .headline5!
                  .copyWith(fontSize: 16),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10),
            child: Row(
              children: [
                NudronTextFieldBuilderWithoutIcon(
                    controller: reminderCOntroller, text: "send reminder"),
                IconButton(onPressed: () {}, icon: Icon(Icons.send)),
              ],
            ),
          )
          //mail
        ],
      ),
    );
  }
}
