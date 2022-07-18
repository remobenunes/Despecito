import 'package:despecito/app/presentation/ui/pages/home/home_page.dart';
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
        //por algum motivo, dá bug se a lista tiver vazia, tbm servir como exemplo
        Provider<Container>(create: (_) => Container()),
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
