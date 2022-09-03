import 'package:despecito/app/domain/models/entities/expense/expense.dart';
import 'package:despecito/app/presentation/ui/pages/home/home_controller.dart';
import 'package:despecito/app/presentation/ui/pages/home/widgets/custom_alert_dialog.dart';
import 'package:despecito/app/presentation/ui/pages/home/widgets/custom_app_bar.dart';
import 'package:despecito/app/presentation/ui/pages/home/widgets/custom_list_tile.dart';
import 'package:despecito/app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeController controller;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    controller = HomeController(context.read());
    controller.getAll();
    controller.list$.addListener(() {
      setState(() {
        print('zap!');
      });
    });

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
        key: scaffoldKey,
        appBar: CustomAppBar(
          controller,
        ),
        body: _body(),
        backgroundColor: Colors.grey[900],
      ),
    );
  }

  _body() {
    return ListView.builder(
      itemCount: controller.expenseList.length,
      itemBuilder: (context, index) {
        var item = controller.expenseList[index];

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomListTile(
            expenseDto: item,
            updateFunction: () {
              _updateFunction(item);
            },
            deleteFunction: () {
              _deleteFunction(item);
            },
          ),
        );
      },
    );
  }

  _updateFunction(Expense item) {
    return showDialog(
      context: context,
      builder: (_) {
        return CustomAlertDialog(
          expense: item,
          function: (expense) async {
            controller.update(expense);
          },
        );
      },
    );
  }

  _deleteFunction(Expense item) async {
    controller.delete(item);
    Utils.showSnackBar(context, 'Despesa Removida com sucesso!');
  }
}
