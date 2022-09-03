import 'package:despecito/app/domain/models/entities/expense/expense.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatefulWidget {
  final Expense expenseDto;
  final Function() deleteFunction;
  final Function() updateFunction;

  const CustomListTile({
    Key? key,
    required this.expenseDto,
    required this.deleteFunction,
    required this.updateFunction,
  }) : super(key: key);

  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 16),
      tileColor: Colors.grey[800],
      title: _title(),
      subtitle: _subtitle(),
      trailing: trailing(),
    );
  }

  Text _title() {
    return Text(
      widget.expenseDto.name ?? '',
      style: const TextStyle(color: Colors.white),
    );
  }

  Text _subtitle() {
    return Text(
      '${widget.expenseDto.value ?? ''}',
      style: const TextStyle(color: Colors.white),
    );
  }

  Row trailing() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        buildButton(Icons.edit, () {
          widget.updateFunction();
        }),
        buildButton(Icons.delete, () {
          widget.deleteFunction();
        }),
      ],
    );
  }

  GestureDetector buildButton(IconData iconData, Function() onTap) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        height: 50,
        width: 50,
        child: Icon(
          iconData,
          color: Colors.white,
          size: 18,
        ),
      ),
      onTap: () {
        onTap();
      },
    );
  }
}
