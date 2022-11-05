import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:logindb/components/buttonComp.dart';
import 'package:logindb/components/formComp.dart';

final controllerEmailF = TextEditingController();

class fPassaword extends StatefulWidget {
  const fPassaword({Key? key}) : super(key: key);

  @override
  State<fPassaword> createState() => _fPassawordState();
}

class _fPassawordState extends State<fPassaword> {
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
                    padding: const EdgeInsets.fromLTRB(10, 150, 10, 50),
                    child: Text(
                      'Uma mensagem com link de recuperação será enviada para o email digitado.',
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          'Digite seu email:',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      formcomp(
                          text: '',
                          type: TextInputType.emailAddress,
                          controller: controllerEmailF,
                          password: false),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  buttoncomp(
                      text: 'Confirmar',
                      onClick: recoverPassword,
                      color: Colors.white),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future recoverPassword() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: controllerEmailF.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }
}
