import 'package:firebase_auth/firebase_auth.dart';

class Auth{
  static final auth=FirebaseAuth.instance;
  static Future createUser(String email,String password)async{
    return await auth.
    createUserWithEmailAndPassword(
        email: email, password: password);
  }

  static Future login(String email,String password)async{
    return await auth.
    signInWithEmailAndPassword(
        email: email, password: password);
  }

}