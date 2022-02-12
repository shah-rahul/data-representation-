import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrimaryCard extends StatefulWidget {
  const PrimaryCard({Key? key, required this.childone, required this.childtwo})
      : super(key: key);
  final Widget childone;
  final Widget childtwo;
  @override
  State<PrimaryCard> createState() => _PrimaryCardState();
}

class _PrimaryCardState extends State<PrimaryCard> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.8,
            minWidth: MediaQuery.of(context).size.width -
                (MediaQuery.of(context).size.width * 0.04)),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [widget.childone, widget.childtwo],
            ),
          ),
        ),
      ),
    );
  }
}
