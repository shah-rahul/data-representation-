import 'package:flutter/material.dart';

class NudronTextFieldBuilderWithoutIcon extends StatefulWidget {
  NudronTextFieldBuilderWithoutIcon({
    Key? key,
    required this.controller,
    required this.text,
  }) : super(key: key);
  final TextEditingController controller;
  final String text;
  @override
  State<NudronTextFieldBuilderWithoutIcon> createState() =>
      _NudronTextFieldBuilderState();
}

class _NudronTextFieldBuilderState
    extends State<NudronTextFieldBuilderWithoutIcon> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: TextFormField(
          style: TextStyle(color: Colors.black),
          controller: widget.controller,
          decoration: InputDecoration(
            label: Text(widget.text),
            contentPadding: const EdgeInsets.fromLTRB(22, 15, 17, 15),
            labelStyle: Theme.of(context).primaryTextTheme.bodyText1,
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(5)),
            isDense: true,
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(5)),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Name is required to continue';
            } else {
              return (null);
            }
          }),
    );
  }
}
