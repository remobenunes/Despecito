import 'package:despecito/app/utils/utils.dart';
import 'package:flutter/material.dart';

import 'package:despecito/app/domain/models/dtos/expense_dto.dart';
import 'package:despecito/app/presentation/ui/pages/home/widgets/custom_text_field.dart';

class CustomAlertDialog extends StatelessWidget {
  final Function(ExpenseDto expense) function;

  CustomAlertDialog({
    Key? key,
    required this.function,
  }) : super(key: key);

  final valueController = TextEditingController();
  final nameController = TextEditingController();
  final categoryController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey[800],
      content: _content(),
      actions: [
        _addButton(context),
        _cancelButton(context),
      ],
    );
  }

  Column _content() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomTextField(
          hint: 'Valor',
          keyboardType: TextInputType.number,
          controller: valueController,
        ),
        const SizedBox(height: 16),
        CustomTextField(
          hint: 'Nome',
          controller: nameController,
        ),
        const SizedBox(height: 16),
        CustomTextField(
          hint: 'Categoria',
          controller: categoryController,
        ),
        const SizedBox(height: 16),
        CustomTextField(
          hint: 'Descrição',
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
        Utils.showSnackBar(context, 'Nova Despesa Adicionada');
      },
    );
  }

  ExpenseDto _createDto() {
    return ExpenseDto(
      name: nameController.text == "" ? 'Nao Nomeado' : nameController.text,
      value: getDouble(),
      category: categoryController.text,
      description: descriptionController.text,
      createdAt: DateTime.now().toString(),
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
