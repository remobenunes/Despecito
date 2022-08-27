import 'package:despecito/app/domain/models/dtos/expense_dto.dart';
import 'package:despecito/app/domain/models/entities/expense/expense.dart';
import 'package:despecito/app/presentation/ui/pages/home/widgets/custom_alert_dialog.dart';
import 'package:despecito/app/presentation/ui/pages/home/widgets/custom_list_tile.dart';
import 'package:despecito/app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final Box box;

  List<Expense> expenseList = [];

  @override
  void initState() {
    openBoxes();

    super.initState();
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
              function: (expense) async {
                expenseList.add(expense);
                await box.put(Utils.generateRandomString(), expense);
                print(box.values.length);

                setState(() {});
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

  openBoxes() async {
    final exp1 = ExpenseDto(
      category: 'Lanches',
      description: 'Lanchinho',
      name: 'Lanchao',
      value: 22.50,
    );
    final exp2 = ExpenseDto(
      category: 'carro',
      description: 'Gasolina',
      name: 'Gasolina',
      value: 220,
    );
    final exp3 = ExpenseDto(
      category: 'carro',
      description: 'Manutençao',
      name: 'Manutençao',
      value: 220,
    );

    box = await Hive.openBox<Expense>('expenses');
    box.put('exp1', exp1);
    box.put('exp2', exp2);
    box.put('exp3', exp3);

    setState(() {
      final list = box.values;
      print(list);
      for (var element in list) {
        print(element);
        expenseList.add(element);
      }
    });
  }

  _body() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50),
      child: ListView.builder(
        itemCount: expenseList.length,
        itemBuilder: (context, index) {
          var item = expenseList[index];

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomListTile(
              expenseDto: item,
              function: () async {
                expenseList.removeAt(index);
                Utils.showSnackBar(context, 'Despesa Removida com sucesso!');
                await box.deleteAt(index);

                print(box.values.length);

                setState(() {});
              },
            ),
          );
        },
      ),
    );
  }
}
