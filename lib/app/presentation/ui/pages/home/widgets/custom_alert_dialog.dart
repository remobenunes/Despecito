import 'package:despecito/app/presentation/ui/pages/home/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey[800],
      actions: [
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel')),
        ElevatedButton(onPressed: () {}, child: const Text('Add')),
      ],
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          CustomTextField(
            hint: 'Valor',
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 16),
          CustomTextField(
            hint: 'Nome',
          ),
          SizedBox(height: 16),
          CustomTextField(
            hint: 'Categoria',
          ),
          SizedBox(height: 16),
          CustomTextField(
            hint: 'Descrição',
          ),
        ],
      ),
    );
  }
}
