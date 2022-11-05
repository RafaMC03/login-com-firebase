import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../firebase/SignIn/signIn.dart';
import '../firebase/RecoverPassaword/forgotPassword.dart';
import '../pages/homePage.dart';
import '../firebase/SignUp/register.dart';
import 'buttonComp.dart';
import 'formComp.dart';

final controllerPassword = TextEditingController();
final controllerEmail = TextEditingController();

class pagecomp extends StatefulWidget {
  const pagecomp({Key? key}) : super(key: key);

  @override
  State<pagecomp> createState() => _pagecompState();
}

class _pagecompState extends State<pagecomp> {
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
              1
            ],
                colors: [
              Colors.black,
              Colors.lime,
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
                      'Faça seu login!',
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  formcomp(
                      text: 'Digite seu email',
                      type: TextInputType.emailAddress,
                      controller: controllerEmail,
                      password: false),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      formcomp(
                        text: 'Digite sua senha',
                        type: TextInputType.number,
                        controller: controllerPassword,
                        password: true,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => fPassaword()));
                          },
                          child: Text(
                            'Esqueci minha senha',
                            style: TextStyle(color: Colors.white),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  buttoncomp(
                      text: 'Entrar',
                      onClick: () {
                        singIn();
                      },
                      color: Colors.white),
                  SizedBox(
                    height: 50,
                  ),
                  RichText(
                      text: TextSpan(
                          text: 'Não tem uma conta? ',
                          style: TextStyle(color: Colors.white),
                          children: <TextSpan>[
                        TextSpan(
                            text: 'Cadastre-se',
                            style: TextStyle(color: Colors.blueAccent),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) => Register())));
                              })
                      ]))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}