import 'package:flutter/material.dart';

class DashBoardItemBuilder extends StatelessWidget {
  const DashBoardItemBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
          width: MediaQuery.of(context).size.width * 0.5,
            child: Text("Brihanmumbai Municipal Corporation", style: Theme.of(context).primaryTextTheme.headline4    ,)),
          Icon(Icons.arrow_forward_ios),
          Text(
            "owner",
            style: TextStyle(color: Colors.blue),
          )
        ],
      ),
    );
  }
}
