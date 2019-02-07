import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


abstract class BaseAuth {

  Future<String> currentUser();

  Future<String> signIn(String email, String password);

  Future<String> createUser(String email, String password, String name,
      String surname, String phone);

  Future<void> signOut();

  Future<String> addUser(String email, String password, String name,
      String surname, String phone);
}

class Auth implements BaseAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String> signIn(String email, String password) async {
    FirebaseUser user = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    return user.uid;
  }

  Future<String> createUser(String email, String password,String name, String surname, String phone ) async {
    FirebaseUser user = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    Firestore.instance.collection('users').document( user.uid)
        .setData({'id': user.uid, 'apellidos': surname, 'mail': email, 'nombre' : name, 'telefono':phone });
    return user.uid;
  }

  Future<String> currentUser() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user != null ? user.uid : null;
  }

  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }

  Future<String> addUser(String email, String password, String name,  surname, String phone) async {
    Firestore.instance.collection('users').document()
        .setData({ 'apellidos': surname, 'mail': email, 'nombre' : name, 'telefono':phone });
        return null;
  }


}