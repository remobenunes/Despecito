import 'package:despecito/app/domain/models/dtos/expense_dto.dart';
import 'package:despecito/app/presentation/ui/pages/home/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

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
      actions: [
        ElevatedButton(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        ElevatedButton(
          child: const Text('Add'),
          onPressed: () {
            final expense = ExpenseDto(
              category: categoryController.text,
              name: nameController.text,
              description: descriptionController.text,
              value: getDouble(),
              createdAt: DateTime.now(),
            );

            function(expense);
          },
        ),
      ],
      content: Column(
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
      ),
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
