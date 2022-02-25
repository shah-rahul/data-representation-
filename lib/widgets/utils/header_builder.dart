import 'package:flutter/material.dart';

class TableHeader extends StatelessWidget {
  const TableHeader({Key? key, required this.dataList}) : super(key: key);
  final List dataList;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 6),
              child: Text(
                dataList[0],
                style: Theme.of(context).primaryTextTheme.headline4,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 6),
              child: Text(
                dataList[1],
                style: Theme.of(context).primaryTextTheme.headline4,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 6),
              child: Text(
                dataList[2],
                style: Theme.of(context).primaryTextTheme.headline4,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 6),
              child: Text(
                dataList[3],
                style: Theme.of(context).primaryTextTheme.headline4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
