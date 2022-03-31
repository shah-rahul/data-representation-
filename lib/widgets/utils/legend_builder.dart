import 'package:flutter/material.dart';

class LegendBuilder extends StatelessWidget {
  const LegendBuilder({Key? key, required this.text, required this.color})
      : super(key: key);
  // ignore: prefer_typing_uninitialized_variables
  final text;
  // ignore: prefer_typing_uninitialized_variables
  final color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 15,
            height: 15,
            color: color,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              text,
              style: const TextStyle(color: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}
