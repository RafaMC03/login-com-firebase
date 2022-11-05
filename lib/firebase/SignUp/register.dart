import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:logindb/components/buttonComp.dart';
import 'package:logindb/components/formComp.dart';
import 'package:logindb/pages/homePage.dart';

final controllerPasswordR = TextEditingController();
final controllerEmailR = TextEditingController();

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var sucess = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [
              0.4,
              0.7
            ],
                colors: [
              Colors.lime,
              Colors.black,
            ])),
        child: ListView(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 200),
                    child: Text(
                      'Se cadastre!',
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  formcomp(
                      text: 'Digite seu email',
                      type: TextInputType.emailAddress,
                      controller: controllerEmailR,
                      password: false),
                  SizedBox(
                    height: 20,
                  ),
                  formcomp(
                      text: 'Digite sua senha',
                      type: TextInputType.number,
                      controller: controllerPasswordR,
                      password: true),
                  SizedBox(
                    height: 70,
                  ),
                  buttoncomp(
                      text: 'Cadastrar',
                      onClick: SignUp,
                      color: Colors.white),
                  SizedBox(
                    height: 50,
                  ),
                  RichText(
                      text: TextSpan(
                          text: 'Já possui uma conta? ',
                          style: TextStyle(color: Colors.white),
                          children: <TextSpan>[
                        TextSpan(
                            text: 'Faça login',
                            style: TextStyle(color: Colors.blueAccent),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pop(context);
                              })
                      ])),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future SignUp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: controllerEmailR.text.trim(),
        password: controllerPasswordR.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e);
      sucess = false;
    }
    if (sucess = true) {
    Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: Duration(milliseconds: 1500),
        behavior: SnackBarBehavior.fixed,
        backgroundColor: Colors.black,
        content: const Text(
          'Conta criada com sucesso!',
          textAlign: TextAlign.center,
        ),
      ));
  }
}
}