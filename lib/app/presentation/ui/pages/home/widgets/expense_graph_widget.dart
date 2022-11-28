import 'package:flutter/material.dart';

class ExpenseGraphWidget extends StatefulWidget {
  const ExpenseGraphWidget({super.key});

  @override
  State<ExpenseGraphWidget> createState() => _ExpenseGraphWidgetState();
}

class _ExpenseGraphWidgetState extends State<ExpenseGraphWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      color: Colors.red,
    );
  }
}
