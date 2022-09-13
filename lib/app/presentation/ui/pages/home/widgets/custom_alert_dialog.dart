import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:despecito/app/domain/models/dtos/expense_dto.dart';
import 'package:despecito/app/domain/models/entities/expense/expense.dart';
import 'package:despecito/app/presentation/ui/pages/home/widgets/custom_text_field.dart';
import 'package:despecito/app/utils/utils.dart';

class CustomAlertDialog extends StatelessWidget {
  final Expense? expense;
  final Function(ExpenseDto expense) function;

  CustomAlertDialog({
    Key? key,
    this.expense,
    required this.function,
  }) : super(key: key);

  late final valueController =
      TextEditingController(text: expense?.value.toString());
  late final nameController = TextEditingController(text: expense?.name);
  late final categoryController =
      TextEditingController(text: expense?.category);
  late final descriptionController =
      TextEditingController(text: expense?.description);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: AlertDialog(
        backgroundColor: Colors.transparent,
        content: _content(),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          _addButton(context),
          _cancelButton(context),
        ],
      ),
    );
  }

  _content() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomTextField(
          label: 'Valor',
          keyboardType: TextInputType.number,
          controller: valueController,
        ),
        const SizedBox(height: 16),
        CustomTextField(
          label: 'Nome',
          controller: nameController,
        ),
        const SizedBox(height: 16),
        CustomTextField(
          label: 'Categoria',
          controller: categoryController,
        ),
        const SizedBox(height: 16),
        CustomTextField(
          label: 'Descrição',
          controller: descriptionController,
        ),
      ],
    );
  }

  ElevatedButton _addButton(BuildContext context) {
    return ElevatedButton(
      child: const Text('Adicionar'),
      onPressed: () {
        ExpenseDto expense = _createDto();
        function(expense);

        FocusManager.instance.primaryFocus?.unfocus();

        Utils.showSnackBar(
          context,
          'Nova Despesa Adicionada',
        );
      },
    );
  }

  ExpenseDto _createDto() {
    return ExpenseDto(
      name: nameController.text == '' ? 'Não Nomeado' : nameController.text,
      value: getDouble(),
      category: categoryController.text,
      description: descriptionController.text,
      createdAt: expense?.createdAt ?? DateTime.now().toString(),
    );
  }

  ElevatedButton _cancelButton(BuildContext context) {
    return ElevatedButton(
      child: const Text('Cancelar'),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  getDouble() {
    try {
      return double.parse(valueController.text);
    } catch (e) {
      return 0.0;
    }
  }
}
