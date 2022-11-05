import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:logindb/components/buttonComp.dart';
import 'package:logindb/components/formComp.dart';
import 'package:logindb/components/pageComp.dart';
import 'package:logindb/firebase/SignIn/signIn.dart';
import 'package:logindb/firebase/RecoverPassaword/forgotPassword.dart';
import 'package:logindb/pages/homePage.dart';
import 'package:logindb/firebase/SignUp/register.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return homepage();
          }else{
            return pagecomp();
          }
        }),
    );
  }
}
