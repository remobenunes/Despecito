import 'package:despecito/app/domain/models/entities/expense/expense.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatefulWidget {
  final Expense expenseDto;
  final Function() function;

  const CustomListTile({
    Key? key,
    required this.expenseDto,
    required this.function,
  }) : super(key: key);

  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.grey[800],
      title: Text(
        widget.expenseDto.name ?? '',
        style: const TextStyle(color: Colors.white),
      ),
      subtitle: Text(
        '${widget.expenseDto.value ?? ''}',
        style: const TextStyle(color: Colors.white),
      ),
      trailing: IconButton(
        icon: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
        onPressed: () {
          widget.function();
        },
      ),
    );
  }
}
