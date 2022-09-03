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
      tileColor: Theme.of(context).colorScheme.primary,
      title: _title(),
      subtitle: _subtitle(),
      trailing: trailing(),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10))),
    );
  }

  Text _title() {
    return Text(
      widget.expenseDto.name ?? '',
      style: const TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Text _subtitle() {
    return Text(
      'R\$${widget.expenseDto.value ?? ''}',
      style: const TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
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
          size: 20,
        ),
      ),
      onTap: () {
        onTap();
      },
    );
  }
}
