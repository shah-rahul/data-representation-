import 'package:flutter/material.dart';

class NudronTextFieldBuilder extends StatefulWidget {
  NudronTextFieldBuilder(
      {Key? key,
      required this.controller,
      this.isEnabled = true,
      this.isObscure = false,
      required this.icon})
      : super(key: key);
  final TextEditingController controller;
  bool isEnabled;
  Icon icon;
  bool isObscure;
  @override
  State<NudronTextFieldBuilder> createState() => _NudronTextFieldBuilderState();
}

class _NudronTextFieldBuilderState extends State<NudronTextFieldBuilder> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: TextFormField(
          style: TextStyle(color: Colors.black),
          controller: widget.controller,
          obscureText: widget.isObscure,
          
          decoration: InputDecoration(
            prefixIcon: widget.icon,
            contentPadding: const EdgeInsets.fromLTRB(22, 15, 17, 15),
            labelStyle: Theme.of(context).primaryTextTheme.bodyText1,
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(5)),
            isDense: true,
            enabled: widget.isEnabled,
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(5)),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'All fields are required';
            } else {
              return (null);
            }
          }),
    );
  }
}
