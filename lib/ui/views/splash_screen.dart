import 'package:flutter/material.dart';
import 'package:flutter_app_demo/core/base/base_view.dart';
import 'package:flutter_app_demo/core/viewmodels/views/splash_screen_view_model.dart';
import 'package:flutter_app_demo/ui/constrants/app_images.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<SplashScreenViewModel>(
        model: SplashScreenViewModel(context),
        onModelReady: (model) => model.checkIsFirstTime(),
        child: Container(
          padding: EdgeInsets.all(50.0),
          color: Colors.white,
          child: Center(
            child: Image.asset(
              ic_splash,
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        builder: (context, model, child) => child);
  }
}
