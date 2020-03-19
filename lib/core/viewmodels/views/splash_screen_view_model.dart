import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_demo/core/router/router.dart';

class SplashScreenViewModel extends ChangeNotifier{
  BuildContext _context;

  SplashScreenViewModel(BuildContext context) {
    this._context = context;
  }

  checkIsFirstTime() async{
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    if(user == null){
      Navigator.pushReplacementNamed(_context, Router.login);
    }else{
      Navigator.pushReplacementNamed(_context, Router.home);
    }
  }
}
