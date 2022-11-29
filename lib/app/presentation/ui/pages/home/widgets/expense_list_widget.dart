// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:despecito/app/presentation/ui/pages/home/home_controller.dart';
import 'package:despecito/app/presentation/ui/pages/home/widgets/custom_alert_dialog.dart';
import 'package:despecito/app/presentation/ui/pages/home/widgets/custom_list_tile.dart';
import 'package:despecito/app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:despecito/app/domain/models/entities/expense/expense.dart';

class ExpenseListWidget extends StatefulWidget {
  const ExpenseListWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<ExpenseListWidget> createState() => _ExpenseListWidgetState();
}

class _ExpenseListWidgetState extends State<ExpenseListWidget> {
  @override
  Widget build(BuildContext context) {
    Provider.of<HomeController>(context).getAll();

    return ValueListenableBuilder(
        valueListenable: Provider.of<HomeController>(context).list$,
        builder: (context, List<Expense> list, _) {
          if (list.isEmpty) {
            return TextButton(
              child: const Text('Para começar, Crie uma nova despesa'),
              onPressed: () {
                _createFunction();
              },
            );
          }

          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: list.length,
            itemBuilder: (context, index) {
              var item = list[index];

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomListTile(
                  expenseDto: item,
                  updateFunction: () {
                    _updateFunction(item);
                  },
                  deleteFunction: () {
                    _deleteFunction(item);
                  },
                ),
              );
            },
          );
        });
  }

  _updateFunction(Expense item) {
    return showDialog(
      context: context,
      builder: (_) {
        return CustomAlertDialog(
          expense: item,
          function: (expense) async {
            Provider.of<HomeController>(context, listen: false).update(expense);
          },
        );
      },
    );
  }

  _deleteFunction(Expense item) async {
    Provider.of<HomeController>(context, listen: false).delete(item);
    Utils.showSnackBar(context, 'Despesa Removida com sucesso!');
  }

  _createFunction() {
    showDialog(
      context: context,
      builder: (_) {
        return CustomAlertDialog(
          function: (expense) async {
            Provider.of<HomeController>(context, listen: false).create(expense);
          },
        );
      },
    );
  }
}
