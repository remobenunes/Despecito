import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? label;
  final TextInputType? keyboardType;
  final TextEditingController controller;

  const CustomTextField({
    Key? key,
    this.label,
    this.keyboardType,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType ?? TextInputType.text,
      style: TextStyle(
        color: Theme.of(context).colorScheme.primary,
      ),
      decoration: _decoration(context),
      onTap: () {
        controller.clear();
      },
    );
  }

  InputDecoration _decoration(BuildContext context) {
    return InputDecoration(
      labelText: label,
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.primary,
          width: 2,
        ),
      ),
      labelStyle: const TextStyle(
          // color: Theme.of(context).colorScheme.primary,
          color: Colors.white,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w400),
      isDense: true,
    );
  }
}
