import 'package:flutter/material.dart';

class Alertbar extends StatefulWidget {
  final int alert;
  const Alertbar({required this.alert, Key? key}) : super(key: key);

  @override
  State<Alertbar> createState() => _AlertbarState();
}

class _AlertbarState extends State<Alertbar> {
  var arr = [];
//  a function to convert integet to binary
  void convertToBinary(int number) {
    String binary = '';
    while (number > 0) {
      binary = (number % 2).toString() + "" + binary;
      number = number ~/ 2;
    }
    var tempArr = binary.split("");
    if (tempArr.length < 5) {
      int diff = 5 - tempArr.length;
      for (int i = 0; i < diff; i++) {
        tempArr.insert(i, "0");
      }
    }
    print(widget.alert);
    print(tempArr);
    arr = tempArr;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    convertToBinary(widget.alert);
  }

  @override
  Widget build(BuildContext context) {
    List<Icon> provideIcon() {
      List<Icon> icons = [];

      if (arr[0] == "1") {
        icons.add(const Icon(
          Icons.fire_extinguisher_outlined,
          size: 10,
          color: Colors.red,
        ));
      } else {
        icons.add(const Icon(
          Icons.fire_extinguisher_outlined,
          size: 10,
          color: Colors.grey,
        ));
      }
      if (arr[1] == "1") {
        icons.add(const Icon(
          Icons.stop_circle,
          size: 10,
          color: Colors.red,
        ));
      } else {
        icons.add(const Icon(
          Icons.stop_circle,
          size: 10,
          color: Colors.grey,
        ));
      }
      if (arr[2] == "1") {
        icons.add(const Icon(
          Icons.airplane_ticket_sharp,
          size: 10,
          color: Colors.red,
        ));
      } else {
        icons.add(const Icon(
          Icons.airplane_ticket_sharp,
          size: 10,
          color: Colors.grey,
        ));
      }
      if (arr[3] == "1") {
        icons.add(const Icon(
          Icons.stop_sharp,
          size: 10,
          color: Colors.red,
        ));
      } else {
        icons.add(const Icon(
          Icons.stop_sharp,
          size: 10,
          color: Colors.grey,
        ));
      }
      if (arr[4] == "1") {
        icons.add(const Icon(
          Icons.block,
          size: 10,
          color: Colors.red,
        ));
      } else {
        icons.add(const Icon(
          Icons.block,
          size: 10,
          color: Colors.grey,
        ));
      }

      return icons;
    }

    return Row(
      children: provideIcon(),
    );
  }
}
