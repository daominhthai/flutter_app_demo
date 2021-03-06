import 'package:flutter/material.dart';
import 'package:flutter_app_demo/core/base/base_view.dart';
import 'package:flutter_app_demo/core/util/utils.dart';
import 'package:flutter_app_demo/core/viewmodels/views/login_view_model.dart';
import 'package:flutter_app_demo/core/viewmodels/views/register_view_model.dart';
import 'package:flutter_app_demo/ui/constrants/app_images.dart';
import 'package:flutter_app_demo/ui/constrants/app_strings.dart';
import 'package:flutter_app_demo/ui/widgets/app_bar_custom.dart';
import 'package:flutter_app_demo/ui/widgets/dm_button.dart';
import 'package:flutter_app_demo/ui/widgets/dm_text.dart';
import 'package:flutter_app_demo/ui/widgets/dm_text_field.dart';

class RegisterView extends StatefulWidget {
  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final emailKey = new GlobalKey<DMTextFieldState>();
  final passKey = new GlobalKey<DMTextFieldState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        appBar: appBarCustom(context,
            () => Navigator.pop(context), () => {}, Utils.getString(context, txt_title_register), Icons.arrow_back, null),
          backgroundColor: Colors.white,
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.height * 0.3,
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
                            Utils.getString(context, txt_title_register),
                            width: MediaQuery.of(context).size.height,
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
                                RegisterViewModel(context).register(emailController.text, passwordController.text);
                              }
                            },
                          ),
                        )
                    ),
                  )
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
    emailController.text = '';
    passwordController.text = '';
    emailController.dispose();
    passwordController.dispose();
  }
}