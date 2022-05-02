import 'package:flutter/material.dart';
import 'package:nudron/config/colorConfigFile.dart';
import 'package:nudron/providers/globalConfigProvider.dart';
import 'package:nudron/providers/tableDataProvider.dart';
import 'package:nudron/providers/userDataProvider.dart';
import 'package:nudron/widgets/sideBar/nudron_textform_withouticon.dart';
import 'package:provider/provider.dart';

class DeviceLisInfoContainer extends StatelessWidget {
  DeviceLisInfoContainer({Key? key}) : super(key: key);
  final TextEditingController reminderCOntroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Provider.of<GlobalConfigProvider>(context).isBillingSelected
              ? Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    Provider.of<GlobalConfigProvider>(context)
                        .selectedDeviceGroup,
                    style: Theme.of(context)
                        .primaryTextTheme
                        .headline3!
                        .copyWith(color: billingColor, fontSize: 30),
                  ),
                )
              : Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    Provider.of<TableDataProvider>(context).devicelist[0].date,
                    style: Theme.of(context)
                        .primaryTextTheme
                        .headline3!
                        .copyWith(color: billingColor, fontSize: 30),
                  ),
                ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                Text(
                  Provider.of<GlobalConfigProvider>(context).date,
                  style: Theme.of(context).primaryTextTheme.headline5,
                ),
                Text(" | ",
                    style: Theme.of(context).primaryTextTheme.headline5),
                Text(
                  Provider.of<GlobalConfigProvider>(context).selectedDeviceType,
                  style: Theme.of(context).primaryTextTheme.headline5,
                )
              ],
            ),
          ),

          //mail
        ],
      ),
    );
  }
}
