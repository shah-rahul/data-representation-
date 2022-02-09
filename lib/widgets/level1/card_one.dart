import 'package:flutter/material.dart';

class CardOne extends StatefulWidget {
  CardOne({Key? key}) : super(key: key);

  @override
  State<CardOne> createState() => _CardOneState();
}

class _CardOneState extends State<CardOne> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4 -
          (MediaQuery.of(context).size.height * 0.05),
      width: MediaQuery.of(context).size.width * 0.9,
      margin: const EdgeInsets.only(left: 7, right: 7, top: 10),
      padding: const EdgeInsets.fromLTRB(15, 12, 12, 15),
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(blurRadius: 10.0, color: Color.fromRGBO(0, 0, 0, 0.1))
          ],
          color: Theme.of(context).highlightColor,
          borderRadius: BorderRadius.circular(8.0)),
    );
  }
}
