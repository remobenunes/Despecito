import 'package:despecito/app/domain/models/dtos/expense_dto.dart';
import 'package:despecito/app/presentation/ui/pages/home/widgets/custom_alert_dialog.dart';
import 'package:despecito/app/presentation/ui/pages/home/widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void dispose() {
    Hive.close();

    super.dispose();
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  ExpenseDto exp1 = ExpenseDto(
    category: 'Lanches',
    description: 'Lanchinho',
    name: 'Lanchao',
    value: 22.50,
  );
  ExpenseDto exp2 = ExpenseDto(
    category: 'carro',
    description: 'Gasolina',
    name: 'Gasolina',
    value: 220,
  );
  ExpenseDto exp3 = ExpenseDto(
    category: 'carro',
    description: 'Manutençao',
    name: 'Manutençao',
    value: 220,
  );
  List<ExpenseDto> expenseList = [];

  @override
  void initState() {
    expenseList.add(exp1);
    expenseList.add(exp2);
    expenseList.add(exp3);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        appBar: _appBar(),
        body: _body(),
        backgroundColor: Colors.grey[900],
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: Colors.black,
      leading: _leading(),
      actions: [
        _addButton(),
      ],
    );
  }

  IconButton _addButton() {
    return IconButton(
      icon: const Icon(Icons.add),
      onPressed: () {
        showDialog(
          context: context,
          builder: (_) {
            return CustomAlertDialog(
              function: (expense) {
                setState(() {
                  expenseList.add(expense);
                  
                });
              },
            );
          },
        );
      },
    );
  }

  IconButton _leading() {
    return IconButton(
      icon: const Icon(Icons.menu),
      onPressed: () {},
    );
  }

  _body() {
    return ListView.builder(
      itemCount: expenseList.length,
      itemBuilder: (context, index) {
        var item = expenseList[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomListTile(
            expenseDto: item,
            function: () {
              setState(() {
                expenseList.removeAt(index);
              });
            },
          ),
        );
      },
    );
  }
}
