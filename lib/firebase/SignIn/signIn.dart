import 'package:firebase_auth/firebase_auth.dart';
import 'package:logindb/components/pageComp.dart';
import 'package:logindb/firebase/RecoverPassaword/forgotPassword.dart';
import 'package:logindb/firebase/SignUp/register.dart';

Future singIn() async {
  try{
  await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: controllerEmail.text.trim(),
      password: controllerPassword.text.trim());
  }on FirebaseAuthException catch (e){
    print(e);
  }
}