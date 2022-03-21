import 'package:flutter/material.dart';

class PrimaryCard extends StatefulWidget {
  const PrimaryCard({
    Key? key,
    required this.childone,
  }) : super(key: key);
  final Widget childone;
  @override
  State<PrimaryCard> createState() => _PrimaryCardState();
}

class _PrimaryCardState extends State<PrimaryCard> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height * 0.4,
            minWidth: MediaQuery.of(context).size.width -
                (MediaQuery.of(context).size.width * 0.04)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [widget.childone],
        ),
      ),
    );
  }
}
