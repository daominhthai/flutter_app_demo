import 'package:flutter/cupertino.dart';
import 'package:flutter_app_demo/core/router/router.dart';
import 'package:flutter_app_demo/core/services/authentication.dart';
import 'package:flutter_app_demo/core/util/utils.dart';
import 'package:flutter_app_demo/ui/constrants/app_strings.dart';
import 'package:flutter_app_demo/ui/widgets/dialog_custom.dart';

class RegisterViewModel extends ChangeNotifier{
  AuthServices _authServices = AuthServices();
  BuildContext _context;

  RegisterViewModel(BuildContext context) {
    this._context = context;
  }

  register(String email, String password) async{
    dynamic result = await _authServices.registerWithEmail(email, password);
    if(result == null){
      showMessageDialog(_context,
          description: Utils.getString(_context, txt_register_fail,),
          onPress: () => Navigator.pop(_context)
      );
    }else{
      showMessageDialog(_context,
          title: Utils.getString(_context, txt_register_success),
          onPress: () => Navigator.pushReplacementNamed(_context, Router.login));
    }
  }
}