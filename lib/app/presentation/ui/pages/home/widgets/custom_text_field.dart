import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? label;
  final TextInputType? keyboardType;
  final TextEditingController? controller;

  const CustomTextField({
    Key? key,
    this.label,
    this.keyboardType,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // _label(),
        _formField(context),
      ],
    );
  }

  _formField(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType ?? TextInputType.text,
      style: TextStyle(color: Theme.of(context).colorScheme.primary),
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary, width: 1.0),
        ),
        labelStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
        isDense: true,
      ),
    );
  }
}
