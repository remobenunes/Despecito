import 'package:despecito/app/presentation/ui/pages/home/home_controller.dart';
import 'package:despecito/app/presentation/ui/pages/home/widgets/custom_alert_dialog.dart';
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

  @override
  void initState() {
    controller = HomeController(context.read());
    controller.getAll();
    controller.list$.addListener(() {
      setState(() {
        print('Mudou!');
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
        appBar: _appBar(controller),
        body: _Body(controller),
        backgroundColor: Colors.grey[900],
      ),
    );
  }

  AppBar _appBar(HomeController controller) {
    return AppBar(
      backgroundColor: Colors.black,
      leading: _leading(),
      actions: [
        _addButton(controller),
      ],
    );
  }

  IconButton _addButton(HomeController controller) {
    return IconButton(
      icon: const Icon(Icons.add),
      onPressed: () {
        showDialog(
          context: context,
          builder: (_) {
            return CustomAlertDialog(
              function: (expense) async {
                controller.expenseList.add(expense);
                controller.create(expense);
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
}

class _Body extends StatefulWidget {
  final HomeController controller;

  const _Body(this.controller);

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50),
      child: ListView.builder(
        itemCount: widget.controller.expenseList.length,
        itemBuilder: (context, index) {
          var item = widget.controller.expenseList[index];

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomListTile(
              expenseDto: item,
              function: () async {
                widget.controller.delete(item);
                Utils.showSnackBar(context, 'Despesa Removida com sucesso!');
                setState(() {});
              },
            ),
          );
        },
      ),
    );
  }
}
