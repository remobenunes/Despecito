import 'package:despecito/app/presentation/ui/pages/home/widgets/expense_graph_widget.dart';
import 'package:despecito/app/presentation/ui/pages/home/widgets/expense_list_widget.dart';
import 'package:flutter/material.dart';

class ExpenseWidget extends StatefulWidget {
  const ExpenseWidget({super.key});

  @override
  State<ExpenseWidget> createState() => _ExpenseWidgetState();
}

class _ExpenseWidgetState extends State<ExpenseWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: PageView(
        children: [
          _buildExpenseList(),
          _buildExpenseGraphWidget(),
        ],
      ),
    );
  }

  //fazer um for quebrando a lista que volta, pra cada item da lista, criar um expense
  _buildExpenseList() {
    return ExpenseListWidget();
  }

  _buildExpenseGraphWidget() {
    return ExpenseGraphWidget();
  }
}
