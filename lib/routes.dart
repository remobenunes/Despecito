import 'package:despecito/app/features/authentication/presentation/pages/login_page.dart';
import 'package:despecito/app/features/authentication/presentation/pages/register_page.dart';
import 'package:despecito/app/presentation/ui/pages/home/home_page.dart';

class Routes {
  
  static var routes = {
    '/home': (context) => const HomePage(),
    '/login': (context) => LoginPage(),
    '/register': (context) => RegisterPage(),
  };
}
