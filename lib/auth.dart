import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auth{
  final FirebaseAuth _auth=FirebaseAuth.instance; 
  final FirebaseFirestore _firestore=FirebaseFirestore.instance;

  Future<String> createUser({required String name,required String Email_id,required String password}) async{
  String r='error';
  try{
      await _auth.createUserWithEmailAndPassword(email: Email_id, password: password);
      r='success';
    }
    catch(e){
      r=e.toString();
    }
    return r;
  }
}