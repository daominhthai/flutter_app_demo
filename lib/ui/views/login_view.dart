import 'package:flutter/material.dart';
import 'package:flutter_app_demo/core/base/base_view.dart';
import 'package:flutter_app_demo/core/router/router.dart';
import 'package:flutter_app_demo/core/util/utils.dart';
import 'package:flutter_app_demo/core/viewmodels/views/login_view_model.dart';
import 'package:flutter_app_demo/ui/constrants/app_images.dart';
import 'package:flutter_app_demo/ui/constrants/app_strings.dart';
import 'package:flutter_app_demo/ui/widgets/dm_button.dart';
import 'package:flutter_app_demo/ui/widgets/dm_text.dart';
import 'package:flutter_app_demo/ui/widgets/dm_text_field.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final emailKey = new GlobalKey<DMTextFieldState>();
  final passKey = new GlobalKey<DMTextFieldState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: () {
        Utils.closeKeyboard(context);
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: MediaQuery.of(context).size.height * 0.35,
                  child: Image.asset(
                    ic_splash,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Container(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: DMTextField(emailController,
                        title: txt_email,
                        key: emailKey,
                        isValidate: true,
                        regExp: RegExp(Utils.emailPattern),
                        errMess: "Enter valid email")),
                Container(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: DMTextField(passwordController,
                        title: txt_password,
                        obscureText: true,
                        isValidate: true,
                        key: passKey)),
                Builder(
                  builder: (context) => Container(
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: BaseView<LoginViewModel>(
                        model: LoginViewModel(context),
                        onModelReady: (model) => {},
                        builder: (context, model, child) => DMButton(
                          Utils.getString(context, txt_login_button),
                          width: MediaQuery.of(context).size.width,
                          onPress: () {
                            if(emailController.text.isEmpty || passwordController.text.isEmpty){
                              final snackBar = SnackBar(
                                content: DMText(
                                  Utils.getString(context, txt_request_type_info),
                                  style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              );
                              Scaffold.of(context).showSnackBar(snackBar);
                            }else{
                              LoginViewModel(context).login(emailController.text, passwordController.text);
                            }
                          },
                        ),
                      )
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: DMButton(
                    Utils.getString(context, txt_register_button),
                    width: MediaQuery.of(context).size.height,
                    onPress: () {
                      Navigator.pushNamed(context, Router.register);
                    },
                  ),
                ),
              ],
            ),
          ),
        )
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
}