import 'package:flutter/material.dart';

class Utils {
  static showSnackBar(context,String text) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
  }
}
