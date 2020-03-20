import 'package:flutter/cupertino.dart';
import 'package:flutter_app_demo/core/router/router.dart';
import 'package:flutter_app_demo/core/services/authentication_services.dart';
import 'package:flutter_app_demo/core/util/utils.dart';
import 'package:flutter_app_demo/ui/constrants/app_strings.dart';
import 'package:flutter_app_demo/ui/widgets/dialog_custom.dart';

class LoginViewModel extends ChangeNotifier{
  AuthServices _authServices = AuthServices();
  BuildContext _context;

  LoginViewModel(BuildContext context) {
    this._context = context;
  }

  login(String email, String password) async{
    showLoadingDialog(_context);
    dynamic result = await _authServices.signInWithEmail(email, password);
    if(result == null){
      Navigator.pop(_context);
      showMessageDialog(_context, description: Utils.getString(_context, txt_login_fail), onPress: () => Navigator.pop(_context));
    }
    else{
      Navigator.pop(_context);
      Navigator.pushReplacementNamed(_context, Router.home);
    }
  }
}