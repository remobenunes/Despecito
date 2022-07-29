import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? hint;
  final TextInputType? keyboardType;
  final TextEditingController? controller;

  const CustomTextField({
    Key? key,
    this.hint,
    this.keyboardType,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // _label(),
        _formField(),
      ],
    );
  }

  _formField() {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType ?? TextInputType.text,
      decoration: InputDecoration(
        hintText: hint!,
        hintStyle: TextStyle(
          color: Color.fromARGB(50, 252, 251, 251),
        ),
        isDense: true,
        contentPadding: const EdgeInsets.only(top: 16, bottom: 12),
      ),
    );
  }

  TextStyle _style() {
    return const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
    );
  }
}
