import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_demo/core/router/router.dart';

class HomeViewModel extends ChangeNotifier{
  BuildContext _context;

  HomeViewModel(BuildContext context) {
    this._context = context;
  }

  logout() async{
    await FirebaseAuth.instance.signOut();
    Navigator.pushNamedAndRemoveUntil(_context, Router.login, (Route<dynamic> route) => false);
  }
}