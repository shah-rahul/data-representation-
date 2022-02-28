import 'package:flutter/material.dart';

class PrimaryCard extends StatefulWidget {
  const PrimaryCard(
      {Key? key,
      required this.childone,
      required this.childtwo,
      this.button1 = const SizedBox.shrink()})
      : super(key: key);
  final Widget childone;
  final Widget childtwo;
  final Widget button1;
  @override
  State<PrimaryCard> createState() => _PrimaryCardState();
}

class _PrimaryCardState extends State<PrimaryCard> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
            minWidth: MediaQuery.of(context).size.width -
                (MediaQuery.of(context).size.width * 0.04)),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [widget.button1, widget.childone, widget.childtwo],
          ),
        ),
      ),
    );
  }
}
