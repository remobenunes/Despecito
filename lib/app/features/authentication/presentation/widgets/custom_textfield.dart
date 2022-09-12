import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';

class CustomTextField extends StatelessWidget {
  TextEditingController controller;
  String labelText;
  String errorText;
  Function? validation;
  Function setValueController;

  CustomTextField({Key? key, required this.controller, required this.labelText, required this.errorText, this.validation, required this.setValueController}) : super(key: key);

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
          isValid = value!.toString().isNotEmpty && (validation != null ? validation!(value) : isLength(controller.text, 4));
          setValueController(value);
        },
        validator: (String? value) {
          return !isValid! ? errorText : null;
        },
      ),
    );
  }

}