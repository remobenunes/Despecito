import 'package:despecito/app/domain/models/entities/expense/expense.dart';
import 'package:despecito/app/presentation/ui/pages/home/home_controller.dart';
import 'package:despecito/app/presentation/ui/pages/home/widgets/custom_alert_dialog.dart';
import 'package:despecito/app/presentation/ui/pages/home/widgets/custom_app_bar.dart';
import 'package:despecito/app/presentation/ui/pages/home/widgets/custom_list_tile.dart';
import 'package:despecito/app/presentation/ui/pages/home/widgets/expense_widget.dart';
import 'package:despecito/app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeController controller;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    controller = HomeController(context.read());
    controller.getAll();
    controller.list$.addListener(() {
      // setState(() {
        print('zap!');
      // });
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
    return Scaffold(
      key: scaffoldKey,
      appBar: _buildAppBar(),
      body: SafeArea(
        child: _body(),
      ),
      backgroundColor: Colors.grey[900],
    );
  }

  CustomAppBar _buildAppBar() {
    return CustomAppBar(
      onPressedAddButton: () {
        _createFunction();
      },
    );
  }

  _body() {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildTopTile(),
          const ExpenseWidget(),
        ],
      ),
    );
  }

  ListTile _buildTopTile() {
    return const ListTile(
      leading: Icon(Icons.arrow_left),
      trailing: Icon(Icons.arrow_right),
      tileColor: Colors.grey,
      iconColor: Colors.white,
      title: Center(
        child: Text(
          'Janeiro',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
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

  _createFunction() {
    showDialog(
      context: context,
      builder: (_) {
        return CustomAlertDialog(
          function: (expense) async {
            controller.create(expense);
          },
        );
      },
    );
  }
}
