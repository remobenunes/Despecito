import 'package:despecito/app/data/datasources/database_datasource.dart';
import 'package:despecito/app/data/repositories/database_imp_repository.dart';
import 'package:despecito/app/domain/repositories/database_repository.dart';
import 'package:despecito/app/domain/usecases/database_imp_usecase.dart';
import 'package:despecito/app/domain/usecases/database_usecase.dart';
import 'package:despecito/app/external/datasources/database_imp_datasource.dart';
import 'package:despecito/app/presentation/ui/pages/home/home_controller.dart';
import 'package:despecito/configs/database_local_config.dart';
import 'package:despecito/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseLocalConfig.start();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
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
      ],
      child: MaterialApp(
        title: 'Despecito',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        initialRoute: '/',
        routes: Routes.routes,
      ),
    );
  }
}
