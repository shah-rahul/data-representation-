import 'package:flutter/material.dart';

class DeviceGroup extends StatefulWidget {
  const DeviceGroup({Key? key}) : super(key: key);

  @override
  State<DeviceGroup> createState() => _DeviceGroupState();
}

class _DeviceGroupState extends State<DeviceGroup> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4 -
          (MediaQuery.of(context).size.height * 0.05),
      width: MediaQuery.of(context).size.width * 0.9,
      margin: const EdgeInsets.only(left: 7, right: 7, top: 0),
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(blurRadius: 10.0, color: Color.fromRGBO(0, 0, 0, 0.1))
          ],
          color: Theme.of(context).highlightColor,
          borderRadius: BorderRadius.circular(8.0)),
    );
  }
}



