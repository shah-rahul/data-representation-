import 'package:flutter/material.dart';

class TableHeader extends StatelessWidget {
  const TableHeader({Key? key, required this.dataList}) : super(key: key);
  final List dataList;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                dataList[0],
                style: Theme.of(context).primaryTextTheme.headline4,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                dataList[1],
                style: Theme.of(context).primaryTextTheme.headline4,
              ),
            ),
            Padding(
              padding: dataList.length == 4
                  ? const EdgeInsets.only(left: 6)
                  : const EdgeInsets.only(right: 0, left: 60),
              child: Text(
                dataList[2],
                style: Theme.of(context).primaryTextTheme.headline4,
              ),
            ),
            dataList.length == 4
                ? Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text(
                      dataList[3],
                      style: Theme.of(context).primaryTextTheme.headline4,
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
