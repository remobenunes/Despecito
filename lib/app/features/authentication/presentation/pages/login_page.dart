import 'package:despecito/app/features/authentication/domain/errors/errors.dart';
import 'package:despecito/app/features/authentication/external/auth_service.dart';
import 'package:despecito/app/features/authentication/presentation/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:string_validator/string_validator.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            const SizedBox(height: 50),
            _getImage(context),
            const SizedBox(height: 10),
            Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 20),
                child: const Text(
                  "LOGIN",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                )),
            CustomTextField(
              controller: emailController,
              errorText: 'E-mail inválido.',
              labelText: 'E-mail',
              validation: isEmail,
              setValueController: () {},
            ),
            CustomTextField(
              controller: passwordController,
              errorText: 'Senha inválida',
              labelText: 'Senha',
              setValueController: () {},
            ),
            const SizedBox(height: 10),
            _getButtonLogin(context),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Novo no Despecito? "),
                GestureDetector(
                  child: const Text(
                    "Cadastrar",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Navigator.popAndPushNamed(context, "/register");
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  login() async {
    EasyLoading.show(status: 'Carregando...');
    try {
      await AuthService().login(emailController.text, passwordController.text);
      EasyLoading.dismiss();
      Navigator.popAndPushNamed(context, "/home");
    } on AuthException catch (e) {
      EasyLoading.dismiss();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  _getImage(BuildContext context) {
    return Image.asset(
      "assets/images/finances-login.jpg",
      width: MediaQuery.of(context).size.width * 0.6,
    );
  }

  _getButtonLogin(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        login();
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
          minimumSize: MaterialStateProperty.all<Size>(
              Size(MediaQuery.of(context).size.width * 0.9, 45))),
      child: const Text("Login"),
    );
  }
}
