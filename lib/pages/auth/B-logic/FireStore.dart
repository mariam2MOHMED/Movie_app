import 'package:cloud_firestore/cloud_firestore.dart';

class FireStore{
  static final store=FirebaseFirestore.instance;
  static Future <void>Add(String name,String age,String phone)async{
    await store.collection('Users').add({
      'userName':name,
      'phoneNumber':phone,
      'age':age,
    });
    print("Added");
  }
}