
import 'package:firebase_auth/firebase_auth.dart';

class Auth{
  static final auth=FirebaseAuth.instance;
  static  createUser(String email,String password)async{
    await  auth.
    createUserWithEmailAndPassword(
        email: email, password: password);
  }

  static  login(String email,String password)async{
    await  auth.
    signInWithEmailAndPassword(
        email: email, password: password);
  }

}