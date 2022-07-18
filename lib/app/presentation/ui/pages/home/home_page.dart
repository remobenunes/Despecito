import 'package:despecito/app/domain/models/entities/expanse.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  Expense expense1 = Expense(
    category: 'Lanches',
    description: 'Lanchinho',
    name: 'Lanchao',
    value: 22.50,
  );
  Expense expense2 = Expense(
    category: 'carro',
    description: 'Gasolina',
    name: 'Gasolina',
    value: 220,
  );
  Expense expense3 = Expense(
    category: 'carro',
    description: 'Manutençao',
    name: 'Manutençao',
    value: 220,
  );
  List<Expense> expenseList = [];

  @override
  void initState() {
    expenseList.add(expense1);
    expenseList.add(expense2);
    expenseList.add(expense3);
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
      actions: [_addButton()],
    );
  }

  IconButton _addButton() {
    return IconButton(
      icon: const Icon(Icons.add),
      onPressed: () {
        showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                content: Container(
                  height: 200,
                  width: 200,
                  color: Colors.purple,
                ),
              );
            });
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
          child: ListTile(
            tileColor: Colors.grey[800],
            title: Text(
              item.name ?? '',
              style: const TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              '${item.value ?? ''}',
              style: const TextStyle(color: Colors.white),
            ),
            trailing: IconButton(
              icon: const Icon(
                Icons.delete,
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  expenseList.removeAt(index);
                });
              },
            ),
          ),
        );
      },
    );
  }
}
