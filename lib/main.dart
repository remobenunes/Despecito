import 'package:despecito/app/data/datasources/database_datasource.dart';
import 'package:despecito/app/data/repositories/database_imp_repository.dart';
import 'package:despecito/app/domain/repositories/database_repository.dart';
import 'package:despecito/app/domain/usecases/database_imp_usecase.dart';
import 'package:despecito/app/domain/usecases/database_usecase.dart';
import 'package:despecito/app/external/datasources/database_imp_datasource.dart';
import 'package:despecito/app/features/authentication/external/auth_service.dart';
import 'package:despecito/app/presentation/ui/pages/home/home_controller.dart';
import 'package:despecito/configs/database_local_config.dart';
import 'package:despecito/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import "dart:math";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseLocalConfig.start();
  await Firebase.initializeApp();


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var providers = [
      //datasource
      Provider<DatabaseDatasource>(
          create: (context) => DatabaseImpDatasource()),

      //repository
      Provider<DatabaseRepository>(
          create: (context) => DatabaseImpRepository(context.read())),

      //usecase
      Provider<DatabaseUsecase>(
          create: (context) => DatabaseImpUsecase(context.read())),

      //controllers
      Provider<HomeController>(
          create: (context) => HomeController(context.read())),
    ];

    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'Despecito',
        builder: EasyLoading.init(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: generateRandomMaterialColor(),
        ),
        initialRoute: AuthService().user == null ? '/login' : '/home',
        routes: Routes.routes,
      ),
    );
  }

  MaterialColor generateRandomMaterialColor() {
    List<MaterialColor> list = [
      Colors.amber,
      Colors.blue,
      Colors.blueGrey,
      Colors.brown,
      Colors.cyan,
      Colors.deepOrange,
      Colors.deepPurple,
      Colors.green,
      Colors.grey,
      Colors.indigo,
      Colors.lightBlue,
      Colors.lightGreen,
      Colors.lime,
      Colors.orange,
      Colors.pink,
      Colors.purple,
      Colors.red,
      Colors.teal,
      // Colors.yellow,
    ];

    final random = Random();
    int randomIndex = random.nextInt(list.length);
    return list[randomIndex];
  }
}
