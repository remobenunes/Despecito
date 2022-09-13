import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String errorText;
  final Function? validation;
  final Function setValueController;

  CustomTextField({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.errorText,
    this.validation,
    required this.setValueController,
  }) : super(key: key);

  bool? isValid = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextFormField(
        controller: controller,
        autovalidateMode: AutovalidateMode.always,
        decoration: InputDecoration(
          labelText: labelText,
        ),
        onChanged: (String? value) {
          isValid = value!.toString().isNotEmpty &&
              (validation != null
                  ? validation!(value)
                  : isLength(controller.text, 4));
          setValueController(value);
        },
        validator: (String? value) {
          return !isValid! ? errorText : null;
        },
      ),
    );
  }
}
