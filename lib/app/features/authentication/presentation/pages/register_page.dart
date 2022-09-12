import 'package:despecito/app/features/authentication/domain/errors/errors.dart';
import 'package:despecito/app/features/authentication/external/auth_service.dart';
import 'package:despecito/app/features/authentication/presentation/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  bool isLoading = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            const SizedBox(height: 50,),
            _getImage(context),
            const SizedBox(height: 10,),
            Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 20),
                child: const Text("CADASTRAR", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30), )
            ),
            CustomTextField(controller: emailController, errorText: 'E-mail inválido.', labelText: 'E-mail',  validation: isEmail, setValueController: () {},),
            CustomTextField(controller: passwordController, errorText: 'Senha inválida', labelText: 'Senha', setValueController: () {},),

            _getButtonRegister(context),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Já tem conta? "),
                GestureDetector(
                  child: const Text("Login", style: TextStyle(fontWeight: FontWeight.bold),),
                  onTap: () {
                    Navigator.popAndPushNamed(context, "/login");
                  },
                )
              ],
            )

          ],
        ),
      ),
    );
  }

  register() async {
    setState(() => isLoading = true);
    try {
      await AuthService().registrar(emailController.text, passwordController.text);
    } on AuthException catch (e) {
      setState(() => isLoading = false);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  _getImage(BuildContext context) {
    return Image.asset("assets/images/finances-login.jpg", width: MediaQuery.of(context).size.width * 0.6,);
  }

  _getButtonRegister(BuildContext context) {
    return ElevatedButton(
      child: const Text("Cadastrar"),
      onPressed: () {
        register();
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
          minimumSize: MaterialStateProperty.all<Size>(Size(MediaQuery.of(context).size.width * 0.9, 45))
      ),
    );
  }

}