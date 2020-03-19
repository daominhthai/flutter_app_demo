import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app_demo/core/models/user.dart';

class AuthServices{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userCustom(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  Future sinInAnon() async{
    try{
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userCustom(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  Future registerWithEmail(String email, String password) async{
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userCustom(user);
    }catch(e){

    }
  }

  Future signInWithEmail(String email, String password) async{
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userCustom(user);
    }catch(e){

    }
  }
}